# set(CMAKE_SYSTEM_NAME       Linux)
# set(CMAKE_SYSTEM_PROCESSOR  ARM)

# set(CMAKE_C_COMPILER
#     /Volumes/CASESENSITIVE/crosstool-ng/x-tools/armv8-rpi3-linux-gnueabihf/bin/armv8-rpi3-linux-gnueabihf-gcc)

# set(CMAKE_CXX_COMPILER
#     /Volumes/CASESENSITIVE/crosstool-ng/x-tools/armv8-rpi3-linux-gnueabihf/bin/armv8-rpi3-linux-gnueabihf-g++)

# set(CMAKE_SYSROOT
#     /Volumes/CASESENSITIVE/crosstool-ng/x-tools/armv8-rpi3-linux-gnueabihf/armv8-rpi3-linux-gnueabihf/sysroot)


set(CMAKE_SYSTEM_NAME       iOS)
set(CMAKE_SYSTEM_PROCESSOR  arm64e)

# set(triple arm64-apple-ios-simulator)
set(triple arm64-apple-ios-macabi)

set(CMAKE_C_COMPILER            clang)
set(CMAKE_C_COMPILER_TARGET     ${triple})
set(CMAKE_CXX_COMPILER          clang++)
set(CMAKE_CXX_COMPILER_TARGET   ${triple})
execute_process(
    # COMMAND xcrun --sdk iphonesimulator --show-sdk-path
    COMMAND xcrun --sdk macosx --show-sdk-path
    OUTPUT_VARIABLE SIMULATOR_SYSROOT
    OUTPUT_STRIP_TRAILING_WHITESPACE)
message("${SIMULATOR_SYSROOT}")
set(CMAKE_SYSROOT               ${SIMULATOR_SYSROOT})
