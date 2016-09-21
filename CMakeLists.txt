cmake_minimum_required(VERSION 2.8)
project(hashtable)

enable_language(Fortran)

#get_filename_component (Fortran_COMPILER_NAME ${CMAKE_Fortran_COMPILER} NAME)

#set(CMAKE_FORTRAN_COMPILER "/usr/bin/gfortran.exe")

#message("the fortran flag is " ${CMAKE_FORTRAN_COMPILER)

set (CMAKE_CXX_FLAGS "-std=c++11")
include_directories("include")
add_subdirectory(lib)

add_executable(hTest test.f90)

target_link_libraries (hTest myHash)
