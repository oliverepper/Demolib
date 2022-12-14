cmake_minimum_required(VERSION 3.24.2)

project(DemoLib VERSION 0.1 LANGUAGES C CXX)

set(CMAKE_C_VISIBILITY_PRESET hidden)
set(CMAKE_CXX_VISIBILITY_PRESET hidden)
set(CMAKE_VISIBILITY_INLINES_HIDDEN true)

include(GNUInstallDirs)

file(RELATIVE_PATH pathToLibs
    ${CMAKE_CURRENT_BINARY_DIR}/${CMAKE_INSTALL_BINDIR}
    ${CMAKE_CURRENT_BINARY_DIR}/${CMAKE_INSTALL_LIBDIR})

list(APPEND CMAKE_MESSAGE_INDENT "🔧 ")
if(APPLE)
    message(DEBUG "Configuring for Apple platform")
    set(CMAKE_INSTALL_RPATH "@loader_path/${pathToLibs}")
elseif(UNIX)
    message(DEBUG "Configuring for UNIX")
    set(CMAKE_INSTALL_RPATH "$ORIGIN/${pathToLibs}")
endif()
message(DEBUG "CMAKE_INSTALL_RPATH: ${CMAKE_INSTALL_RPATH}")
list(POP_BACK CMAKE_MESSAGE_INDENT)

add_subdirectory(src bin)

set(demolib_EXPORTED_TARGETS
demolib
demolib_shared
democpplib
democpplib_shared)

install(TARGETS ${demolib_EXPORTED_TARGETS}
    EXPORT DemoLibTargets
    LIBRARY NAMELINK_SKIP)

install(EXPORT DemoLibTargets
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/DemoLib-${PROJECT_VERSION}
    NAMESPACE demolib::)

install(TARGETS ${demolib_EXPORTED_TARGETS})

install(TARGETS
    demolib_static
    c-demo-objfiles
    c-demo-static
    c-demo-shared
    democpplib_static
    cpp-demo-objfiles
    cpp-demo-static
    cpp-demo-shared)

if(APPLE)
    install(SCRIPT ${PROJECT_SOURCE_DIR}/cmake/sign.cmake)
endif()

include(CMakePackageConfigHelpers)
configure_package_config_file(
    "${PROJECT_SOURCE_DIR}/cmake/${PROJECT_NAME}Config.cmake.in"
    "${PROJECT_BINARY_DIR}/${PROJECT_NAME}Config.cmake"
    INSTALL_DESTINATION
    ${CMAKE_INSTALL_LIBDIR}/cmake/DemoLib-${PROJECT_VERSION})

write_basic_package_version_file(
    "${PROJECT_NAME}ConfigVersion.cmake"
    VERSION ${PROJECT_VERSION}
    COMPATIBILITY SameMajorVersion)

install(FILES
    ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config.cmake
    ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake
    DESTINATION
    ${CMAKE_INSTALL_LIBDIR}/cmake/DemoLib-${PROJECT_VERSION})

