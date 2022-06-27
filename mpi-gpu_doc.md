# Hybrid GPU-programming: Combining MPI with GPU-directive models

# Summary 

Parallel computing involving communication between heterogenous systems, especially CPU (central processing unit) and GPU (graphics processing unit), permits to improve the performance of the computation on modern HPC (high-performance computing) systems by many orders of magnitude (see …). This in turn allows us to address large scientific computational problems, which would not be possible using conventional CPU-based approaches. Here, although the GPU-directive programming models OpenACC and OpenMP asynchronous offer the potential to carry out computations across multiple GPUs, the partition of the computation is limited to a single GPU node. Extending the computation to explore multiple GPU nodes requires combining MPI (message passing interface) with either OpenACC or OpenMP application programming interfaces (APIs). Note that CUDA is another alternative. This is not addressed in this tutorial; it will however be the subject of an ulterior tutorial. 

Combining MPI with OpenACC or OpenMP offloading APIs offers the potential to fully utilizing the capacity of multiple GPUs within multiple GPU partitions in modern clusters and supercomputers, thus rendering the HPC applications efficient. This tutorial is thus motivated by the need of guiding users, who are familiar with MPI, in porting their MPI-codes to GPU systems and towards exploring exascale platforms, such as the supercomputer LUMI. 

As we will show, this multi-GPU approach has the potential of reducing the computing time caused by transferring data via the host-memory during heterogenous communications. Here instead the MPI-library can directly access the GPU-device memory, thus rending the performance effective (efficient).

By the end of this tutorial, we expect the users to learn about

- How to implement a mixture of the low-level MPI with the OpenACC or OpenMP APIs.    
- MPI implementation with the GPU-direct/indirect memory access.


This tutorial is organized as follows: In section I, we describe the implementation of the low-level MPI alone using an application based on solving the Laplace equation. In section II, we extend the MPI-application to incorporate a GPU approach. This is done by combining MPI with OpenACC/OpenMP AIPs. Here we will address both accelerator and non-accelerator -aware MPI-library (i.e. MPI with direct memory access vs MPI with indirect memory access). Section III is devoted to the performance testing. Section II concludes the tutorial.

```{contents} Table of Contents
```

#### Table of Contents

- [Summary](#summary)
- [Implementation of MPI](#implementation-of-mpi)
- [Implementation of MPI-OpenACC and -OpenMP offloading](#implementation-of-mpi-openacc-and--openmp-offloading)
- [Performance testing](#performance-testing)
- [Conclusion](#conclusion)

(implementation-mpi)=
# Implementation of MPI 

MPI programming is widely used in the scientific community for intensive computing that requires distributed memory among multiple nodes.  

(implementation-mpi-acc-omp)=
# Implementation of MPI-OpenACC and -OpenMP offloading
## GPU-non-aware MPI
### The hybrid MPI-OpenACC

### The hybrid MPI-OpenMP offloading

## GPU-aware MPI
### The hybrid MPI-OpenACC

### The hybrid MPI-OpenMP offloading

(performance-testing)=
# Performance testing

(conclusion)=
# Conclusion
