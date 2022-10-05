add_library(demolib OBJECT demo.c)

include(GenerateExportHeader)
generate_export_header(demolib BASE_NAME "demo")

target_include_directories(demolib
    PUBLIC
        "include"
        "include/demo"
        ${CMAKE_CURRENT_BINARY_DIR})

set(demolib_PUBLIC_HEADERS
    ${CMAKE_CURRENT_SOURCE_DIR}/include/demo.h
    ${CMAKE_CURRENT_BINARY_DIR}/demo_export.h)

set_target_properties(demolib PROPERTIES
    PUBLIC_HEADER "${demolib_PUBLIC_HEADERS}"
    POSITION_INDEPENDENT_CODE true)

# Xcode generator needs at least one file for a target
# only object files does not work :-/
add_library(demolib_static STATIC dummy.c) 
set_target_properties(demolib_static PROPERTIES
    OUTPUT_NAME "demo")
target_link_libraries(demolib_static demolib)

# Xcode generator needs at least one file for a target
# only object files does not work :-/
add_library(demolib_shared SHARED dummy.c)
set_target_properties(demolib_shared PROPERTIES
    OUTPUT_NAME "demo"
    VERSION 0.0.1
    SOVERSION 0)
target_link_libraries(demolib_shared demolib)

install(
    DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/include/demo"
    DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}")