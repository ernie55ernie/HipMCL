#!/bin/bash -l

#SBATCH -q debug
#SBATCH -N 64
#SBATCH -t 00:30:00
#SBATCH -J euk_edison_64node
#SBATCH -o euk_edison_64node.o%j

HIPMCL_EXE=../../bin/hipmcl
export OMP_NUM_THREADS=24
export MPICH_GNI_COLL_OPT_OFF=MPI_Alltoallv
N=64
n=64

# option 1: input in labeled triples format
#(you need to download this file from http://portal.nersc.gov/project/m1982/HipMCL/ )
IN_FILE=../../data/euk_vs_euk_30_50length.indexed.triples
OUT_FILE=../../data/euk_vs_euk_30_50length.indexed.triples.hipmcl

srun -N $N -n $n -c 24  --ntasks-per-node=1 --cpu_bind=cores $HIPMCL_EXE -M $IN_FILE -I 2 -per-process-mem 64 -o $OUT_FILE


# option 2: the same input in the matrix market format
IN_FILE=../../data/Renamed_euk_vs_euk_30_50length.indexed.mtx
OUT_FILE=../../data/Renamed_euk_vs_euk_30_50length.indexed.mtx.hipmcl

srun -N $N -n $n -c 24  --ntasks-per-node=1 --cpu_bind=cores $HIPMCL_EXE -M $IN_FILE --matrix-market -base 0 -I 2 -per-process-mem 64 -o $OUT_FILE





