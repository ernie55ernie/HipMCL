# input: data/vir_vs_vir_30_50length.indexed.list
# output: vir_vs_vir_30_50length.indexed.list.hipmcl


EXE=../../bin/hipmcl
DATA=../../data

# example run on laptop with 16GB memory and 4 cores

# use 4 processes and 1 thread/process (4GB memory per process)
export OMP_NUM_THREADS=1
mpirun -np 4 $EXE -M $DATA/vir_vs_vir_30_50length.indexed.triples -I 2 -per-process-mem 4 -o vir_vs_vir_30_50length.indexed.triples.hipmcl

# use 1 process and 4 thread/process (8GB memory per process)
export OMP_NUM_THREADS=4
mpirun -np 1 $EXE -M $DATA/vir_vs_vir_30_50length.indexed.triples -I 2 -per-process-mem 16 -o vir_vs_vir_30_50length.indexed.triples.hipmcl

