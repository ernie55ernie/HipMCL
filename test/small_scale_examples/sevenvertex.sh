
HIPMCL_EXE=../../bin/hipmcl
IN_FILE=../../data/sevenvertex.triples
OUT_FILE=../../data/sevenvertex.triples.hipmcl

# example run on laptop with 8GB memory and 4 cores
# use 4 processes and 1 thread/process (2GB memory per process)

# using labeled triples format
export OMP_NUM_THREADS=1
mpirun -np 4 $HIPMCL_EXE -M $IN_FILE -I 2 -per-process-mem 2 -o $OUT_FILE

# using matrix market format
#IN_FILE=../../data/sevenvertex.mtx
#OUT_FILE=../../data/sevenvertex.mtx.hipmcl
#mpirun -np 1 $HIPMCL_EXE -M $DATA/sevenvertex.mtx --matrix-market -base 1 -I 2 -per-process-mem 16 -o sevenvertex.mtx.hipmcl



