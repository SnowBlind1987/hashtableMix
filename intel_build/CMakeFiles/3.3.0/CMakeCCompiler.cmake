set(CMAKE_C_COMPILER "/opt/Software/intel_parallel_studio/2016u3/impi/5.1.3.210/intel64/bin/mpiicc")
set(CMAKE_C_COMPILER_ARG1 "")
set(CMAKE_C_COMPILER_ID "Intel")
set(CMAKE_C_COMPILER_VERSION "16.0.3.20160415")
set(CMAKE_C_COMPILE_FEATURES "")
set(CMAKE_C90_COMPILE_FEATURES "")
set(CMAKE_C99_COMPILE_FEATURES "")
set(CMAKE_C11_COMPILE_FEATURES "")

set(CMAKE_C_PLATFORM_ID "Linux")
set(CMAKE_C_SIMULATE_ID "")
set(CMAKE_C_SIMULATE_VERSION "")

set(CMAKE_AR "/usr/bin/ar")
set(CMAKE_RANLIB "/usr/bin/ranlib")
set(CMAKE_LINKER "/usr/bin/ld")
set(CMAKE_COMPILER_IS_GNUCC )
set(CMAKE_C_COMPILER_LOADED 1)
set(CMAKE_C_COMPILER_WORKS TRUE)
set(CMAKE_C_ABI_COMPILED TRUE)
set(CMAKE_COMPILER_IS_MINGW )
set(CMAKE_COMPILER_IS_CYGWIN )
if(CMAKE_COMPILER_IS_CYGWIN)
  set(CYGWIN 1)
  set(UNIX 1)
endif()

set(CMAKE_C_COMPILER_ENV_VAR "CC")

if(CMAKE_COMPILER_IS_MINGW)
  set(MINGW 1)
endif()
set(CMAKE_C_COMPILER_ID_RUN 1)
set(CMAKE_C_SOURCE_FILE_EXTENSIONS c;m)
set(CMAKE_C_IGNORE_EXTENSIONS h;H;o;O;obj;OBJ;def;DEF;rc;RC)
set(CMAKE_C_LINKER_PREFERENCE 10)

# Save compiler ABI information.
set(CMAKE_C_SIZEOF_DATA_PTR "8")
set(CMAKE_C_COMPILER_ABI "ELF")
set(CMAKE_C_LIBRARY_ARCHITECTURE "")

if(CMAKE_C_SIZEOF_DATA_PTR)
  set(CMAKE_SIZEOF_VOID_P "${CMAKE_C_SIZEOF_DATA_PTR}")
endif()

if(CMAKE_C_COMPILER_ABI)
  set(CMAKE_INTERNAL_PLATFORM_ABI "${CMAKE_C_COMPILER_ABI}")
endif()

if(CMAKE_C_LIBRARY_ARCHITECTURE)
  set(CMAKE_LIBRARY_ARCHITECTURE "")
endif()




set(CMAKE_C_IMPLICIT_LINK_LIBRARIES "mpifort;mpi;mpigi;dl;rt;pthread;imf;svml;irng;m;ipgo;decimal;cilkrts;stdc++;irc;svml;c;irc_s;dl;c")
set(CMAKE_C_IMPLICIT_LINK_DIRECTORIES "/opt/Software/intel_parallel_studio/2016u3/impi/5.1.3.210/intel64/lib/release_mt;/opt/Software/intel_parallel_studio/2016u3/impi/5.1.3.210/intel64/lib;/opt/Software/intel_parallel_studio/2016u3/compilers_and_libraries_2016.3.210/linux/mpi/intel64/lib;/opt/Software/intel_parallel_studio/2016u3/compilers_and_libraries_2016.3.210/linux/mpi/mic/lib;/opt/Software/intel_parallel_studio/2016u3/debugger_2016/libipt/intel64/lib;/opt/Software/intel_parallel_studio/2016u3/compilers_and_libraries_2016.3.210/linux/daal/lib/intel64_lin;/opt/Software/intel_parallel_studio/2016u3/compilers_and_libraries_2016.3.210/linux/tbb/lib/intel64_lin/gcc4.4;/opt/Software/intel_parallel_studio/2016u3/compilers_and_libraries_2016.3.210/linux/compiler/lib/intel64_lin;/opt/Software/intel_parallel_studio/2016u3/compilers_and_libraries_2016.3.210/linux/ipp/lib/intel64;/opt/Software/intel_parallel_studio/2016u3/compilers_and_libraries_2016.3.210/linux/compiler/lib/intel64;/opt/Software/intel_parallel_studio/2016u3/compilers_and_libraries_2016.3.210/linux/mkl/lib/intel64;/opt/Software/intel_parallel_studio/2016u3/compilers_and_libraries_2016.3.210/linux/tbb/lib/intel64/gcc4.4;/home/shelf8/Software/intel_parallel_studio/2016u3/compilers_and_libraries_2016.3.210/linux/compiler/lib/intel64_lin;/usr/lib/gcc/x86_64-redhat-linux/4.4.7;/usr/lib64;/lib64;/usr/lib;/lib")
set(CMAKE_C_IMPLICIT_LINK_FRAMEWORK_DIRECTORIES "")



