Last login: Mon Aug 15 13:26:41 on ttys009
(base) hichamagueny@c02z6381lvdl ~ % ssh -iid_rsa_lumi hiagueny@lumi.csc.fi
Enter passphrase for key 'id_rsa_lumi': 
 *  ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒  *   *      *  
                                                       *      *  *    
   * ████       ████   ████   █████▄    ▄█████   ████     *     *     
 *   ████       ████   ████   ████ █▄  ▄█ ████   ████         ,    *, 
     ████       ████   ████   ████  ████  ████   ████  *   *  |\_ _/| 
     ████       ████   ████   ████   ▀▀   ████   ████   *    .| ." ,| 
  *  ████       ████   ████   ████        ████   ████        /(  \_\) 
     ████       ████   ████   ████        ████   ████       /    ,-,| 
 *   ████▄▄▄▄▄  ▀███   ███▀   ████        ████   ████ *    * /      \ 
     █████████    ▀▀███▀▀     ████        ████   ████  * ,/  (      * 
 *                                                     ,/       |  /  
  * ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒/    \  * || |  
                 *              *               ,_   (       )| || |  
*   *    *    The Supercomputer of the North  * | `\_|   __ /_| || |  
        **               *            * *       \_____\______)\__)__) 
   .********----------*******-------******----------****************. 
   |User guide and support _________________________________________| 
   |         https://docs.lumi-supercomputer.eu                     | 
 * |         https://lumi-supercomputer.eu/user-support             | 
** `--*****-------------------***-----------------------*****-------' 
/usr/bin/manpath: can't set the locale; make sure $LC_* and $LANG are correct
   .Announcements---------------------------------------------------.
   | During the late June - early July downtime LUMI-G was          |
 * | integrated and is now under testing. The LUMI-C interconnect   |
   | was upgraded to 200 Gbit/s. The system software received many  |
*  | updates and the 22.06 programming environment was installed.   |
   |                                                                |
 * | LUMI/21.12 is now the recommended LUMI software stack but      |
   | users are encouraged to switch to LUMI/22.06 as soon as it     |
   | satisfies their needs. LUMI/21.08 is currently hidden as it    |
*  | does not fully function but may reappear. You can still load   |
   | the modules but at your own risk (and you will get             |
   | replacements instead).                                         |           
 * |                                                                |
*  | Further system software updates are planned for August and     |
*  | September to improve performance on LUMI-G and stability on    |
   | LUMI as a whole. These updates are partly rolled out while the |
   | system is online. However, as this is the first time this is   |
 * | done, unexpected problems can occur.                           | 
   |                                                                |
  *| The flash file system on /flash/project_<...> is unavailable   |
   | until the next upgrade scheduled for August or later given     |
   | the problems that still exist after the last upgrade.          |
*  .Notes-----------------------------------------------------------.
   | Make sure one of the following modules is loaded to have the   |
 * | full LUMI experience:                                          |
   | - CrayEnv: The Cray software stack enriched with some          |
   |   additional tools not installed by default in the OS          |
*  | - LUMI: The extensible LUMI software stack that you can use    |
   |   as a basis for additional software installs with EasyBuild   |
** |   and other tools.                                             |
** `--*****-------------------***-----------------------*****-------'

Did you know?
*************
You can check your quota on LUMI using the lumi-workspaces command that you
can find in the lumi-workspaces module in the LUMI and CrayEnv environments.

hiagueny@uan03:~> 
hiagueny@uan03:~> groups
pepr_hiagueny project_465000096
hiagueny@uan03:~> cd /scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC/
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> vi slurm-13873
slurm-1387378.out  slurm-1387381.out  
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> vi slurm-1387378.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> mv slurm-138738
slurm-1387381.out  slurm-1387389.out  
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> mv slurm-1387381.out outmpiacc_Noaware.dat
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> vi script_mpiacc.slurm 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> vi laplace_mpigpu.f90 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> cp laplace_mpigpu.f90 laplace_eap.f90
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> vi laplace_eap.f90 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> vi laplace_eap.f90 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> vi compile_cce.sh 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> ftn -eZ -D_OPENACC -hacc -o laplace.eap laplace_eap.f90 
ftn-1350 ftn: WARNING in command line
  Command line option "-hacc" is being ignored because an accelerator target has not been specified.

       CALL RANDOM_NUMBER(f_t(2:nx-1,2:ny-1)) 
                          ^                    
ftn-232 ftn: ERROR LAPLACE_EAP, File = laplace_eap.f90, Line = 84, Column = 27 
  IMPLICIT NONE is specified in the local scope, therefore an explicit type must be specified for function "F_T".
                               ^               
ftn-1725 ftn: ERROR LAPLACE_EAP, File = laplace_eap.f90, Line = 84, Column = 32 
  Unexpected syntax while parsing the CALL statement : ", or )" was expected but found ":".
                                              ^
ftn-1725 ftn: ERROR LAPLACE_EAP, File = laplace_eap.f90, Line = 84, Column = 47 
  Unexpected syntax while parsing the CALL statement : ", or )" was expected but found "EOS".

Cray Fortran : Version 14.0.1 (20220526224428_3a8780657c742829e80f36338fb6ec6578642bb7)
Cray Fortran : Compile time:  0.0328 seconds
Cray Fortran : 312 source lines
Cray Fortran : 3 errors, 1 warnings, 0 other messages, 0 ansi
Cray Fortran : "explain ftn-message number" gives more information about each message.
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> vi laplace_eap.f90 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> ftn -eZ -D_OPENACC -hacc -o laplace.eap laplace_eap.f90 
ftn-1350 ftn: WARNING in command line
  Command line option "-hacc" is being ignored because an accelerator target has not been specified.
/opt/cray/pe/cce/14.0.1/binutils/x86_64/x86_64-pc-linux-gnu/bin/ld: /tmp/pe_62016/laplace_eap_1.o: in function `main':
The Cpu Module:(.text+0x779): undefined reference to `acc_get_device_type'
/opt/cray/pe/cce/14.0.1/binutils/x86_64/x86_64-pc-linux-gnu/bin/ld: The Cpu Module:(.text+0x78b): undefined reference to `acc_get_num_devices'
/opt/cray/pe/cce/14.0.1/binutils/x86_64/x86_64-pc-linux-gnu/bin/ld: The Cpu Module:(.text+0x79c): undefined reference to `acc_set_device_num'
/opt/cray/pe/cce/14.0.1/binutils/x86_64/x86_64-pc-linux-gnu/bin/ld: /tmp/pe_62016/laplace_eap_1.o:(.data+0x508): undefined reference to `openacc_'
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> module load craype-accel-amd-gfx90a
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> ftn -eZ -D_OPENACC -hacc -o laplace.eap laplace_eap.f90 
Warning: ROCM_PATH is not set!!!
lld: error: undefined hidden symbol: __ockl_get_local_size
>>> referenced by /tmp/cooltmpdir-uLYOPi/laplace.eap-cce-openmp__llc.amdgpu:(laplace_eap_$ck_L212_1)
>>> referenced by /tmp/cooltmpdir-uLYOPi/laplace.eap-cce-openmp__llc.amdgpu:(laplace_eap_$ck_L212_1)
>>> referenced by /tmp/cooltmpdir-uLYOPi/laplace.eap-cce-openmp__llc.amdgpu:(laplace_eap_$ck_L236_2)
>>> referenced 3 more times

lld: error: undefined symbol: __ockl_get_num_groups
>>> referenced by /tmp/cooltmpdir-uLYOPi/laplace.eap-cce-openmp__llc.amdgpu:(laplace_eap_$ck_L212_1)
>>> referenced by /tmp/cooltmpdir-uLYOPi/laplace.eap-cce-openmp__llc.amdgpu:(laplace_eap_$ck_L212_1)
>>> referenced by /tmp/cooltmpdir-uLYOPi/laplace.eap-cce-openmp__llc.amdgpu:(laplace_eap_$ck_L236_2)
>>> referenced 5 more times
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> module load cray-mpich
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> module load rocm
Lmod has detected the following error:  These module(s) or
extension(s) exist but cannot be loaded as requested: "rocm"
   Try: "module spider rocm" to see how to load the module(s).



hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> ftn -eZ -D_OPENACC -hacc -o laplace.eap laplace_eap.f90 
Warning: ROCM_PATH is not set!!!
lld: error: undefined hidden symbol: __ockl_get_local_size
>>> referenced by /tmp/cooltmpdir-kTQaHR/laplace.eap-cce-openmp__llc.amdgpu:(laplace_eap_$ck_L212_1)
>>> referenced by /tmp/cooltmpdir-kTQaHR/laplace.eap-cce-openmp__llc.amdgpu:(laplace_eap_$ck_L212_1)
>>> referenced by /tmp/cooltmpdir-kTQaHR/laplace.eap-cce-openmp__llc.amdgpu:(laplace_eap_$ck_L236_2)
>>> referenced 3 more times

lld: error: undefined symbol: __ockl_get_num_groups
>>> referenced by /tmp/cooltmpdir-kTQaHR/laplace.eap-cce-openmp__llc.amdgpu:(laplace_eap_$ck_L212_1)
>>> referenced by /tmp/cooltmpdir-kTQaHR/laplace.eap-cce-openmp__llc.amdgpu:(laplace_eap_$ck_L212_1)
>>> referenced by /tmp/cooltmpdir-kTQaHR/laplace.eap-cce-openmp__llc.amdgpu:(laplace_eap_$ck_L236_2)
>>> referenced 5 more times
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> export LD_LIBRARY_PATH=$HIP_LIB_PATH:$LD_LIBRARY_PATH
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> ftn -eZ -D_OPENACC -hacc -o laplace.eap laplace_eap.f90 
Warning: ROCM_PATH is not set!!!
lld: error: undefined hidden symbol: __ockl_get_local_size
>>> referenced by /tmp/cooltmpdir-f1IffC/laplace.eap-cce-openmp__llc.amdgpu:(laplace_eap_$ck_L212_1)
>>> referenced by /tmp/cooltmpdir-f1IffC/laplace.eap-cce-openmp__llc.amdgpu:(laplace_eap_$ck_L212_1)
>>> referenced by /tmp/cooltmpdir-f1IffC/laplace.eap-cce-openmp__llc.amdgpu:(laplace_eap_$ck_L236_2)
>>> referenced 3 more times

lld: error: undefined symbol: __ockl_get_num_groups
>>> referenced by /tmp/cooltmpdir-f1IffC/laplace.eap-cce-openmp__llc.amdgpu:(laplace_eap_$ck_L212_1)
>>> referenced by /tmp/cooltmpdir-f1IffC/laplace.eap-cce-openmp__llc.amdgpu:(laplace_eap_$ck_L212_1)
>>> referenced by /tmp/cooltmpdir-f1IffC/laplace.eap-cce-openmp__llc.amdgpu:(laplace_eap_$ck_L236_2)
>>> referenced 5 more times
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> module load CrayEnv

Lmod is automatically replacing "craype-accel-amd-gfx90a" with
"craype-accel-host".

hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> module load PrgEnv-cray
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> module load craype-accel-amd-gfx90a

Lmod is automatically replacing "craype-accel-host" with
"craype-accel-amd-gfx90a".

hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> module load rocm
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> export LD_LIBRARY_PATH=$HIP_LIB_PATH:$LD_LIBRARY_PATH
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> ftn -eZ -D_OPENACC -hacc -o laplace.eap laplace_eap.f90 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> vi script_mpiacc.slurm 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> sbatch script_mpiacc.slurm 
Submitted batch job 1387409
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> vi slurm-1387409.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> vi laplace_eap.f90 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> ftn -eZ -D_OPENACC -hacc -o laplace.eap laplace_eap.f90 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> rm vb
rm: cannot remove 'vb': No such file or directory
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> rm slurm-1387409.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> sbatch script_mpiacc.slurm 
Submitted batch job 1387426
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> vi slurm-1387426.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> rm slurm-1387426.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> vi laplace_eap.f90 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> ftn -eZ -D_OPENACC -hacc -o laplace.eap laplace_eap.f90 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> sbatch script_mpiacc.slurm 
Submitted batch job 1387427
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> vi slurm-1387427.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> rm slurm-1387427.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> vi laplace_eap.f90 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> ls
compile_cce.sh		       laplace_mpigpu_1.acc.s
compile_gnu.sh		       module_gnu
core			       mpiacc_node_1_1gpus.out
fort.111		       mpiacc_node_1_4gpus.out
laplace.eap		       mpiacc_node_2_8gpus.out
laplace.mpiacc		       mpiomp_node_1_1gpus.out
laplace.mpiacc.Noaware	       mpiomp_node_1_4gpus.out
laplace_acc.f90		       mpiomp_node_2_8gpus.out
laplace_acc_1.acc.o	       outmpiacc_Noaware.dat
laplace_acc_1.acc.s	       script_acc.slurm
laplace_eap.f90		       script_mpi.slurm
laplace_eap.i		       script_mpiacc.slurm
laplace_eap_1.acc.o	       script_mpiaccNoaware.slurm
laplace_eap_1.acc.s	       script_mpiomp.slurm
laplace_mpiacc.i	       slurm-1281408.out
laplace_mpiacc_1.acc.o	       slurm-1282166.out
laplace_mpiacc_1.acc.s	       slurm-1282171.out
laplace_mpigpu.f90	       slurm-1282246.out
laplace_mpigpu.i	       slurm-1282764.out
laplace_mpigpuNoaware.f90      slurm-1283810.out
laplace_mpigpuNoaware.i        slurm-1283827.out
laplace_mpigpuNoaware_1.acc.o  slurm-1283867.out
laplace_mpigpuNoaware_1.acc.s  slurm-1283874.out
laplace_mpigpu_1.acc.o	       slurm-1387378.out
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> cd ../MPI/
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/MPI> ls
compile.sh  laplace.mpi  laplace_mpi.f90  script_mpi.slurm  slurm-1182776.out
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/MPI> vi laplace_mpi.f90 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/MPI> cd ..
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC> ls
ACC		       laplace_mpiomp.f90	  string_point.f03
MPI		       laplace_mpiomp_device.f90  test
OMP		       laplace_mpiomp_v0.f90	  test.f90
a.out		       pointer.f90		  test.mpiomp
compile.sh	       pointer_fptr.f90		  test.mpipointer
compile_mpi_amd.sh     scatter			  testMPIACC.f90
gpu.check	       scatter.f90		  testMPIOMP
gpu_check.c	       script_gpu.slurm		  testMPIOMP.f90
laplace.mpi	       script_mpi.slurm		  testMPIOMP_1.acc.o
laplace.mpiomp	       script_mpiomp.slurm	  testMPIOMP_1.acc.s
laplace.mpiomp.device  slurm-1270239.out	  test_mpipointer.f90
laplace_gpu.f90        slurm-1270244.out
laplace_mpi.f90        slurm-1270245.out
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC> vi scatter.f90 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC> vi testMPI
testMPIACC.f90      testMPIOMP.f90      
testMPIOMP          testMPIOMP_1.acc.s  
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC> vi testMPIACC.f90 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC> vi testMPIACC.f90 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC> cd ACC/      
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> vi laplace_eap.f90 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> ftn -eZ -D_OPENACC -hacc -o laplace.eap laplace_eap.f90 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> vi script_
script_acc.slurm            script_mpiaccNoaware.slurm
script_mpi.slurm            script_mpiomp.slurm
script_mpiacc.slurm         
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> vi script_mpi.slurm 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> vi script_
script_acc.slurm            script_mpiaccNoaware.slurm
script_mpi.slurm            script_mpiomp.slurm
script_mpiacc.slurm         
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> vi script_mpiacc.slurm 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> sbatch script_mpiacc.slurm 
Submitted batch job 1387429
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> vi slurm-1387429.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> rm slurm-1387429.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> vi laplace_eap.f90 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> ftn -eZ -D_OPENACC -hacc -o laplace.eap laplace_eap.f90 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> sbatch script_mpiacc.slurm 
Submitted batch job 1387431
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> vi slurm-1387431.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> rm slurm-1387431.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> vi laplace_eap.f90 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> ftn -eZ -D_OPENACC -hacc -o laplace.eap laplace_eap.f90 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> sbatch script_ 
script_acc.slurm            script_mpiaccNoaware.slurm
script_mpi.slurm            script_mpiomp.slurm
script_mpiacc.slurm         
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> sbatch script_mpiacc.slurm 
Submitted batch job 1387559
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> vi slurm-1387559.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/ACC> cd ../
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC> cd MPI/
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/MPI> ls    
compile.sh  laplace.mpi  laplace_mpi.f90  script_mpi.slurm  slurm-1182776.out
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/MPI> ls
compile.sh  laplace.mpi  laplace_mpi.f90  script_mpi.slurm  slurm-1182776.out
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/MPI> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/MPI> cd ..
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC> ls
ACC		       laplace_mpiomp.f90	  string_point.f03
MPI		       laplace_mpiomp_device.f90  test
OMP		       laplace_mpiomp_v0.f90	  test.f90
a.out		       pointer.f90		  test.mpiomp
compile.sh	       pointer_fptr.f90		  test.mpipointer
compile_mpi_amd.sh     scatter			  testMPIACC.f90
gpu.check	       scatter.f90		  testMPIOMP
gpu_check.c	       script_gpu.slurm		  testMPIOMP.f90
laplace.mpi	       script_mpi.slurm		  testMPIOMP_1.acc.o
laplace.mpiomp	       script_mpiomp.slurm	  testMPIOMP_1.acc.s
laplace.mpiomp.device  slurm-1270239.out	  test_mpipointer.f90
laplace_gpu.f90        slurm-1270244.out
laplace_mpi.f90        slurm-1270245.out
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC> vi testMPIACC.f90 
ACC/                       scatter
MPI/                       scatter.f90
OMP/                       script_gpu.slurm
a.out                      script_mpi.slurm
compile.sh                 script_mpiomp.slurm
compile_mpi_amd.sh         slurm-1270239.out
gpu.check                  slurm-1270244.out
gpu_check.c                slurm-1270245.out
laplace.mpi                string_point.f03
laplace.mpiomp             test
laplace.mpiomp.device      test.f90
laplace_gpu.f90            test.mpiomp
laplace_mpi.f90            test.mpipointer
laplace_mpiomp.f90         testMPIACC.f90
laplace_mpiomp_device.f90  testMPIOMP
laplace_mpiomp_v0.f90      testMPIOMP.f90
pointer.f90                testMPIOMP_1.acc.s
pointer_fptr.f90           test_mpipointer.f90
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC> vi testMPIACC.f90 
ACC/                       scatter
MPI/                       scatter.f90
OMP/                       script_gpu.slurm
a.out                      script_mpi.slurm
compile.sh                 script_mpiomp.slurm
compile_mpi_amd.sh         slurm-1270239.out
gpu.check                  slurm-1270244.out
gpu_check.c                slurm-1270245.out
laplace.mpi                string_point.f03
laplace.mpiomp             test
laplace.mpiomp.device      test.f90
laplace_gpu.f90            test.mpiomp
laplace_mpi.f90            test.mpipointer
laplace_mpiomp.f90         testMPIACC.f90
laplace_mpiomp_device.f90  testMPIOMP
laplace_mpiomp_v0.f90      testMPIOMP.f90
pointer.f90                testMPIOMP_1.acc.s
pointer_fptr.f90           test_mpipointer.f90
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC> vi testMPIACC.f90 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC> ls
ACC		       laplace_mpiomp.f90	  string_point.f03
MPI		       laplace_mpiomp_device.f90  test
OMP		       laplace_mpiomp_v0.f90	  test.f90
a.out		       pointer.f90		  test.mpiomp
compile.sh	       pointer_fptr.f90		  test.mpipointer
compile_mpi_amd.sh     scatter			  testMPIACC.f90
gpu.check	       scatter.f90		  testMPIOMP
gpu_check.c	       script_gpu.slurm		  testMPIOMP.f90
laplace.mpi	       script_mpi.slurm		  testMPIOMP_1.acc.o
laplace.mpiomp	       script_mpiomp.slurm	  testMPIOMP_1.acc.s
laplace.mpiomp.device  slurm-1270239.out	  test_mpipointer.f90
laplace_gpu.f90        slurm-1270244.out
laplace_mpi.f90        slurm-1270245.out
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC> vi compile_mpi_amd.sh 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC> vi compile
compile.sh          compile_mpi_amd.sh  
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC> vi compile.sh 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC> ftn -o test
test                 testMPIACC.f90       testMPIOMP_1.acc.s
test.f90             testMPIOMP           test_mpipointer.f90
test.mpiomp          testMPIOMP.f90       
test.mpipointer      testMPIOMP_1.acc.o   
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC> ftn -o testMPIACC testMPIACC.f90 

!$acc data create(f_k) copyin(f) copyout(f_k)      
                  ^                                 
ftn-676 ftn: ERROR TEST, File = testMPIACC.f90, Line = 34, Column = 19 
  Variable "F_K" is specified in directive clause CREATE and COPYOUT.

Cray Fortran : Version 14.0.1 (20220526224428_3a8780657c742829e80f36338fb6ec6578642bb7)
Cray Fortran : Compile time:  0.0194 seconds
Cray Fortran : 56 source lines
Cray Fortran : 1 errors, 0 warnings, 0 other messages, 0 ansi
Cray Fortran : "explain ftn-message number" gives more information about each message.
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC> ftn -hacc -o testMPIACC testMPIACC.f90 

!$acc data create(f_k) copyin(f) copyout(f_k)      
                  ^                                 
ftn-676 ftn: ERROR TEST, File = testMPIACC.f90, Line = 34, Column = 19 
  Variable "F_K" is specified in directive clause CREATE and COPYOUT.

Cray Fortran : Version 14.0.1 (20220526224428_3a8780657c742829e80f36338fb6ec6578642bb7)
Cray Fortran : Compile time:  0.0178 seconds
Cray Fortran : 56 source lines
Cray Fortran : 1 errors, 0 warnings, 0 other messages, 0 ansi
Cray Fortran : "explain ftn-message number" gives more information about each message.
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC> vi sc
scatter              script_gpu.slurm     script_mpiomp.slurm
scatter.f90          script_mpi.slurm     
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC> vi sc
scatter              script_gpu.slurm     script_mpiomp.slurm
scatter.f90          script_mpi.slurm     
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC> vi scatter.f90 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC> ls
ACC		       laplace_mpiomp.f90	  string_point.f03
MPI		       laplace_mpiomp_device.f90  test
OMP		       laplace_mpiomp_v0.f90	  test.f90
a.out		       pointer.f90		  test.mpiomp
compile.sh	       pointer_fptr.f90		  test.mpipointer
compile_mpi_amd.sh     scatter			  testMPIACC.f90
gpu.check	       scatter.f90		  testMPIOMP
gpu_check.c	       script_gpu.slurm		  testMPIOMP.f90
laplace.mpi	       script_mpi.slurm		  testMPIOMP_1.acc.o
laplace.mpiomp	       script_mpiomp.slurm	  testMPIOMP_1.acc.s
laplace.mpiomp.device  slurm-1270239.out	  test_mpipointer.f90
laplace_gpu.f90        slurm-1270244.out
laplace_mpi.f90        slurm-1270245.out
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC> mkdir TEST
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC> cp testMPIACC.f90 TEST/
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC> cp script_
script_gpu.slurm     script_mpi.slurm     script_mpiomp.slurm
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC> cp script_gpu.slurm TEST/
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC> cp script_mpi.slurm TEST/
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC> cd TEST/
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> ls
script_gpu.slurm  script_mpi.slurm  testMPIACC.f90
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> vi testMPIACC.f90 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> ftn -hacc -o testMPIACC.f90 testMPIACC     
/opt/cray/pe/cce/14.0.1/binutils/x86_64/x86_64-pc-linux-gnu/bin/ld: cannot find testMPIACC: No such file or directory
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> ftn -hacc -o tes testMPIACC.f90           
ftn-2151 ftn: ERROR in command line
  The source file "testMPIACC.f90" is unavailable.
ftn-2107 ftn: ERROR in command line
  No valid filenames are specified on the command line.
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> ls
script_gpu.slurm  script_mpi.slurm
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> cd ..
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC> ls
ACC		       laplace_mpi.f90		  slurm-1270245.out
MPI		       laplace_mpiomp.f90	  string_point.f03
OMP		       laplace_mpiomp_device.f90  test
TEST		       laplace_mpiomp_v0.f90	  test.f90
a.out		       pointer.f90		  test.mpiomp
compile.sh	       pointer_fptr.f90		  test.mpipointer
compile_mpi_amd.sh     scatter			  testMPIACC.f90
gpu.check	       scatter.f90		  testMPIOMP
gpu_check.c	       script_gpu.slurm		  testMPIOMP.f90
laplace.mpi	       script_mpi.slurm		  testMPIOMP_1.acc.o
laplace.mpiomp	       script_mpiomp.slurm	  testMPIOMP_1.acc.s
laplace.mpiomp.device  slurm-1270239.out	  test_mpipointer.f90
laplace_gpu.f90        slurm-1270244.out
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC> cp testMPIACC.f90 TEST/
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC> cd TEST/
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> ls
script_gpu.slurm  script_mpi.slurm  testMPIACC.f90
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> vi testMPIACC.f90 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> ftn -hacc -o testMPIACC testMPIACC.f90 

!$acc data create(f_k) copyin(f) copyout(f_k)      
                  ^                                 
ftn-676 ftn: ERROR TEST, File = testMPIACC.f90, Line = 34, Column = 19 
  Variable "F_K" is specified in directive clause CREATE and COPYOUT.

Cray Fortran : Version 14.0.1 (20220526224428_3a8780657c742829e80f36338fb6ec6578642bb7)
Cray Fortran : Compile time:  0.0174 seconds
Cray Fortran : 56 source lines
Cray Fortran : 1 errors, 0 warnings, 0 other messages, 0 ansi
Cray Fortran : "explain ftn-message number" gives more information about each message.
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> vi testMPIACC.f90 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> ftn -hacc -o testMPIACC testMPIACC.f90 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> vi script_gpu.slurm 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> sbatch script_gpu.slurm 
Submitted batch job 1387646
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> vi slurm-1387646.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> vi slurm-1387646.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> vi slurm-1387646.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> vi testMPIACC.f90 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> vi script_gpu.slurm 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> ls
script_gpu.slurm  slurm-1387646.out  testMPIACC.f90	 testMPIACC_1.acc.s
script_mpi.slurm  testMPIACC	     testMPIACC_1.acc.o
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> vi slurm-1387646.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> vi slurm-1387646.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> rm slurm-1387646.out
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> ls
script_gpu.slurm  testMPIACC	  testMPIACC_1.acc.o
script_mpi.slurm  testMPIACC.f90  testMPIACC_1.acc.s
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> vi testMPIACC.f90 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> ftn testMPIACC.f90 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> vi script_mpi.slurm 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> sbatch script_mpi.slurm 
Submitted batch job 1387649
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> vi slurm-1387649.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> vi slurm-1387649.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> vi slurm-1387649.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> vi testMPIACC.f90 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> ftn testMPIACC.f90 

      call MPI_Scatter(f_send, np+2, MPI_INTEGER,f(0:np+1)), np+2, MPI_INTEGER, 0,&
                                                           ^                        
ftn-1725 ftn: ERROR TEST, File = testMPIACC.f90, Line = 29, Column = 60 
  Unexpected syntax while parsing the CALL statement : "( or EOS" was expected but found ",".

Cray Fortran : Version 14.0.1 (20220526224428_3a8780657c742829e80f36338fb6ec6578642bb7)
Cray Fortran : Compile time:  0.0188 seconds
Cray Fortran : 38 source lines
Cray Fortran : 1 errors, 0 warnings, 0 other messages, 0 ansi
Cray Fortran : "explain ftn-message number" gives more information about each message.
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> vi testMPIACC.f90 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> ftn testMPIACC.f90 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> sbatch script_mpi.slurm 
Submitted batch job 1387650
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> vi slurm-1387650.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> ftn testMPIACC.f90 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> sbatch script_mpi.slurm 
Submitted batch job 1387651
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> vi slurm-1387651.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> rm slurm-1387651.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> ftn testMPIACC.f90 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> sbatch script_mpi.slurm 
Submitted batch job 1387709
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> vi slurm-1387709.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> rm slurm-1387709.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> ftn testMPIACC.f90 

      write(*,*)'--myid,f'myid,f(0),f(1),f(np),f(np+1)
                          ^                            
ftn-1725 ftn: ERROR TEST, File = testMPIACC.f90, Line = 34, Column = 27 
  Unexpected syntax while parsing the WRITE statement : "EOS" was expected but found "M".

Cray Fortran : Version 14.0.1 (20220526224428_3a8780657c742829e80f36338fb6ec6578642bb7)
Cray Fortran : Compile time:  0.0185 seconds
Cray Fortran : 38 source lines
Cray Fortran : 1 errors, 0 warnings, 0 other messages, 0 ansi
Cray Fortran : "explain ftn-message number" gives more information about each message.
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> ftn testMPIACC.f90 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> sbatch script_mpi.slurm 
Submitted batch job 1387711
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> vi slurm-1387711.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> rm slurm-1387711.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> ftn testMPIACC.f90 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> sbatch script_mpi.slurm 
Submitted batch job 1387714
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> vi slurm-1387714.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> rm slurm-1387714.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> ftn testMPIACC.f90 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> sbatch script_mpi.slurm 
Submitted batch job 1387731
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> vi slurm-1387731.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> rm slurm-1387731.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> ftn testMPIACC.f90 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> sbatch script_mpi.slurm 
Submitted batch job 1387781
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> vi slurm-1387781.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> cd ..
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC> ls
ACC		    laplace.mpiomp	       scatter.f90	    test.mpiomp
MPI		    laplace.mpiomp.device      script_gpu.slurm     test.mpipointer
OMP		    laplace_gpu.f90	       script_mpi.slurm     testMPIACC.f90
TEST		    laplace_mpi.f90	       script_mpiomp.slurm  testMPIOMP
a.out		    laplace_mpiomp.f90	       slurm-1270239.out    testMPIOMP.f90
compile.sh	    laplace_mpiomp_device.f90  slurm-1270244.out    testMPIOMP_1.acc.o
compile_mpi_amd.sh  laplace_mpiomp_v0.f90      slurm-1270245.out    testMPIOMP_1.acc.s
gpu.check	    pointer.f90		       string_point.f03     test_mpipointer.f90
gpu_check.c	    pointer_fptr.f90	       test
laplace.mpi	    scatter		       test.f90
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC> vi laplace
laplace.mpi                laplace_gpu.f90            laplace_mpiomp_device.f90
laplace.mpiomp             laplace_mpi.f90            laplace_mpiomp_v0.f90
laplace.mpiomp.device      laplace_mpiomp.f90         
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC> vi laplace_mpi.f90 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC> cd TEST/
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> rm a.out
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> ftm testSend.f90 
-bash: ftm: command not found
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> ftn testSend.f90 

      nsend = np+2
      ^            
ftn-113 ftn: ERROR TEST, File = testSend.f90, Line = 19, Column = 7 
  IMPLICIT NONE is specified in the local scope, therefore an explicit type must be specified for data object "NSEND".

     tag = 2022;
     ^           
ftn-113 ftn: ERROR TEST, File = testSend.f90, Line = 21, Column = 6 
  IMPLICIT NONE is specified in the local scope, therefore an explicit type must be specified for data object "TAG".

       do j=1,np
          ^      
ftn-113 ftn: ERROR TEST, File = testSend.f90, Line = 28, Column = 11 
  IMPLICIT NONE is specified in the local scope, therefore an explicit type must be specified for data object "J".

       ii=np
       ^     
ftn-113 ftn: ERROR TEST, File = testSend.f90, Line = 32, Column = 8 
  IMPLICIT NONE is specified in the local scope, therefore an explicit type must be specified for data object "II".

Cray Fortran : Version 14.0.1 (20220526224428_3a8780657c742829e80f36338fb6ec6578642bb7)
Cray Fortran : Compile time:  0.0190 seconds
Cray Fortran : 56 source lines
Cray Fortran : 4 errors, 0 warnings, 0 other messages, 0 ansi
Cray Fortran : "explain ftn-message number" gives more information about each message.
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> ftn testSend.f90 

      nsend = np+2
      ^            
ftn-113 ftn: ERROR TEST, File = testSend.f90, Line = 19, Column = 7 
  IMPLICIT NONE is specified in the local scope, therefore an explicit type must be specified for data object "NSEND".

       do j=1,np
          ^      
ftn-113 ftn: ERROR TEST, File = testSend.f90, Line = 28, Column = 11 
  IMPLICIT NONE is specified in the local scope, therefore an explicit type must be specified for data object "J".

Cray Fortran : Version 14.0.1 (20220526224428_3a8780657c742829e80f36338fb6ec6578642bb7)
Cray Fortran : Compile time:  0.0178 seconds
Cray Fortran : 56 source lines
Cray Fortran : 2 errors, 0 warnings, 0 other messages, 0 ansi
Cray Fortran : "explain ftn-message number" gives more information about each message.
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> ftn testSend.f90 

      nsend = np+2
      ^            
ftn-113 ftn: ERROR TEST, File = testSend.f90, Line = 19, Column = 7 
  IMPLICIT NONE is specified in the local scope, therefore an explicit type must be specified for data object "NSEND".

Cray Fortran : Version 14.0.1 (20220526224428_3a8780657c742829e80f36338fb6ec6578642bb7)
Cray Fortran : Compile time:  0.0192 seconds
Cray Fortran : 56 source lines
Cray Fortran : 1 errors, 0 warnings, 0 other messages, 0 ansi
Cray Fortran : "explain ftn-message number" gives more information about each message.
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> ftn testSend.f90 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> sbatch script_mpi.slurm 
Submitted batch job 1387810
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> vi slurm-1387810.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> rm slurm-1387810.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> vi testScatter.f90 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> ftn testSend.f90 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> sbatch script_mpi.slurm 
Submitted batch job 1387813
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> vi slurm-1387813.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> ftn testSend.f90 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> sbatch script_mpi.slurm 
Submitted batch job 1387814
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> vi slurm-1387814.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> ftn testSend.f90 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> sbatch script_mpi.slurm 
Submitted batch job 1387834
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> vi slurm-1387834.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> client_loop: send disconnect: Broken pipe
(base) hichamagueny@c02z6381lvdl ~ % ssh -iid_rsa_lumi hiagueny@lumi.csc.fi
Enter passphrase for key 'id_rsa_lumi': 
Last login: Mon Aug 15 15:06:44 2022 from 129.177.198.22
 *  ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒  *   *      *  
                                                       *      *  *    
   * ████       ████   ████   █████▄    ▄█████   ████     *     *     
 *   ████       ████   ████   ████ █▄  ▄█ ████   ████         ,    *, 
     ████       ████   ████   ████  ████  ████   ████  *   *  |\_ _/| 
     ████       ████   ████   ████   ▀▀   ████   ████   *    .| ." ,| 
  *  ████       ████   ████   ████        ████   ████        /(  \_\) 
     ████       ████   ████   ████        ████   ████       /    ,-,| 
 *   ████▄▄▄▄▄  ▀███   ███▀   ████        ████   ████ *    * /      \ 
     █████████    ▀▀███▀▀     ████        ████   ████  * ,/  (      * 
 *                                                     ,/       |  /  
  * ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒/    \  * || |  
                 *              *               ,_   (       )| || |  
*   *    *    The Supercomputer of the North  * | `\_|   __ /_| || |  
        **               *            * *       \_____\______)\__)__) 
   .********----------*******-------******----------****************. 
   |User guide and support _________________________________________| 
   |         https://docs.lumi-supercomputer.eu                     | 
 * |         https://lumi-supercomputer.eu/user-support             | 
** `--*****-------------------***-----------------------*****-------' 
/usr/bin/manpath: can't set the locale; make sure $LC_* and $LANG are correct
hiagueny@uan03:~> /scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST
-bash: /scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST: Is a directory
hiagueny@uan03:~> cd /scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> module load CrayEnv
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> module load PrgEnv-cray
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> module load craype-accel-amd-gfx90a

Lmod is automatically replacing "craype-accel-host" with "craype-accel-amd-gfx90a".

hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> module load rocm
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> export LD_LIBRARY_PATH=$HIP_LIB_PATH:$LD_LIBRARY_PATH
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> vi testSend.f90 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> ftn testScatter.f90 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> sbatch script_mpi.slurm 
Submitted batch job 1388073
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> vi slurm-1388073.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> rm slurm-1388073.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> ftn testScatter.f90 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> sbatch script_mpi.slurm 
Submitted batch job 1388077
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> vi slurm-1388077.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> rm slurm-1388077.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> ftn testScatter.f90 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> sbatch script_mpi.slurm 
Submitted batch job 1388082
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> vi slurm-1388082.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> rm slurm-138*
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> vi testSend.f90 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> ftn testScatter.f90 

          call MPI_Send(f(np),1,MPI_REAL,myid+1,tag1,&
                                                ^      
ftn-113 ftn: ERROR TEST, File = testScatter.f90, Line = 35, Column = 49 
  IMPLICIT NONE is specified in the local scope, therefore an explicit type must be specified for data object "TAG1".

          call MPI_Send(f(1),1,MPI_REAL,myid-1,tag2,&
                                               ^      
ftn-113 ftn: ERROR TEST, File = testScatter.f90, Line = 47, Column = 48 
  IMPLICIT NONE is specified in the local scope, therefore an explicit type must be specified for data object "TAG2".

Cray Fortran : Version 14.0.1 (20220526224428_3a8780657c742829e80f36338fb6ec6578642bb7)
Cray Fortran : Compile time:  0.0192 seconds
Cray Fortran : 65 source lines
Cray Fortran : 2 errors, 0 warnings, 0 other messages, 0 ansi
Cray Fortran : "explain ftn-message number" gives more information about each message.
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> vi testSend.f90 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> ftn testScatter.f90 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> sbatch script_mpi.slurm 
Submitted batch job 1388114
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> vi sl
slurm-1388114.out
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> vi sl
slurm-1388114.out
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> vi slurm-1388114.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> ftn testSend.f90    
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> sbatch script_mpi.slurm 
Submitted batch job 1388133
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> vi slurm-1388114.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> vi testScatter.f90 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC/TEST> cd ..
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/MPI-OMPACC> cd ../GPU-aware/
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi compile_mpiacc.sh 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> ftn -eZ -D_OPENACC -hacc -o laplace.mpiacc laplace_mpigpu.f90
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi script_mpiacc.slurm 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> sbatch script_mpiacc.slurm 
Submitted batch job 1388160
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi slurm-1388160.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> rm slurm-1388160.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> ftn -eZ -D_OPENACC -hacc -o laplace.mpiacc laplace_mpigpu.f90
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> sbatch script_mpiacc.slurm 
Submitted batch job 1388162
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi slurm-1388162.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> rm slurm-1388162.out
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> ftn -eZ -D_OPENACC -hacc -o laplace.mpiacc laplace_mpigpu.f90
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> sbatch script_mpiacc.slurm 
Submitted batch job 1388169
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi slurm-1388169.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi slurm-1388169.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> ftn -eZ -D_OPENACC -hacc -o laplace.mpiacc laplace_mpigpu.f90
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> sbatch script_mpiacc.slurm 
Submitted batch job 1388175
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi slurm-1388175.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi slurm-1388169.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi laplace_mpigpu.f90 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> ftn -eZ -D_OPENACC -hacc -o laplace.mpiacc.Noaware laplace_mpigpuNoaware.f90 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> cp script_mpiacc.slurm script_mpiaccNoaware.slurm 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi script_mpiaccNoaware.slurm 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> sbatch script_mpiaccNoaware.slurm 
Submitted batch job 1388186
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi slurm-1388186.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi slurm-1388186.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi slurm-1388186.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> ftn -eZ -D_OPENACC -hacc -o laplace.mpiacc laplace_mpigpu.f90
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> sbatch script_mpiacc.slurm 
Submitted batch job 1388187
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi slurm-1388187.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> ftn -eZ -D_OPENACC -hacc -o laplace.mpiacc laplace_mpigpu.f90
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> sbatch script_mpiacc.slurm 
Submitted batch job 1388188
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi slurm-1388188.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> rm slurm-1388188.out
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> ftn -eZ -D_OPENACC -hacc -o laplace.mpiacc laplace_mpigpu.f90
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> sbatch script_mpiacc.slurm 
Submitted batch job 1388189
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi slurm-1388189.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> export MPICH_RDMA_ENABLED_CUDA=1
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi script_mpiacc.slurm 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> ftn -eZ -D_OPENACC -hacc -o laplace.mpiacc laplace_mpigpu.f90
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> sbatch script_mpiacc.slurm 
Submitted batch job 1388191
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi slurm-1388191.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi script_mpiacc.slurm 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> ftn -eZ -D_OPENACC -hacc -o laplace.mpiacc laplace_mpigpu.f90
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> sbatch script_mpiacc.slurm 
Submitted batch job 1388192
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi slurm-1388192.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> ftn -eZ -D_OPENACC -hacc -o laplace.mpiacc laplace_mpigpu.f90

!$acc data copin(max_err_part,max_err)          
           ^                                     
ftn-1519 ftn: ERROR LAPLACE_MPIGPU, File = laplace_mpigpu.f90, Line = 256, Column = 12 
  Invalid clause "COPIN" for directive !$ACC DATA.  Valid clauses: IF, PRIVATE, FIRSTPRIVATE, REDUCTION, COLLAPSE, ASYNC, WAIT, NUM_GANGS, NUM_WORKERS, VECTOR_LENGTH, DEVICE_TYPE, COPY, DELETE.

Cray Fortran : Version 14.0.1 (20220526224428_3a8780657c742829e80f36338fb6ec6578642bb7)
Cray Fortran : Compile time:  0.0303 seconds
Cray Fortran : 311 source lines
Cray Fortran : 1 errors, 0 warnings, 0 other messages, 0 ansi
Cray Fortran : "explain ftn-message number" gives more information about each message.
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> ftn -eZ -D_OPENACC -hacc -o laplace.mpiacc laplace_mpigpu.f90
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> sbatch script_mpiacc.slurm 
Submitted batch job 1388193
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi slurm-1388193.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> ftn -eZ -D_OPENACC -hacc -o laplace.mpiacc laplace_mpigpu.f90

!$acc enter data copyin(f) copyout(f_k)        
                           ^                    
ftn-1370 ftn: ERROR LAPLACE_MPIGPU, File = laplace_mpigpu.f90, Line = 161, Column = 28 
  The COPYOUT clause is not allowed with directive !$ACC ENTER_DATA.

!$acc enter data copy(max_err_part,max_err)          
                 ^                                    
ftn-1370 ftn: ERROR LAPLACE_MPIGPU, File = laplace_mpigpu.f90, Line = 257, Column = 18 
  The COPY clause is not allowed with directive !$ACC ENTER_DATA.

Cray Fortran : Version 14.0.1 (20220526224428_3a8780657c742829e80f36338fb6ec6578642bb7)
Cray Fortran : Compile time:  0.0301 seconds
Cray Fortran : 313 source lines
Cray Fortran : 2 errors, 0 warnings, 0 other messages, 0 ansi
Cray Fortran : "explain ftn-message number" gives more information about each message.
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> ftn -eZ -D_OPENACC -hacc -o laplace.mpiacc laplace_mpigpu.f90
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> sbatch script_mpiacc.slurm 
Submitted batch job 1388199
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi slurm-1388199.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> ftn -eZ -D_OPENACC -hacc -o laplace.mpiacc laplace_mpigpu.f90

!$acc enter data copy(max_err_part,max_err)          
                 ^                                    
ftn-1370 ftn: ERROR LAPLACE_MPIGPU, File = laplace_mpigpu.f90, Line = 257, Column = 18 
  The COPY clause is not allowed with directive !$ACC ENTER_DATA.

Cray Fortran : Version 14.0.1 (20220526224428_3a8780657c742829e80f36338fb6ec6578642bb7)
Cray Fortran : Compile time:  0.0305 seconds
Cray Fortran : 313 source lines
Cray Fortran : 1 errors, 0 warnings, 0 other messages, 0 ansi
Cray Fortran : "explain ftn-message number" gives more information about each message.
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> ftn -eZ -D_OPENACC -hacc -o laplace.mpiacc laplace_mpigpu.f90
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> sbatch script_mpiacc.slurm 
Submitted batch job 1388200
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi slurm-1388200.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> ftn -eZ -D_OPENACC -hacc -o laplace.mpiacc laplace_mpigpu.f90
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> sbatch script_mpiacc.slurm 
Submitted batch job 1388201
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi slurm-1388201.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi script_mpiacc.slurm 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> sbatch script_mpiacc.slurm 
Submitted batch job 1388203
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi slurm-1388203.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi laplace_mpigpuNoaware.f90 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi script_mpiaccNoaware.slurm 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> sbatch script_mpiaccNoaware.slurm 
Submitted batch job 1388205
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi slurm-1388205.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi slurm-1388205.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi slurm-1388205.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi script_mpiacc.slurm 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> sbatch script_mpiacc.slurm 
Submitted batch job 1388214
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi script_mpiaccNoaware.slurm 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi slurm-1388214.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> rm slurm-1388214.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> sbatch script_mpiacc.slurm 
Submitted batch job 1388217
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi slurm-1388217.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> ftn -o laplace.mpi laplace_mpi.f90 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> cp script_mpiacc.slurm script_mpi.slurm 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi script_mpi.slurm 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> sbatch script_mpi.slurm 
Submitted batch job 1388230
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi slurm-1388230.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi slurm-1388230.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi slurm-1388230.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi slurm-1388230.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi slurm-1388230.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> mv slurm-1388230.out out_mpiacc_
out_mpiacc_Noaware.dat  out_mpiacc_aware.dat    
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> mv slurm-1388230.out out_mpi_alone.dat
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi script_mpi.slurm 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> sbatch script_mpi.slurm 
Submitted batch job 1388232
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi slurm-1388232.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi slurm-1388232.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi slurm-1388232.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi slurm-1388232.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi script_mpi.slurm 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> sbatch script_mpi.slurm 
Submitted batch job 1388233
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi slurm-1388233.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi slurm-1388233.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi slurm-1388233.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi slurm-1388233.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi slurm-1388233.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> mv slurm-1388233.out out_mpi_alone_1node_8cpu.dat 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi slurm-1388232.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi script_mpi.slurm 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> sbatch script_mpi.slurm 
Submitted batch job 1388234
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi slurm-1388234.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi slurm-1388234.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> mv slurm-1388234 out_mpi_alone_1node_16cpu.dat 
mv: cannot stat 'slurm-1388234': No such file or directory
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi slurm-1388234.out 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> mv slurm-1388234.out out_mpi_alone_1node_16cpu.dat 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> vi script_mpi.slurm 
hiagueny@uan03:/scratch/project_465000096/LUMI-codes/GPU-aware> client_loop: send disconnect: Broken pipe
(base) hichamagueny@c02z6381lvdl ~ % 
(base) hichamagueny@c02z6381lvdl ~ % 
(base) hichamagueny@c02z6381lvdl ~ % ssh -iid_rsa_lumi hiagueny@lumi.csc.fi
Enter passphrase for key 'id_rsa_lumi': 
Last login: Fri Aug  5 14:39:54 2022 from 129.177.198.61
 *  ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒  *   *      *  
                                                       *      *  *    
   * ████       ████   ████   █████▄    ▄█████   ████     *     *     
 *   ████       ████   ████   ████ █▄  ▄█ ████   ████         ,    *, 
     ████       ████   ████   ████  ████  ████   ████  *   *  |\_ _/| 
     ████       ████   ████   ████   ▀▀   ████   ████   *    .| ." ,| 
  *  ████       ████   ████   ████        ████   ████        /(  \_\) 
     ████       ████   ████   ████        ████   ████       /    ,-,| 
 *   ████▄▄▄▄▄  ▀███   ███▀   ████        ████   ████ *    * /      \ 
     █████████    ▀▀███▀▀     ████        ████   ████  * ,/  (      * 
 *                                                     ,/       |  /  
  * ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒/    \  * || |  
                 *              *               ,_   (       )| || |  
*   *    *    The Supercomputer of the North  * | `\_|   __ /_| || |  
        **               *            * *       \_____\______)\__)__) 
   .********----------*******-------******----------****************. 
   |User guide and support _________________________________________| 
   |         https://docs.lumi-supercomputer.eu                     | 
 * |         https://lumi-supercomputer.eu/user-support             | 
** `--*****-------------------***-----------------------*****-------' 
/usr/bin/manpath: can't set the locale; make sure $LC_* and $LANG are correct
   .Announcements---------------------------------------------------.
   | During the late June - early July downtime LUMI-G was          |
 * | integrated and is now under testing. The LUMI-C interconnect   |
   | was upgraded to 200 Gbit/s. The system software received many  |
*  | updates and the 22.06 programming environment was installed.   |
   |                                                                |
 * | LUMI/21.12 is now the recommended LUMI software stack but      |
   | users are encouraged to switch to LUMI/22.06 as soon as it     |
   | satisfies their needs. LUMI/21.08 is currently hidden as it    |
*  | does not fully function but may reappear. You can still load   |
   | the modules but at your own risk (and you will get             |
   | replacements instead).                                         |           
 * |                                                                |
*  | Further system software updates are planned for August and     |
*  | September to improve performance on LUMI-G and stability on    |
   | LUMI as a whole. These updates are partly rolled out while the |
   | system is online. However, as this is the first time this is   |
 * | done, unexpected problems can occur.                           | 
   |                                                                |
  *| The flash file system on /flash/project_<...> is unavailable   |
   | until the next upgrade scheduled for August or later given     |
   | the problems that still exist after the last upgrade.          |
*  .Notes-----------------------------------------------------------.
   | Make sure one of the following modules is loaded to have the   |
 * | full LUMI experience:                                          |
   | - CrayEnv: The Cray software stack enriched with some          |
   |   additional tools not installed by default in the OS          |
*  | - LUMI: The extensible LUMI software stack that you can use    |
   |   as a basis for additional software installs with EasyBuild   |
** |   and other tools.                                             |
** `--*****-------------------***-----------------------*****-------'

Did you know?
*************
LUMI uses warm-water cooling, which enables its waste heat to be utilized in the
district heating network of the city of Kajaani, and thus replaces heat produced
by fossil fuels.

The waste heat from LUMI that can be used in Kajaani’s district heating network
is equivalent to up to 20 per cent of the energy that Kajaani needs to use in
the area’s district heating. This reuse of waste heat will reduce the annual
carbon dioxide footprint of Kajaani by 13,500 tons – an amount that equals the
output from 4000 passenger cars.

hiagueny@uan01:~> cd /scratch/project_465000096/LUMI-codes/GPU-aware
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware> vi slurm-1389651.out 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware> cd ..
hiagueny@uan01:/scratch/project_465000096/LUMI-codes> cd ../MPI-OMPACC/
hiagueny@uan01:/scratch/project_465000096/MPI-OMPACC> ks
-bash: ks: command not found
hiagueny@uan01:/scratch/project_465000096/MPI-OMPACC> ls
ACC		    laplace.mpi		       pointer.f90	    slurm-1270244.out  testMPIOMP
MPI		    laplace.mpiomp	       pointer_fptr.f90     slurm-1270245.out  testMPIOMP.f90
OMP		    laplace.mpiomp.device      scatter		    string_point.f03   testMPIOMP_1.acc.o
a.out		    laplace_gpu.f90	       scatter.f90	    test	       testMPIOMP_1.acc.s
compile.sh	    laplace_mpi.f90	       script_gpu.slurm     test.f90	       test_mpipointer.f90
compile_mpi_amd.sh  laplace_mpiomp.f90	       script_mpi.slurm     test.mpiomp
gpu.check	    laplace_mpiomp_device.f90  script_mpiomp.slurm  test.mpipointer
gpu_check.c	    laplace_mpiomp_v0.f90      slurm-1270239.out    testMPIACC.f90
hiagueny@uan01:/scratch/project_465000096/MPI-OMPACC> vi slurm-127024
slurm-1270244.out  slurm-1270245.out  
hiagueny@uan01:/scratch/project_465000096/MPI-OMPACC> vi slurm-1270244.out 
hiagueny@uan01:/scratch/project_465000096/MPI-OMPACC> cd ACC/
hiagueny@uan01:/scratch/project_465000096/MPI-OMPACC/ACC> ls
compile_cce.sh	     laplace_mpiacc.i	     module_gnu		      script_acc.slurm	   slurm-1282246.out
compile_gnu.sh	     laplace_mpiacc_1.acc.o  mpiacc_node_1_1gpus.out  script_mpi.slurm	   slurm-1282764.out
fort.111	     laplace_mpiacc_1.acc.s  mpiacc_node_1_4gpus.out  script_mpiacc.slurm  slurm-1283810.out
laplace.mpiacc	     laplace_mpigpu.f90      mpiacc_node_2_8gpus.out  script_mpiomp.slurm  slurm-1283827.out
laplace_acc.f90      laplace_mpigpu.i	     mpiomp_node_1_1gpus.out  slurm-1281408.out    slurm-1283867.out
laplace_acc_1.acc.o  laplace_mpigpu_1.acc.o  mpiomp_node_1_4gpus.out  slurm-1282166.out    slurm-1283874.out
laplace_acc_1.acc.s  laplace_mpigpu_1.acc.s  mpiomp_node_2_8gpus.out  slurm-1282171.out
hiagueny@uan01:/scratch/project_465000096/MPI-OMPACC/ACC> vi slurm-128
slurm-1281408.out  slurm-1282171.out  slurm-1282764.out  slurm-1283827.out  slurm-1283874.out
slurm-1282166.out  slurm-1282246.out  slurm-1283810.out  slurm-1283867.out  
hiagueny@uan01:/scratch/project_465000096/MPI-OMPACC/ACC> vi slurm-1281408.out 
hiagueny@uan01:/scratch/project_465000096/MPI-OMPACC/ACC> rm slurm-1281408.out 
hiagueny@uan01:/scratch/project_465000096/MPI-OMPACC/ACC> vi slurm-128
slurm-1282166.out  slurm-1282246.out  slurm-1283810.out  slurm-1283867.out  
slurm-1282171.out  slurm-1282764.out  slurm-1283827.out  slurm-1283874.out  
hiagueny@uan01:/scratch/project_465000096/MPI-OMPACC/ACC> vi slurm-1283874.out 
hiagueny@uan01:/scratch/project_465000096/MPI-OMPACC/ACC> rm slurm-1283874.out 
hiagueny@uan01:/scratch/project_465000096/MPI-OMPACC/ACC> ls
compile_cce.sh	     laplace_mpiacc.i	     module_gnu		      script_acc.slurm	   slurm-1282764.out
compile_gnu.sh	     laplace_mpiacc_1.acc.o  mpiacc_node_1_1gpus.out  script_mpi.slurm	   slurm-1283810.out
fort.111	     laplace_mpiacc_1.acc.s  mpiacc_node_1_4gpus.out  script_mpiacc.slurm  slurm-1283827.out
laplace.mpiacc	     laplace_mpigpu.f90      mpiacc_node_2_8gpus.out  script_mpiomp.slurm  slurm-1283867.out
laplace_acc.f90      laplace_mpigpu.i	     mpiomp_node_1_1gpus.out  slurm-1282166.out
laplace_acc_1.acc.o  laplace_mpigpu_1.acc.o  mpiomp_node_1_4gpus.out  slurm-1282171.out
laplace_acc_1.acc.s  laplace_mpigpu_1.acc.s  mpiomp_node_2_8gpus.out  slurm-1282246.out
hiagueny@uan01:/scratch/project_465000096/MPI-OMPACC/ACC> vi slurm-128
slurm-1282166.out  slurm-1282246.out  slurm-1283810.out  slurm-1283867.out  
slurm-1282171.out  slurm-1282764.out  slurm-1283827.out  
hiagueny@uan01:/scratch/project_465000096/MPI-OMPACC/ACC> vi slurm-1282166.out 
hiagueny@uan01:/scratch/project_465000096/MPI-OMPACC/ACC> vi slurm-1282171.out 
hiagueny@uan01:/scratch/project_465000096/MPI-OMPACC/ACC> vi slurm-1282246.out 
hiagueny@uan01:/scratch/project_465000096/MPI-OMPACC/ACC> vi slurm-1282764.out 
hiagueny@uan01:/scratch/project_465000096/MPI-OMPACC/ACC> vi slurm-1283810.out 
hiagueny@uan01:/scratch/project_465000096/MPI-OMPACC/ACC> vi slurm-1283810.out 
hiagueny@uan01:/scratch/project_465000096/MPI-OMPACC/ACC> vi mpiacc_node_1_4gpus.out
hiagueny@uan01:/scratch/project_465000096/MPI-OMPACC/ACC> cd ..
hiagueny@uan01:/scratch/project_465000096/MPI-OMPACC> cd ../LUMI-codes/GPU-aware/Performance/
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> ./module.sh 

Lmod is automatically replacing "craype-accel-host" with "craype-accel-amd-gfx90a".

hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> cd ..
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware> cd Performance/
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> vi input
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> ls
input  input1  input2  input3  laplace_mpigpu.f90  module.sh  script_mpiacc.slurm
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> cd ..
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware> cp compile_mpiacc.sh 
cp: missing destination file operand after 'compile_mpiacc.sh'
Try 'cp --help' for more information.
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware> cp compile_mpiacc.sh Performance/
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware> cd Performance/
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> vi compile_mpiacc.sh 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> vi laplace_mpigpu.f90 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> ftn -eZ -D_OPENACC -hacc -o laplace.mpiacc laplace_mpigpu.f90
ftn-1350 ftn: WARNING in command line
  Command line option "-hacc" is being ignored because an accelerator target has not been specified.
/opt/cray/pe/cce/14.0.1/binutils/x86_64/x86_64-pc-linux-gnu/bin/ld: /tmp/pe_39749/laplace_mpigpu_1.o: in function `main':
The Cpu Module:(.text+0xe8e): undefined reference to `acc_get_device_type'
/opt/cray/pe/cce/14.0.1/binutils/x86_64/x86_64-pc-linux-gnu/bin/ld: The Cpu Module:(.text+0xea0): undefined reference to `acc_get_num_devices'
/opt/cray/pe/cce/14.0.1/binutils/x86_64/x86_64-pc-linux-gnu/bin/ld: The Cpu Module:(.text+0xeb1): undefined reference to `acc_set_device_num'
/opt/cray/pe/cce/14.0.1/binutils/x86_64/x86_64-pc-linux-gnu/bin/ld: /tmp/pe_39749/laplace_mpigpu_1.o:(.data+0x508): undefined reference to `openacc_'
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> vi module.sh         
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> module load CrayEnv
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> module load PrgEnv-cray
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> module load craype-accel-amd-gfx90a

Lmod is automatically replacing "craype-accel-host" with "craype-accel-amd-gfx90a".

hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> module load rocm
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> vi module.sh 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> export LD_LIBRARY_PATH=$HIP_LIB_PATH:$LD_LIBRARY_PATH
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> ftn -eZ -D_OPENACC -hacc -o laplace.mpiacc laplace_mpigpu.f90
ftn-2116 ftn: INTERNAL  
  "/opt/cray/pe/cce/14.0.1/cce/x86_64/bin/optcg" was terminated due to receipt of signal 07:  Bus error (core dumped).
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> ls
compile_mpiacc.sh  input   input2  laplace_mpigpu.f90  module.sh
core		   input1  input3  laplace_mpigpu.i    script_mpiacc.slurm
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> rm core
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> vi laplace_mpigpu.i 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> rm laplace_mpigpu.i 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> ftn -eZ -D_OPENACC -hacc -o laplace.mpiacc laplace_mpigpu.f90
ftn-2116 ftn: INTERNAL  
  "/opt/cray/pe/cce/14.0.1/cce/x86_64/bin/optcg" was terminated due to receipt of signal 07:  Bus error (core dumped).
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> ls
compile_mpiacc.sh  input   input2  laplace_mpigpu.f90  module.sh
core		   input1  input3  laplace_mpigpu.i    script_mpiacc.slurm
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> ls -l
total 21572
-rwxr--r-- 1 hiagueny project_465000096      225 Aug 16 15:02 compile_mpiacc.sh
-rw------- 1 hiagueny project_465000096 23351296 Aug 16 15:07 core
-rw-r--r-- 1 hiagueny project_465000096        5 Aug 16 14:58 input
-rw-r--r-- 1 hiagueny project_465000096        7 Aug 16 14:58 input1
-rw-r--r-- 1 hiagueny project_465000096        6 Aug 16 14:58 input2
-rw-r--r-- 1 hiagueny project_465000096        6 Aug 16 14:58 input3
-rw-r--r-- 1 hiagueny project_465000096     9066 Aug 16 14:58 laplace_mpigpu.f90
-rw-r--r-- 1 hiagueny project_465000096     7594 Aug 16 15:07 laplace_mpigpu.i
-rwxr--r-- 1 hiagueny project_465000096      153 Aug 16 14:58 module.sh
-rw-r--r-- 1 hiagueny project_465000096      620 Aug 16 15:02 script_mpiacc.slurm
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> r core 
-bash: r: command not found
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> rm core
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> vi laplace_mpigpu.f90 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> cp laplace_mpigpu.f90 0laplace_mpigpu.f90 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> cp 0laplace_mpigpu.f90 ../
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> module load CrayEnv

Lmod is automatically replacing "craype-accel-amd-gfx90a" with "craype-accel-host".

hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> module load PrgEnv-cray
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> module load craype-accel-amd-gfx90a

Lmod is automatically replacing "craype-accel-host" with "craype-accel-amd-gfx90a".

hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> module load rocm
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> export LD_LIBRARY_PATH=$HIP_LIB_PATH:$LD_LIBRARY_PATH
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> ftn -eZ -D_OPENACC -hacc -o laplace.mpiacc laplace_mpigpu.f90
ftn-2116 ftn: INTERNAL  
  "/opt/cray/pe/cce/14.0.1/cce/x86_64/bin/optcg" was terminated due to receipt of signal 07:  Bus error (core dumped).
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> vi laplace_mpigpu.f90 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> vi laplace_mpigpu.f90 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> vi gpu-aware-mpi-16384.out 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> vi gpu-aware-mpi-8192.out  
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> vi gpu-aware-mpi-32768.out 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> rm gpu-aware-mpi-32768.out 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> vi gpu-aware-mpi-32768.out 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> vi gpu-aware-mpi-32768.out 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> vi gpu-aware-mpi-32768.out 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> rm gpu-aware-mpi-32768.out 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> vi gpu-aware-mpi-32768.out 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> vi gpu-aware-mpi-32768.out 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> rm gpu-aware-mpi-32768.out 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> vi gpu-aware-mpi-32768.out 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> vi gpu-aware-mpi-32768.out 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> mv gpu-aware-mpi-32768.out gpu-aware-mpi-20000.out
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> vi gpu-aware-mpi-28000.out 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> vi gpu-aware-mpi-28000.out 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> vi gpu-aware-mpi-24000.out 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> vi gpu-aware-mpi-24000.out 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> vi gpu-aware-mpi-24000.out 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> vi gpu-aware-mpi-24000.out 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> rm gpu-aware-mpi-24000.out 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> vi gpu-aware-mpi-24000.out 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> vi gpu-aware-mpi-24000.out 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> rm gpu-aware-mpi-24000.out 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> vi gpu-aware-mpi-24000.out 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> vi laplace_mpigpu.f90 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> cd ..
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware> ls
Performance	   job_mpi-gpuD.sh		  laplace_mpigpuNoaware_1.acc.s  slurm-1388193.out
compile_gpu.sh	   job_mpi-gpuNoaware.sh	  laplace_mpigpu_1.acc.o	 slurm-1388199.out
compile_mpiacc.sh  job_mpi-gpuNoaware1.sh	  laplace_mpigpu_1.acc.s	 slurm-1388200.out
direct		   job_mpi-gpuNoaware2.sh	  module.sh			 slurm-1388201.out
direct.f90	   job_mpi-gpuNoaware3.sh	  out_mpi_alone.dat		 slurm-1388203.out
fort.111	   job_mpi-gpu_device		  out_mpi_alone_1node_16cpu.dat  slurm-1388205.out
input		   laplace.mpi			  out_mpi_alone_1node_8cpu.dat	 slurm-1388217.out
input1		   laplace.mpiacc		  out_mpiacc_Noaware.dat	 slurm-1388232.out
input2		   laplace.mpiacc.Noaware	  out_mpiacc_aware.dat		 slurm-1389643.out
input3		   laplace_mpi.f90		  script_mpi.slurm		 slurm-1389651.out
job_gpuD.sh	   laplace_mpigpu.f90		  script_mpiacc.slurm		 slurm-1389746.out
job_mpi-gpu.sh	   laplace_mpigpu.i		  script_mpiaccNoaware.slurm	 slurm-1389748.out
job_mpi-gpu1.sh    laplace_mpigpuNoaware.f90	  slurm-1388189.out		 slurm-1389752.out
job_mpi-gpu2.sh    laplace_mpigpuNoaware.i	  slurm-1388191.out
job_mpi-gpu3.sh    laplace_mpigpuNoaware_1.acc.o  slurm-1388192.out
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware> vi out_mpiacc_aware.dat 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware> vi out_mpiacc_aware.dat 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware> cd Performance/
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> ls
Testgpu-aware-mpi-8192.out  gpu-aware-mpi-8192.out  laplace_mpigpu.f90	    script_mpiacc1.slurm
compile_mpiacc.sh	    input		    laplace_mpigpu.i	    script_mpiacc2.slurm
gpu-aware-mpi-16384.out     input1		    laplace_mpigpu_1.acc.o  script_mpiacc3.slurm
gpu-aware-mpi-20000.out     input2		    laplace_mpigpu_1.acc.s
gpu-aware-mpi-24000.out     input3		    module.sh
gpu-aware-mpi-28000.out     laplace.mpiacc	    script_mpiacc.slurm
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> cd ..
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware> vi slurm-138
slurm-1388189.out  slurm-1388199.out  slurm-1388205.out  slurm-1389651.out  
slurm-1388191.out  slurm-1388200.out  slurm-1388217.out  slurm-1389746.out  
slurm-1388192.out  slurm-1388201.out  slurm-1388232.out  slurm-1389748.out  
slurm-1388193.out  slurm-1388203.out  slurm-1389643.out  slurm-1389752.out  
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware> vi slurm-1389752.out 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware> vi laplace_mpi
laplace_mpi.f90                laplace_mpigpuNoaware.f90      laplace_mpigpu_1.acc.s
laplace_mpigpu.f90             laplace_mpigpuNoaware.i        
laplace_mpigpu.i               laplace_mpigpuNoaware_1.acc.s  
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware> vi laplace_mpigpu.f90 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware> cd Performance/
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> vi WithoutINplacegpu-aware-mpi-8192.out 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> vi  
.fort.111.swp                         input1
1d_withoutInPlace.dat                 input2
WithINplacegpu-aware-mpi-8192.out     input3
WithoutINplacegpu-aware-mpi-8192.out  laplace.mpiacc
compile_mpiacc.sh                     laplace_mpigpu.f90
fort.111                              laplace_mpigpu.i
gpu-aware-mpi-16384.out               laplace_mpigpu_1.acc.s
gpu-aware-mpi-20000.out               module.sh
gpu-aware-mpi-24000.out               script_mpiacc.slurm
gpu-aware-mpi-28000.out               script_mpiacc1.slurm
gpu-aware-mpi-8192.out                script_mpiacc2.slurm
input                                 script_mpiacc3.slurm
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> vi 1d_withoutInPlace.dat 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> mv fort.111 1d_withInPlace.dat 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> vi 1d_withInPlace.dat 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> vi WithINplacegpu-aware-mpi-8192.out 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> vi 1d_withInPlace.dat 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> vi WithoutINplacegpu-aware-mpi-8192.out 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware/Performance> cd ..
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware> vi laplace_mpigpu.f90 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware> 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware> vi laplace_mpigpu.f90 
hiagueny@uan01:/scratch/project_465000096/LUMI-codes/GPU-aware> vim laplace_mpigpu.f90 

      program laplace_mpigpu

      use mpi
#ifdef _OPENACC
      use openacc
#endif
#ifdef _OPENMP
      use omp_lib
#endif

      implicit none
       integer status(MPI_STATUS_SIZE)
       integer :: i,j,k,ii !,nx,ny
       integer :: iter,count_rate, count_max,count
       integer :: myid,ierr,nproc,nxp,nyp,tag,tag1,tag2,nsend
       integer, parameter :: nx=8192,ny=nx
       integer, parameter :: max_iter=525
       double precision, parameter    :: pi=4d0*datan(1d0)
       real, parameter    :: error=0.05
       double precision               :: max_err,time_s,&
                                         d2fx,d2fy,max_err_part
       real               :: t_start,t_final
       double precision, allocatable :: f(:,:),f_k(:,:)
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

!Generate the Initial Conditions (ICs)
!Distribute the ICs over all processes using the operation MPI_Scatter

     f=0d0; tag1=2020; tag2=2021

     if(myid.eq.0) then
       allocate(f_send(1:nx,1:ny))
        CALL RANDOM_NUMBER(f_send)
      endif

      call MPI_Scatter(f_send,nx*nyp,MPI_DOUBLE_PRECISION,&
                      f(1:nx,1:nyp), nx*nyp,MPI_DOUBLE_PRECISION,&
                      0,MPI_COMM_WORLD, ierr)

      call MPI_Barrier(MPI_COMM_WORLD, ierr)

      if(myid.eq.0) deallocate(f_send)

      iter = 0; max_err=1.0

      if(myid.eq.0) then
         print*,""
         print*, "--Start iterations",iter
      print*,""
      endif

!Set a device: Determine which processes are on each node
!such that each process will be connected to a GPU-device

!!Split the world communicator into subgroups of commu, each of which
!contains processes that run on the same node, and which can create a
!shared
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
!!$acc data copyin(f) copyout(f_k) 
!$acc enter data copyin(f) create(f_k)        
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
         call MPI_Recv(f(:,nyp+1),(nx+2)*1,MPI_DOUBLE_PRECISION,myid+1,&
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
!$acc end parallel loop
#endif

#ifdef _OPENMP
!$omp end target teams distribute parallel do
#endif

          max_err_part=0.

#ifdef _OPENACC
!$acc parallel loop present(f,f_k) collapse(2) & 
!$acc reduction(max:max_err_part)
#endif
#ifdef _OPENMP
!$omp target teams distribute parallel do reduction(max:max_err_part) &
!$omp collapse(2) schedule(static,1) firstprivate(max_err_part)
#endif
          do j=1,nyp
            do i=1,nx
               max_err_part = max(dabs(f_k(i,j) - f(i,j)),max_err_part)
               f(i,j) = f_k(i,j)
            enddo
          enddo
#ifdef _OPENACC
!$acc end parallel loop
#endif
#ifdef _OPENMP
!$omp end target teams distribute parallel do
#endif

!max_err_part is copied back to the CPU-host by default
#ifdef _OPENACC
!$acc enter data copyin(max_err_part,max_err)          
!$acc host_data use_device(max_err_part,max_err)
#endif
         call MPI_ALLREDUCE(max_err_part,max_err,1,&
              MPI_DOUBLE_PRECISION,MPI_MAX, MPI_COMM_WORLD,ierr )
#ifdef _OPENACC
!$acc end host_data
!$acc exit data copyout(max_err_part,max_err)      
#endif

          if(myid.eq.0) then
            if(mod(iter,50).eq.0 ) write(*,'(i5,f10.6)') iter,max_err
          endif

          iter = iter + 1
     enddo
#ifdef _OPENACC
!!$acc end data
!$acc exit data copyout(f_k) delete(f)        
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
     
        
