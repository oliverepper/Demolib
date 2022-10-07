add_library(democpplib OBJECT demo.cpp $<TARGET_OBJECTS:demolib>)

option(EXTRA_MSG "Enable an extra message after calling from C++ into C" ON)
if(EXTRA_MSG)
    target_compile_definitions(democpplib PRIVATE "EXTRA_MSG")
endif()

target_include_directories(democpplib
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
        $<INSTALL_INTERFACE:include>)

set_target_properties(democpplib PROPERTIES
    PUBLIC_HEADER "${CMAKE_CURRENT_SOURCE_DIR}/include/demo.hpp"
    POSITION_INDEPENDENT_CODE true)

target_link_libraries(democpplib PUBLIC demolib_static)

add_library(democpplib_static STATIC dummy.cpp)
set_target_properties(democpplib_static PROPERTIES
    OUTPUT_NAME "democpp")
target_link_libraries(democpplib_static democpplib demolib_static)

add_library(democpplib_shared SHARED dummy.cpp)
set_target_properties(democpplib_shared PROPERTIES
    OUTPUT_NAME "democpp"
    VERSION 0.0.1
    SOVERSION 0)
target_link_libraries(democpplib_shared democpplib demolib_shared)