set(CMAKE_SYSTEM_NAME       iOS)
set(CMAKE_SYSTEM_PROCESSOR  x86_64)

set(triple x86_64-apple-ios-simulator)

set(CMAKE_C_COMPILER            clang)
set(CMAKE_C_COMPILER_TARGET     ${triple})
set(CMAKE_CXX_COMPILER          clang++)
set(CMAKE_CXX_COMPILER_TARGET   ${triple})
execute_process(
    COMMAND xcrun --sdk iphonesimulator --show-sdk-path
    OUTPUT_VARIABLE SYSROOT
    OUTPUT_STRIP_TRAILING_WHITESPACE)
set(CMAKE_SYSROOT               ${SYSROOT}___TEST)
