#!/bin/bash -l

#SBATCH -p regular
#SBATCH -N 2048
#SBATCH -C knl,quad,flat # quad mode a single NUMA domain of the DRAM, flat means mcdRAM is used as memory. 
#SBATCH -t 10:00:00
#SBATCH -J Metaclust50_2048_34t
#SBATCH -o Metaclust50_2048node_quad_flat_34t.o%j

HIPMCL_EXE=../../bin/hipmcl
export OMP_NUM_THREADS=34
export OMP_PROC_BIND=true 
export OMP_PLACES=threads


IN_FILE=input_directory/Renamed_graph_Metaclust50_MATRIX_DENSE.txt
OUT_FILE=input_directory/Renamed_graph_Metaclust50_MATRIX_DENSE.txt.hipmcl

N=2048
n=4096
export MPICH_GNI_COLL_OPT_OFF=MPI_Alltoallv
srun -N $N -n $n -c 34  --ntasks-per-node=2 --cpu_bind=cores numactl -p 1 $HIPMCL_EXE -M $IN_FILE -I 2 --matrix-market -base 0 -per-process-mem 46 -o $OUT_FILE


