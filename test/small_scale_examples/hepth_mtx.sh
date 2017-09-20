# input: data/hep-th.mtx
# output: hepth.hipmcl

EXE=../../bin/hipmcl
DATA=../../data

# example run on laptop with 16GB memory and 4 cores

# use 4 processes and 1 thread/process (4GB memory per process)
# using matrix market file as input
export OMP_NUM_THREADS=1
mpirun -np 4 $EXE -M $DATA/hep-th.mtx --matrix-market -base 1 -I 2 -per-process-mem 4 -o hep-th.hipmcl
