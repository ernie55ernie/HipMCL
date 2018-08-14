#!/bin/bash -l

#SBATCH -q regular
#SBATCH -N 2048
#SBATCH -C knl
#SBATCH -t 10:00:00
#SBATCH -J iso_dense_2048_34t
#SBATCH -o iso_dense_2048node_34t.o%j

HIPMCL_EXE=../../bin/hipmcl
export OMP_NUM_THREADS=34
export OMP_PROC_BIND=true 
export OMP_PLACES=threads

#(you need to download this file from http://portal.nersc.gov/project/m1982/HipMCL/ )
IN_FILE=input_dir/iso_vs_iso_30_70length_ALL.m100.indexed.txt
OUT_FILE=input_dir/iso_vs_iso_30_70length_ALL.m100.indexed.txt.hipmcl
N=2048
n=4096
export MPICH_GNI_COLL_OPT_OFF=MPI_Alltoallv
srun -N $N -n $n -c 34  --ntasks-per-node=2 --cpu_bind=cores $HIPMCL_EXE -M $IN_FILE -I 2 -per-process-mem 46 -o $OUT_FILE


