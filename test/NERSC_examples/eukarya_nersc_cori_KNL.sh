#!/bin/bash -l

#SBATCH -p debug
#SBATCH -N 16
#SBATCH -C knl
#SBATCH -t 00:30:00
#SBATCH -J euk_cori_KNL_16node
#SBATCH -o euk_cori_KNL_16node.o%j

HIPMCL_EXE=../../bin/hipmcl
export OMP_NUM_THREADS=68
export OMP_PROC_BIND=true
export OMP_PLACES=cores
export MPICH_GNI_COLL_OPT_OFF=MPI_Alltoallv
N=16
n=16

# input in the matrix market format
IN_FILE=../../data/Renamed_euk_vs_euk_30_50length.indexed.mtx
OUT_FILE=../../data/Renamed_euk_vs_euk_30_50length.indexed.mtx.hipmcl

srun -N $N -n $n -c 68  --ntasks-per-node=1 --cpu_bind=cores $HIPMCL_EXE -M $IN_FILE --matrix-market -base 0 -I 2 -per-process-mem 96 -o $OUT_FILE
