cmake_minimum_required(VERSION 2.8)
project(hastable)

set (CMAKE_CXX_FLAGS "-std=c++11")
include_directories("include")
add_subdirectory(lib)

add_executable(hTest main.cpp)

target_link_libraries (hTest myHash)
