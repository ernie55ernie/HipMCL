#!/bin/bash -l

#SBATCH -p debug
#SBATCH -N 36
#SBATCH -t 00:30:00
#SBATCH -J archaea_edison_36node
#SBATCH -o archaea_edison_36node.o%j

HIPMCL_EXE=../../bin/hipmcl
export OMP_NUM_THREADS=24
export MPICH_GNI_COLL_OPT_OFF=MPI_Alltoallv
N=36
n=36

# option 1: input in labeled triples format
IN_FILE=../../data/arch_vs_arch_30_50length.indexed.triples
OUT_FILE=../../data/arch_vs_arch_30_50length.indexed.triples.hipmcl

srun -N $N -n $n -c 24  --ntasks-per-node=1 --cpu_bind=cores $HIPMCL_EXE -M $IN_FILE -I 2 -per-process-mem 64 -o $OUT_FILE

# option 2: the same input in the matrix market format
IN_FILE=../../data/Renamed_arch_vs_arch_30_50length.indexed.mtx
OUT_FILE=../../data/Renamed_arch_vs_arch_30_50length.indexed.mtx.hipmcl

srun -N $N -n $n -c 24  --ntasks-per-node=1 --cpu_bind=cores $HIPMCL_EXE -M $IN_FILE --matrix-market -base 0 -I 2 -per-process-mem 64 -o $OUT_FILE



