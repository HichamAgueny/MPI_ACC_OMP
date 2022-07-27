# Hybrid GPU-programming: Integrating MPI with GPU-directive models in a GPU-Direct approach

(summary)=
# Summary 

We present a descriptive implementation of a hybrid approach in which the MPI (message passing interface) communication framework is combined with either OpenACC or OpenMP application programming interfaces (APIs). The implementation targets a mini-application based on solving the 2D (two-dimension)-Laplace equation. A special focus will be on sending and receiving data that reside in a GPU-device memory. Here the data can be either moved between a pair of GPU-devices with the hardware support or can pass through a CPU-host memory. These two scenarios are referred to as GPU-aware MPI and GPU-non-aware MPI, respectively. Both scenarios will be addressed in the hybrid **MPI-OpenACC** and **MPI-OpenMP** models.  

By the end of this tutorial, we expect the users to learn about

- Implementing MPI alone using a blocking mode of communication.  
- Implementing the hybrid **MPI-OpenACC** and **MPI-OpenMP** models, and specifically: 
  - Defining the concept of direct memory access.
  - Setting up a GPU-device to be assigned to an MPI rank.   
  - Implementing MPI with the GPU-direct/without direct memory access.
  - Compiling the hybrid **MPI-OpenACC** and **MPI-OpenMP** applications on different HPC systems.

(introduction)=
# Introduction

Parallel computing involving communication between heterogenous systems, especially CPU (central processing unit) and GPU (graphics processing unit), permits to improve the performance of the computation on modern HPC (high-performance computing) systems. This in turn allows us to address large scientific computational problems, which would not be possible using conventional CPU-based approaches. Such computational problems can benefit from available GPU-programing models to further accelerate the computation over multiple GPUs. Here, although the asynchronous GPU-directive programming models (i.e. OpenACC and OpenMP asynchronous) offer the potential to carry out computations across multiple GPUs, the partition of the computation is limited to a single GPU node. Extending the computation to explore multiple GPU nodes requires combining MPI (message passing interface) with either OpenACC or OpenMP application programming interfaces (APIs). Note that CUDA is another alternative. This is not addressed in this tutorial; it will however be the subject of an ulterior tutorial. 

