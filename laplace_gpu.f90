program laplace_gpu

      use mpi
#ifdef _OPENACC
       use openacc
#endif
#ifdef _OPENMP
       use omp_lib
#endif

      implicit none

       integer status(MPI_STATUS_SIZE)

       integer :: i,j,k,ii
       integer :: iter,count_rate, count_max,count
       integer :: myid,ierr,nproc,nxp,nyp,tag,tag1,tag2,nsend
       integer, parameter :: nx=8192,ny=nx,max_iter=2000
       double precision, parameter    :: pi=4d0*datan(1d0)
       real, parameter    :: error=0.05
       double precision               :: max_err,time_s,&
                                         d2fx,d2fy,max_err_part
       real               :: t_start,t_final
       double precision, allocatable :: f(:,:),f_k(:,:),errin(:)
       double precision, allocatable :: f_send(:,:),f_full(:,:)

#if defined(_OPENACC) || defined(_OPENMP)
      integer(kind=acc_device_kind) deviceType
      integer :: myDevice,numDevice,host_rank,host_comm
#endif
#ifdef _OPENMP
      integer :: omp_get_num_devices,numDevice,&
                 omp_get_device_num
#endif      
       !MPI starts
        ! Initialise OpenMPI communication.
        call MPI_INIT(ierr)
        ! Get number of active processes (from 0 to nproc-1).
        call MPI_COMM_SIZE(MPI_COMM_WORLD, nproc, ierr )
        ! Identify the ID rank (process).
        call MPI_COMM_RANK(MPI_COMM_WORLD, myid, ierr )

        t_start = MPI_WTIME()

        if (mod(nx,nproc).ne.0) then
           if (myid.eq.0) write(*,*) 'nproc has to divide nx'
           stop
        else
           nxp = nx/nproc
        endif
        if (mod(ny,nproc).ne.0) then
           if (myid.eq.0) write(*,*) 'nproc has to divide ny'
           stop
        else
           nyp = ny/nproc
        endif

        if(myid.eq.0) then
          print*,'--nbr of proc', nproc
          write(*,*)'--nx,ny',nx,ny
          write(*,*)'--nbr of elmts on each proc, nyp=ny/nproc', nyp
        endif

        allocate(f(0:nx+1,0:nyp+1)); allocate(f_k(1:nx,1:nyp))
        allocate(errin(nproc))

!Generate the Initial Conditions (ICs)
!Distribute the ICs over all processes using the operation MPI_Scatter

     tag1=2020; tag2=2021
     tag = 2022; nsend = (nx+2)*(nyp+2)
      allocate(f_send(0:nx+1,0:nyp+1))

     if(myid.eq.0) then

       f_send = 0d0
       CALL RANDOM_NUMBER(f_send(2:nx-1,2:ny-1))
      endif


      call MPI_Scatter(f_send(0:nx+1,0:ny+1),nsend,MPI_DOUBLE_PRECISION,&
                      f(0:nx+1,0:nyp+1), nsend,MPI_DOUBLE_PRECISION,&
                      0,MPI_COMM_WORLD, ierr)

      call MPI_Barrier(MPI_COMM_WORLD, ierr)


      iter = 0; max_err=1.0
      
      if(myid.eq.0) then
         print*,""
         print*, "--Start iterations",iter
         print*,""
      endif

!Set a device: Determine which processes are on each node
!such that each process will be connected to a GPU-device

!!Split the world communicator into subgroups of commu, each of which
!contains processes that run on the same node, and which can create a shared
!memory region (via the type MPI_COMM_TYPE_SHARED).
!The call returns a new communicator "host_comm", which is created by
!each subgroup.
#if defined(_OPENACC) || defined(_OPENMP)
      call MPI_COMM_SPLIT_TYPE(MPI_COMM_WORLD, MPI_COMM_TYPE_SHARED, 0,&
                               MPI_INFO_NULL, host_comm,ierr)
      call MPI_COMM_RANK(host_comm, host_rank,ierr)
      
      myDevice = host_rank
#endif

#ifdef _OPENACC
!returns the device type to be used
      deviceType = acc_get_device_type()

!returns the number of devices available on the host
      numDevice = acc_get_num_devices(deviceType)

!sets the device number and the device type to be used
      call acc_set_device_num(myDevice, deviceType)
#endif

#ifdef _OPENMP
!returns the device number of the device on which the calling thread is
!executing
     deviceType = omp_get_device_num()
!returns the number of devices available for offloading.
     numDevice = omp_get_num_devices()
!sets the device number to use in device constructs by setting the
!initial value of the default-device-var 

     call omp_set_default_device(myDevice)
#endif

#if defined(_OPENACC) || defined(_OPENMP)
      if (numDevice.lt. 1) then
         print *, "--ERROR: There are no devices available on this host.&
              my rank is", myid, "I stop"
         stop
      endif
      if (numDevice .lt. host_rank) then
         if (myid.eq.nproc-1) then
         print *, "--WARNING: The number of processes is greater then the number &
             of GPUs. My rank is", myid
         endif
      endif

       if(myid.eq.0)print*, "--Number of devices per node:", numDevice
       if(myid.eq.0)print*,""

       print*, "--MPI rank", myid, "is connected to GPU", myDevice
