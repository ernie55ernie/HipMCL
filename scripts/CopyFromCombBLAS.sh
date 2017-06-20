# Copy necessary files from Combinatorial BLAS development directory to HipMCL release directory

COMBBLAS_DIR=/Users/Azad/Documents/Projects/combinatorial-blas-2.0/CombBLAS
HIPMCL_DIR=//Users/Azad/Documents/Projects/HipMCL/src

#copy necessary files from CombBLAS
cp $COMBBLAS_DIR/*.cpp $HIPMCL_DIR/CombBLAS/
cp $COMBBLAS_DIR/*.c $HIPMCL_DIR/CombBLAS/
cp $COMBBLAS_DIR/*.h $HIPMCL_DIR/CombBLAS/
cp -r $COMBBLAS_DIR/graph500-1.2 $HIPMCL_DIR/CombBLAS/
cp -r $COMBBLAS_DIR/ms_inttypes $HIPMCL_DIR/CombBLAS/
cp -r $COMBBLAS_DIR/PBBS $HIPMCL_DIR/CombBLAS/
cp -r $COMBBLAS_DIR/psort-1.0 $HIPMCL_DIR/CombBLAS/
cp -r $COMBBLAS_DIR/SequenceHeaps $HIPMCL_DIR/CombBLAS/
cp -r $COMBBLAS_DIR/Serialization $HIPMCL_DIR/CombBLAS/
cp -r $COMBBLAS_DIR/Tommy $HIPMCL_DIR/CombBLAS/
cp -r $COMBBLAS_DIR/usort $HIPMCL_DIR/CombBLAS/

#copy HipMCL sources
cp $COMBBLAS_DIR/Applications/CC.h $HIPMCL_DIR/
cp $COMBBLAS_DIR/Applications/MCL.cpp $HIPMCL_DIR/HipMCL.cpp
cp $COMBBLAS_DIR/Applications/mcl-runs/MCLConvert.cpp $HIPMCL_DIR/

#replace CombBLAS.h reference
sed -i "s/#include \"..\/CombBLAS.h\"/#include \"CombBLAS\/CombBLAS.h\"/" $HIPMCL_DIR/HipMCL.cpp
sed -i "s/#include \"..\/CombBLAS.h\"/#include \"CombBLAS\/CombBLAS.h\"/" $HIPMCL_DIR/CC.h
