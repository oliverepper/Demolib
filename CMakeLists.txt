cmake_minimum_required(VERSION 3.24.2)

project(DemoLib VERSION 0.1 LANGUAGES C CXX)

set(CMAKE_C_VISIBILITY_PRESET hidden)
set(CMAKE_CXX_VISIBILITY_PRESET hidden)
set(CMAKE_VISIBILITY_INLINES_HIDDEN true)

include(GNUInstallDirs)

list(APPEND CMAKE_MESSAGE_INDENT "🔧 ")
if(APPLE)
    message(DEBUG "Configuring for Apple platform")
    set(CMAKE_INSTALL_RPATH "@executable_path/../lib")
elseif(UNIX)
    message(DEBUG "Configuring for UNIX")
    set(CMAKE_INSTALL_RPATH "$ORIGIN/../lib")
endif()
message(DEBUG "CMAKE_INSTALL_RPATH: ${CMAKE_INSTALL_RPATH}")
list(POP_BACK CMAKE_MESSAGE_INDENT)

add_subdirectory(src bin)

install(TARGETS
    c-demo-objfiles
    c-demo-static
    c-demo-shared
    demolib
    demolib_static
    demolib_shared
    cpp-demo-objfiles
    cpp-demo-static
    cpp-demo-shared
    democpplib
    democpplib_static
    democpplib_shared)

if(APPLE)
    install(SCRIPT sign.cmake)
endif()