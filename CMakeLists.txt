cmake_minimum_required(VERSION 2.8)
project(hashtable)

enable_language(Fortran)

#get_filename_component (Fortran_COMPILER_NAME ${CMAKE_Fortran_COMPILER} NAME)

#set(CMAKE_FORTRAN_COMPILER "/usr/bin/gfortran.exe")

#message("the fortran flag is " ${CMAKE_FORTRAN_COMPILER)

set (MODULE_OUTPUT_PATH "${PROJECT_BINARY_DIR}/include")
file(MAKE_DIRECTORY "${MODULE_OUTPUT_PATH}")
message(${MODULE_OUTPUT_PATH})
include_directories("include" ${MODULE_OUTPUT_PATH})
add_subdirectory(lib)

add_executable(hTest test.f90)
#add_dependencies(hTest myHash)
set_target_properties(hTest PROPERTIES LINKER_LANGUAGE Fortran)
target_link_libraries (hTest myHash)

