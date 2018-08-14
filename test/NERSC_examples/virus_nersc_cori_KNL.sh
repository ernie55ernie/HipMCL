#!/bin/bash -l

#SBATCH -q debug
#SBATCH -N 16
#SBATCH -C knl
#SBATCH -t 00:30:00
#SBATCH -J virus_cori_KNL_16node
#SBATCH -o virus_cori_KNL_16node.o%j

HIPMCL_EXE=../../bin/hipmcl
export OMP_NUM_THREADS=68
export OMP_PROC_BIND=true
export OMP_PLACES=cores
export MPICH_GNI_COLL_OPT_OFF=MPI_Alltoallv
N=16
n=16

# input in the matrix market format
IN_FILE=../../data/vir_vs_vir_30_50length.indexed.triples
OUT_FILE=../../data/vir_vs_vir_30_50length.indexed.triples.hipmcl

srun -N $N -n $n -c 68  --ntasks-per-node=1 --cpu_bind=cores $HIPMCL_EXE -M $IN_FILE -I 2 -per-process-mem 96 -o $OUT_FILE