Integrating MPI with OpenACC or OpenMP offloading APIs offers the potential to fully utilizing the capacity of multiple GPUs within multiple GPU partitions in modern clusters and supercomputers. Moreover, it has the advanatge of reducing the computing time caused by transferring data via the host-memory during heterogenous communications, thus rendering the HPC applications efficient. This tutorial is thus motivated by the need of guiding users, who are familiar with MPI, in porting their MPI-based codes to heterogenous systems and towards exploring exascale platforms, such as the [supercomputer LUMI](https://www.lumi-supercomputer.eu/).

Here we will cover two scenarios: a scenario in which an MPI library can directly access a GPU-device memory (i.e GPU-aware MPI); and a scenario in which there is no interaction between an MPI library and a GPU-device (i.e. GPU-non-aware MPI). The implementation will be provided for both the hybrid **MPI-OpenACC** and **MPI-OpenMP** models.

This descriptive tutorial is organized as follows: In section I, we describe the implementation of the low-level MPI alone using an application based on solving the Laplace equation. In section II, we extend the MPI-application to incorporate a GPU approach. This is done by combining MPI with OpenACC/OpenMP AIPs. Here we will address both GPU-accelerator and non-accelerator -aware MPI library (i.e. MPI with direct memory access vs MPI without direct memory access). Section III is devoted to the performance analysis. Section II concludes the tutorial.

```{contents} Table of Contents
```

#### Table of Contents

- [Summary](#summary)
- [Introduction](#introduction)
- [Implementation of MPI alone](#implementation-of-mpi-alone)
- [Implementation of MPI-OpenACC and MPI-OpenMP models](#implementation-of-mpi-openacc-and-mpi-openmp-models)
- [Performance analysis](#performance-analysis)
- [Conclusion](#conclusion)

(implementation-mpi-alone)=
# Implementation of MPI alone  

The MPI programming model is widely used in the scientific community for intensive parallel computing that requires distributed memory among multiple nodes. In this section, we implement the low-level [MPI standard](https://www.mpi-forum.org/docs/mpi-4.0/mpi40-report.pdf) approach to parallelise our `Fortran` application, which is based on solving the Laplace equation in a uniform 2D-grid. Details about the numerical method can be found here. 

A starting point here is to generate initial conditions and distribute them among different processes in a communicator group. This is done using the `MPI_Scatter` operation, which distributes the generated data from the processes 0 (root) to processes labeled *myid* (i.e. the rank of an MPI process) defined in the range [*myid=0*, *myid=nproc-1*], where *nproc* is the total number of processes. To be specific, the data, which are initially of dimension *$n_{x}$* x *$n_{y}$* (cf. Fig. 1(a)) are subdivided along the y-direction into sub-arrays of dimension *$n_{x}$* x *$n_{yp}$*, where *$n_{yp}$=$n_{y}$/nproc*, such that each sub-array can be used by each MPI process as shown in Fig. 1(b). 

The initial conditions (ICs) we consider are random and are generated by the routine ` RANDOM_NUMBER`. Note that MPI-programs require incorporating the mpi module (i.e. `use mpi`) or including the header file mpif.h (i.e. `include ‘mpif.h’`). The meaning of each called MPI function is included briefly as a comment in the source code.  

A subsequent step is to iterate the ICs using an appropriate algorithm. We chose Lanczos algorithm as described in our previous [tutorial](https://documentation.sigma2.no/code_development/guides/converting_acc2omp/openacc2openmp.html) (see also [here](https://arxiv.org/abs/2201.11811)). In the iterative scheme, the distributed data along the y-direction needs to be updated; this is because the data at the boundaries of each sub-array in each MPI process are initially set to zero. For instance, computing the new array *f_k(:,1)* requires updating the elements *f(:,0)* on each process; similarly for *f(:,nyp+1)* (see the loop region defined by lines). A key element here is to transfer the data in the boundaries between the neighboring MPI processes at each iteration. This is schematically illustrated in Fig. 2, which in turn is transformed into a few MPI lines using a blocking communication mode characterized by the MPI functions `MPI_Send()` and `MPI_Recv()` (see lines ….). The blocking mode here means that the **send** and **receive** operations do not return until the message data is available to be re-used. In other words, the operations are completed once the message is buffered.  Note that there are three additional blocking modes for the **send** operation. These modes, however, are not addressed in the present documentation. We thus refer to the [MPI documentation](https://www.mpi-forum.org/docs/mpi-4.0/mpi40-report.pdf) for further description. An alternative to the blocking mode is to use a [non-blocking](https://www.mpi-forum.org/docs/mpi-4.0/mpi40-report.pdf) concept. The latter has the advanatge of enabling overlaping between communication and computation. In this type of mode, the MPI-functions `MPI_Send()` and `MPI_Recv()` are replaced with `MPI-Isend()` and `MPI_Irecv()` respectively, and should be followed by the function `MPI_Wait()`.

Updating the data in the boundaries is a key challenge in this example. This ensures the correctness of the computed maximum between the new and the old arrays at each iteration, thus permitting to check the convergence of the results. The computed maximum is done using the `MPI_Allreduce` operation, in which the result is returned to all MPI processes of the specified communicator group. 

To check the correctness of the results, one can compute the sum of all the elements or eventually display the converged data either in 1D or 2D for comparison. For this reason, we introduce the `MPI_Gather` operation, which allows aggregating the data from each MPI process and make them available only in the root process. This option, however, might become time consuming and eventually might lead to segmentation error when increasing the size of the data.

## Compilation process of MPI alone

Here we describe the compilation process of an MPI-application for GNU, Intel and Cray compilers.

- GNU compiler

- Intel compiler

- Cray compiler

(implementation-mpi-acc-omp)=
# Implementation of MPI-OpenACC and MPI-OpenMP models

In this section we extend our MPI-application to incorporate the OpenACC and OpenMP offloading APIs targeting both NVIDIA and AMD GPU-accelerators. The implementation of this hybrid model has the potential of fully utilizing multiple GPUs not only within a single GPU node but it extends to multiple GPU nodes (cf. Fig. 1). A special focus here is to address the concept of MPI with GPU-direct memory access ([GPU-aware MPI](...)) and MPI without GPU-direct access ([GPU-non-aware MPI](...)). In the following we implement this concept for both the hybrid **MPI-OpenACC** and **MPI-OpenMP**. Details about the implementation of OpenACC and OpenMP APIs alone can be found in our previous tutorial [here](https://documentation.sigma2.no/code_development/guides/converting_acc2omp/openacc2openmp.html). In this context, the approach is how to make a GPU-device aware or not aware of the existence of the MPI-library, such that a direct or non-direct access to the library can be accomplished. Before addressing this concept, it is worthwhile defining the mechanism of direct-memory access and introducing how to establish a connection between each MPI rank and a specific GPU-device. Here, we are in the situation in which a host and a device have a distinct memory (i.e. non-shared memory device).

## Direct memory access

[Direct memory access](https://www.sciencedirect.com/topics/computer-science/direct-memory-access) (DMA) is a mechanism by which the data can be transferred between an I/O device and a memory system without an involvement of the processor itself. It thus allows two separated processors to directly access the memory of each other via a network. This has the advantage of reducing latency and increasing throughput, which is relevant particularly for modern HPC systems. As an example, the DMA mechanism is used in data management between a CPU-host and a GPU-device as we shall see later.

## Assigning a MPI rank to a GPU device

Managing multiple GPU-devices by combining MPI and OpenACC or OpenMP APIs requires as a first step assigning each MPI rank to a single GPU-device. In other words, one needs to determine which processes are within a specifc CPU-node that is connecetd with the nearest GPU-node. This permits to minimize latency, and it is particularly relevant when running an application on multiple nodes. This procedure can be done by splitting the world communicator into subgroups of communicators (or sub-communicators), which is done via the routine `MPI_COMM_SPLIT_TYPE()`. Here each sub-communicator contains processes running on the same node. These processes have a shared-memory region defined via the argument `MPI_COMM_TYPE_SHARED` (see [here](https://www.mpi-forum.org/docs/mpi-4.0/mpi40-report.pdf) for more details). Calling the routine `MPI_COMM_SPLIT_TYPE()` returns a sub-communicator "host_comm" created by each subgroup, which in turn can be assigned to a single GPU-device.  

In **OpenACC** API, the host-device connection is established by specifying the runtime library routine `acc_set_device_num(host_rank,deviceType)`. The latter contains two arguments "host_rank" and "deviceType": the first argument determines which device a MPI rank will be assigned to, and the second one returns the GPU-device type to be used. These are indicated by lines ... in the code below. Similarly in **OpenMP** API, the connection is defined via the function `omp_set_default_device(host_rank)`.

## GPU-non-aware MPI library

The MPI implementation without GPU-direct memory access or GPU-non-aware MPI simply means that calling an MPI routine from an OpenACC or OpenMP API requires updating the data before and after the MPI call to ensure the correctness of the data. In this scenario, the data are copied back and forth between the host and the device before and after each MPI call. In the hybrid **MPI-OpenACC**, the procedure is defined by specifying the directive `update host()` for copying the data from the device to the host before the MPI call, and by the directive `update device()` specified after the MPI call for copying the data back to the device. A similar concept is adopted in the hybrid **MPI-OpenMP**. Here, updating the data in connection with the MPI call is done by specifying the directives `update device() from()` and `update device() to()`, respectively, for copying the data from the device to the host and back to the device. This is illustrated in the code below via lines ....

Although this approach is simple to implement, it might lead to a low performance caused by an explicit transfer of data between a host and a device before and after calling an MPI routine. Furthermore, the approach is synchronous, which does not allow overlapping between MPI-based computation and OpenACC/OpenMP operations. An alternative to this approach is to use the GPU-aware MPI as described in the next section. 

## GPU-aware MPI library

The concept of the GPU-aware MPI library is relies on the possibility of moving data that reside in t

pointer to a GPU-device is passed to an MPI call.

To avoid memory copies between CPU-host and GPU-device.

The GPU-aware MPI concept has the advantage of enabling the MPI library to directly access a GPU-device memory without passing through a CPU-host memory. This results in high-throughput and low-latency communications, thus rending computational tasks efficient.

It allows the transfer of data from one GPU to another GPU. GPU-to-GPU communication...although, it is not necessary that the data can be sent from one GPU to another GPU...and that depends on the implemednted library...as other optimized ways invisible to the developer might take place...

In the hybrid **MPI-OpenACC**, the concept is defined by combining the directive `host_data` together with the clause `use_device(list_array)`. This combination enables the access to the arrays listed in the the clause `use_device(list_array)` from the [host](https://www.nvidia.com/docs/IO/116711/OpenACC-API.pdf). The list of arrays, which should be already present on the GPU-device memory, are in turn passed to the MPI routine (i.e. `MPI_Send()` and `MPI_Recv()` in our case). 

The same concept is adopted in the hybrid **MPI-OpenMP**. Here however, the arrays in the synatx `target data use_device_ptr(ptr-list)` must be defined as c-pointers. This requires adding a few lines in the Fortran code to take into consideration the pointer aspect of arrays, as described by lines ....  


## Compilation process of a GPU-hybrid application

(performance-testing)=
# Performance analysis

Experiments are carried out on the cluster [Betzy](https://documentation.sigma2.no/hpc_machines/betzy.html) (4xNVIDIA A100 GPUs connected by NVLink) and [LUMI-EAP](https://docs.lumi-supercomputer.eu/eap/) (Early Access Platform) (4xAMD MI100 GPUs connected by the Infinity Fabric Link).

(conclusion)=
# Conclusion

We have presented an overview on GPU-hybrid programming by integrating GPU-directive models (i.e. OpenACC and OpenMP APIs) with the MPI libraray. This was implemented via an application based on sloving the 2D-Laplace equation. The approach adopted here allows, in general, to utilise multiple GPU-devices not only within a single GPU node but it extends to multiple GPU partitions. It thus allows intra-process communications (i.e. GPU-to-CPU) and inter-process communications (i.e. GPU-to-GPU). In particular, we have addressed both GPU-non-aware MPI and GPU-aware MPI library approaches. The latter approach has the advantage of enabling a direct interaction between an MPI library and a GPU-device memmory. This has been shown to increase throughput and reduce latency and thus allowing further improvement of performance.  


# References

Here are some relevant references: 

- [MPI documentation](https://www.mpi-forum.org/docs/mpi-4.0/mpi40-report.pdf)

- [OpenACC for Programmers: Concepts and Strategies](https://www.oreilly.com/library/view/openacc-for-programmers/9780134694306/)

- [Tutorials on OpenACC and OpenMP offloading](https://documentation.sigma2.no/code_development/guides/converting_acc2omp/openacc2openmp.html)

- [OpenACC course](https://github.com/HichamAgueny/GPU-course)
