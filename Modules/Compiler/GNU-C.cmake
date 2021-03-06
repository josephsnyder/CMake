include(Compiler/GNU)
__compiler_gnu(C)

if (NOT CMAKE_C_COMPILER_VERSION VERSION_LESS 4.7)
  set(CMAKE_C90_STANDARD_COMPILE_OPTION "-std=c90")
  set(CMAKE_C90_EXTENSION_COMPILE_OPTION "-std=gnu90")

  set(CMAKE_C99_STANDARD_COMPILE_OPTION "-std=c99")
  set(CMAKE_C99_EXTENSION_COMPILE_OPTION "-std=gnu99")

  set(CMAKE_C11_STANDARD_COMPILE_OPTION "-std=c11")
  set(CMAKE_C11_EXTENSION_COMPILE_OPTION "-std=gnu11")
endif()

# This may change in a future GNU version.
set(CMAKE_C_STANDARD_DEFAULT 90)

macro(cmake_record_c_compile_features)
  macro(_get_gcc_features std_version list)
    record_compiler_features(C "-std=${std_version}" ${list})
  endmacro()

  if (UNIX AND NOT APPLE AND NOT CMAKE_C_COMPILER_VERSION VERSION_LESS 4.7)
    _get_gcc_features(c90 CMAKE_C90_COMPILE_FEATURES)
    if (_result EQUAL 0)
      _get_gcc_features(c99 CMAKE_C99_COMPILE_FEATURES)
    endif()
    if (_result EQUAL 0)
      _get_gcc_features(c11 CMAKE_C11_COMPILE_FEATURES)
    endif()
  else()
    set(_result 0)
  endif()
endmacro()
