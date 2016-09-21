set(F_OBJ module_hashtable.f90)
set(C_OBJ hashTable.cpp)

set (CMAKE_CXX_FLAGS "-std=c++11")

add_library(myHash ${F_OBJ} ${C_OBJ}) 

set_target_properties(myHash PROPERTIES Fortran_MODULE_DIRECTORY
    ${MODULE_OUTPUT_PATH})
