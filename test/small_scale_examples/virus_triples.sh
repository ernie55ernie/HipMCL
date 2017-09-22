
HIPMCL_EXE=../../bin/hipmcl
IN_FILE=../../data/vir_vs_vir_30_50length.indexed.triples
OUT_FILE=../../data/vir_vs_vir_30_50length.indexed.triples.hipmcl

# example run on laptop with 16GB memory and 4 cores
# use 4 processes and 1 thread/process (4GB memory per process)
export OMP_NUM_THREADS=1
mpirun -np 4 $HIPMCL_EXE -M $IN_FILE -I 2 -per-process-mem 4 -o $OUT_FILE

# use 1 process and 4 thread/process (8GB memory per process)
#export OMP_NUM_THREADS=4
#mpirun -np 1 $HIPMCL_EXE -M $IN_FILE -I 2 -per-process-mem 8 -o $OUT_FILE

