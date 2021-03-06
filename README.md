# Hybrid MPI-OpenACC/OpenMP

This is a Fortran code, in which the hybrid MPI-OpenACC/OpenMP is implemented. The implementation is based on solving Laplace equation in two-dimension (2D).

The code can be run on NVIDIA and AMD GPU-hardwares and have been tested for both NVHPC and Cray compilers. The code is valid for both MPI-OpenACC and MPI-OpenMP.

# Compilation process

The code can be compiled on different HPC systems.

- On AMD-GPU with Cray compiler: 

* MPI-OpenMP
``` bash
ftn -eZ -D_OPENMP -fopenmp laplace.mpiomp.amd laplace_gpu.f90
```
or 
``` bash
ftn -eZ -D_OPENMP -homp laplace.mpiomp.amd laplace_gpu.f90
``` 
* MPI-OpenACC
``` bash
ftn -eZ -D_OPENACC -hacc laplace.mpiacc.amd laplace_gpu.f90
``` 
- On NVIDIA with NVHPC compiler

* MPI-OpenMP
``` bash
mpif90 -cpp -D_OPENMP -mp=gpu -Minfo=mp -o laplace.mpiomp.nvidia laplace_gpu.f90
``` 
* MPI-OpenACC
``` bash
mpif90 -cpp -D_OPENACC -fast -acc -Minfo=accel -o laplace.mpiacc.nvidia laplace_gpu.f90
``` 

Here is an example of a Slurm script for running the code:
```bash
#!/bin/bash -l
#SBATCH --job-name=lap-mpiacc
#SBATCH --account=<project_account>
#SBATCH --time=00:04:00
#SBATCH --partition=eap
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --gpus=4
#SBATCH --gpus-per-node=4

#in the case of multithreaded OMP
##export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

#GPU-aware MPI
export MPICH_GPU_SUPPORT_ENABLED=1

srun ./laplace.mpiacc
```
