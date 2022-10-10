set(CMAKE_SYSTEM_NAME       Linux)
set(CMAKE_SYSTEM_PROCESSOR  X86_64)

set(basepath
    "/Volumes/CASESENSITIVE/crosstool-ng/x-tools/x86_64-ubuntu16.04-linux-gnu")

set(CMAKE_C_COMPILER
    ${basepath}/bin/x86_64-ubuntu16.04-linux-gnu-gcc)

set(CMAKE_CXX_COMPILER
    ${basepath}/bin/x86_64-ubuntu16.04-linux-gnu-g++)

set(CMAKE_SYSROOT
    ${basepath}/x86_64-ubuntu16.04-linux-gnu/sysroot)
