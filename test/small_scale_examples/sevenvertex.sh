
EXE=../../bin/hipmcl
DATA=../../data

# example run on laptop with 16GB memory and 4 cores

# use 1 processes and 1 thread/process (16GB memory per process)

# using labeled triples format
export OMP_NUM_THREADS=1
mpirun -np 1 $EXE -M $DATA/sevenvertex.triples -I 2 -per-process-mem 16 -o sevenvertex.triples.hipmcl

# using matrix market format
mpirun -np 1 $EXE -M $DATA/sevenvertex.mtx --matrix-market -base 1 -I 2 -per-process-mem 16 -o sevenvertex.mtx.hipmcl