#endif

#ifdef _OPENACC
!$acc data copyin(f) copyout(f_k) 
#endif
#ifdef _OPENMP
!$omp target data map(to:f) map(from:f_k)
#endif

       do while (max_err.gt.error.and.iter.le.max_iter)

!copy data from GPU to CPU
#ifdef _OPENACC
!!$acc update host(f) 
!$acc host_data use_device(f)
#endif
#ifdef _OPENMP
!$omp target update device(myDevice) from(f)
!!$omp target update mapfrom(f)
!!$omp target data use_device_ptr(ptr-list)
!!structured block
!!$omp end target data
#endif

!transfer the boundaries array to the neighbouring proc
!send f(:,nyp) from myid-1 to be stored in f(:,0) in myid+1
         if(myid.lt.nproc-1) then
          call MPI_Send(f(:,nyp),(nx+2)*1,MPI_DOUBLE_PRECISION,myid+1,tag1,&
                       MPI_COMM_WORLD, ierr)
         endif

!receive f(:,0) from myid-1
         if(myid.gt.0) then
          call MPI_Recv(f(:,0),(nx+2)*1,MPI_DOUBLE_PRECISION,myid-1, &
                      tag1,MPI_COMM_WORLD, status,ierr)
         endif

!send f(:,1) from myid+1 to be stored in f(:,nyp+1) in myid-1
         if(myid.gt.0) then
          call MPI_Send(f(:,1),(nx+2)*1,MPI_DOUBLE_PRECISION,myid-1,tag2,&
                       MPI_COMM_WORLD, ierr)
         endif

!receive f(:,npy+1) from myid-1
        if(myid.lt.nproc-1) then
         call MPI_Recv(f(:,nyp+1),(nx+2)*1,MPI_DOUBLE_PRECISION,myid+1, &
                      tag2,MPI_COMM_WORLD, status,ierr)
        endif

!update data from CPU to GPU
#ifdef _OPENACC
!!$acc update device(f) 
!$acc end host_data
!$acc parallel loop present(f,f_k) collapse(2)
#endif
#ifdef _OPENMP
!$omp target update device(myDevice) to(f)
!!$omp target update mapto(f)
!$omp target teams distribute parallel do collapse(2) schedule(static,1)         
#endif
        do j=1,nyp
            do i=1,nx
               d2fx = f(i+1,j) + f(i-1,j)
               d2fy = f(i,j+1) + f(i,j-1)
               f_k(i,j) = 0.25*(d2fx + d2fy)
             enddo
          enddo
#ifdef _OPENACC
!$acc end parallel
#endif
#ifdef _OPENMP
!$omp end target teams distribute parallel do
#endif

          max_err_part=0.

#ifdef _OPENACC
!$acc parallel loop present(f,f_k) collapse(2) reduction(max:max_err_part)
#endif
#ifdef _OPENMP
!$omp target teams distribute parallel do reduction(max:max_err_part) collapse(2) schedule(static,1) firstprivate(max_err_part)
#endif
          do j=1,nyp
            do i=1,nx
               max_err_part = max(dabs(f_k(i,j) - f(i,j)),max_err_part)
               f(i,j) = f_k(i,j)
            enddo
          enddo
#ifdef _OPENACC
!$acc end parallel
#endif
#ifdef _OPENMP
!$omp end target teams distribute parallel do
#endif

!max_err_part is copied back to the CPU-host by default
         call MPI_ALLREDUCE(max_err_part,max_err,1,&
              MPI_DOUBLE_PRECISION,MPI_MAX, MPI_COMM_WORLD,ierr )

          if(myid.eq.0) then
            if(mod(iter,20).eq.0 ) write(*,'(i5,f10.6)') iter,max_err
          endif

          iter = iter + 1

        enddo
#ifdef _OPENACC
!$acc end data
#endif
#ifdef _OPENMP
!$omp end target data
#endif

       if(myid.eq.0) write(*,'(i5,f10.6)') iter,max_err

        call MPI_Barrier(MPI_COMM_WORLD, ierr)

        t_final = MPI_WTIME()
        time_s = t_final - t_start

       if(myid.eq.0)print*, '--Time it takes (s)', time_s

       if(myid.eq.0) then
         print*, '--Job is completed successfully--'
         print*,''
       endif

!to check the result
       allocate(f_full(nx,ny))
       call MPI_Gather(f_k, nx*nyp, MPI_DOUBLE_PRECISION, &
                      f_full, nx*nyp, MPI_DOUBLE_PRECISION, 0, &
                      MPI_COMM_WORLD, ierr)

       if(myid.eq.0) then
        do j=1,ny
           write(111,*)j,sum(f_full(:,j))
        enddo
        print*,"--Sum",sum(f_full(:,:))/nx/2
       endif

       deallocate(f_full)

       call MPI_FINALIZE( ierr )

       end
