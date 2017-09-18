#!/bin/bash -l

#SBATCH -p debug
#SBATCH -N 16
#SBATCH -C knl,quad,flat # quad mode a single NUMA domain of the DRAM, flat means mcdRAM is used as memory.
#SBATCH -t 00:30:00
#SBATCH -J euk_cori_KNL_16node
#SBATCH -o euk_cori_KNL_16node.o%j

HIPMCL_EXE=../bin/hipmcl
# Directory where input and output files are stored
DIR=/project/projectdirs/m1982/HipMCL/eukarya

export OMP_NUM_THREADS=68
export OMP_PROC_BIND=true
export OMP_PLACES=cores
export MPICH_GNI_COLL_OPT_OFF=MPI_Alltoallv
N=16
n=16

# input in the matrix market format
IN_FILE=Renamed_euk_vs_euk_30_50length.indexed.mtx
srun -N $N -n $n -c 68  --ntasks-per-node=1 --cpu_bind=cores numactl -p 1 $HIPMCL_EXE -M $DIR/$IN_FILE --matrix-market -base 0 -I 2 -per-process-mem 112




