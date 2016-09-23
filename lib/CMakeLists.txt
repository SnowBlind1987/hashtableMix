set(F_OBJ module_hashtable.f90)
set(C_OBJ hashTable.cpp)

set (CMAKE_CXX_FLAGS "-std=c++11")
set (CMAKE_Fortran_FLAGS "-lstdc++")
add_library(myHashF ${F_OBJ} ${C_OBJ}) 
#message("modules: " ${MODULE_OUTPUT_PATH})
#set_source_files_properties(module_hashtable.f90 PROPERTIES OBJECT_DEPENDS "${MODULE_OUTPUT_PATH}/test_hash.mod")
set_target_properties(myHashF PROPERTIES Fortran_MODULE_DIRECTORY
    ${MODULE_OUTPUT_PATH})
set_target_properties(myHashF PROPERTIES LINKER_LANGUAGE Fortran)


add_subdirectory(C_only)
