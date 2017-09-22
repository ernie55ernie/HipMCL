
HIPMCL_EXE=../../bin/hipmcl
IN_FILE=../../data/hep-th.mtx
OUT_FILE=../../data/hep-th.mtx.hipmcl

# example run on laptop with 8GB memory and 4 cores
# use 4 processes and 1 thread/process (2GB memory per process)
# using matrix market file as input
export OMP_NUM_THREADS=1
mpirun -np 4 $HIPMCL_EXE -M $IN_FILE --matrix-market -base 1 -I 2 -per-process-mem 2 -o $OUT_FILE
