# Only for development perpose
# Copy necessary files from Combinatorial BLAS development directory to HipMCL release directory

COMBBLAS_DIR=~/Documents/Projects/combinatorial-blas-2.0/CombBLAS
HIPMCL_DIR=~/Documents/Projects/HipMCL/src

#copy necessary files from CombBLAS
cp -r $COMBBLAS_DIR/include $HIPMCL_DIR/CombBLAS/
cp -r $COMBBLAS_DIR/src $HIPMCL_DIR/CombBLAS/
cp -r $COMBBLAS_DIR/graph500-1.2 $HIPMCL_DIR/CombBLAS/
cp -r $COMBBLAS_DIR/ms_inttypes $HIPMCL_DIR/CombBLAS/
cp -r $COMBBLAS_DIR/psort-1.0 $HIPMCL_DIR/CombBLAS/
cp -r $COMBBLAS_DIR/usort $HIPMCL_DIR/CombBLAS/
cp -r $COMBBLAS_DIR/Serialization $HIPMCL_DIR/CombBLAS/


#copy HipMCL sources
cp $COMBBLAS_DIR/Applications/CC.h $HIPMCL_DIR/
cp $COMBBLAS_DIR/Applications/MCL.cpp $HIPMCL_DIR/HipMCL.cpp
cp $COMBBLAS_DIR/Applications/mcl-runs/MCLConvert.cpp $HIPMCL_DIR/
cp $COMBBLAS_DIR/Applications/WriteMCLClusters.h $HIPMCL_DIR/

#replace CombBLAS.h reference
#requires gnu sed (command for mac:: brew install gnu-sed --with-default-names )

#sed -i "s/#include \"..\/CombBLAS.h\"/#include \"CombBLAS\/CombBLAS.h\"/" $HIPMCL_DIR/HipMCL.cpp
#sed -i "s/#include \"..\/CombBLAS.h\"/#include \"CombBLAS\/CombBLAS.h\"/" $HIPMCL_DIR/CC.h
#sed -i "s/#include \"..\/CombBLAS.h\"/#include \"CombBLAS\/CombBLAS.h\"/" $HIPMCL_DIR/WriteMCLClusters.h
