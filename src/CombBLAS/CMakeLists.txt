
ADD_LIBRARY( CombBLASlib src/CommGrid.cpp src/MPIType.cpp  src/mmio.c src/hash.cpp)
ADD_SUBDIRECTORY( usort )
target_link_libraries(CombBLASlib PUBLIC Usortlib)
ADD_SUBDIRECTORY( graph500-1.2/generator )
target_link_libraries(CombBLASlib PUBLIC GraphGenlib)

# set include directories
target_include_directories(CombBLASlib PUBLIC $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include> $<INSTALL_INTERFACE:include>)
target_include_directories(CombBLASlib PUBLIC $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/psort-1.0/include> $<INSTALL_INTERFACE:include>)

target_include_directories(CombBLASlib PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/include/CombBLAS)


