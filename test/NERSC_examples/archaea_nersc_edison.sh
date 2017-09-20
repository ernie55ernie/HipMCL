#!/bin/bash -l

#SBATCH -p debug
#SBATCH -N 36
#SBATCH -t 00:30:00
#SBATCH -J archaea_edison_36node
#SBATCH -o archaea_edison_36node.o%j

HIPMCL_EXE=../../bin/hipmcl
# Directory where input and output files are stored
DIR=/project/projectdirs/m1982/HipMCL/archaea
export OMP_NUM_THREADS=24
export MPICH_GNI_COLL_OPT_OFF=MPI_Alltoallv
N=36
n=36

# option 1: input in labeled triples format
IN_FILE=arch_vs_arch_30_50length.indexed.triples
srun -N $N -n $n -c 24  --ntasks-per-node=1 --cpu_bind=cores $HIPMCL_EXE -M $DIR/$IN_FILE -I 2 -per-process-mem 64

# option 2: the same input in the matrix market format
IN_FILE=Renamed_arch_vs_arch_30_50length.indexed.mtx
srun -N $N -n $n -c 24  --ntasks-per-node=1 --cpu_bind=cores $HIPMCL_EXE -M $DIR/$IN_FILE --matrix-market -base 0 -I 2 -per-process-mem 64




