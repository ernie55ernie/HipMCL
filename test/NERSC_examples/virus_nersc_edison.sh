#!/bin/bash -l

#SBATCH -p debug
#SBATCH -N 16
#SBATCH -t 00:20:00
#SBATCH -J virus_edison_16node
#SBATCH -o virus_edison_16node.o%j

HIPMCL_EXE=../../bin/hipmcl

export OMP_NUM_THREADS=24
export MPICH_GNI_COLL_OPT_OFF=MPI_Alltoallv
N=16
n=16

# option 1: input in labeled triples format
IN_FILE=../../data/vir_vs_vir_30_50length.indexed.triples
OUT_FILE=../../data/vir_vs_vir_30_50length.indexed.triples.hipmcl
srun -N $N -n $n -c 24  --ntasks-per-node=1 --cpu_bind=cores $HIPMCL_EXE -M $IN_FILE -I 2 -per-process-mem 64 -o $OUT_FILE

# option 2: the same input in the matrix market format
#(you need to download this file from http://portal.nersc.gov/project/m1982/HipMCL/viruses/ )
#IN_FILE=../../data/Renamed_vir_vs_vir_30_50length.indexed.mtx
#OUT_FILE=../../data/Renamed_vir_vs_vir_30_50length.indexed.mtx.hipmcl
#srun -N $N -n $n -c 24  --ntasks-per-node=1 --cpu_bind=cores $HIPMCL_EXE -M $IN_FILE --matrix-market -base 0 -I 2 -per-process-mem 64 -o $OUT_FILE




