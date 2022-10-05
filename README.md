# DemoLib

This is a more or less sophisticated example library providing a C and a C++ API. Demo binaries will be ad-hoc codesigned after the build and after the installation again, when the approriate r-path is installed.

The API that is supposed to be public is made public through an export header. All other symbols default to hidden.

The library can be build via the Xcode generator. Make and Ninja should work, too.

## Build

```sh
cmake -B out -DCMAKE_INSTALL_PREFIX=$(pwd)/tmp --log-level=Debug -G Xcode
cmake --build out --config Release
cmake --install out --config Release
```

Result:

```pre
tmp
├── bin
│   ├── c-demo-objfiles
│   ├── c-demo-shared
│   ├── c-demo-static
│   ├── cpp-demo-objfiles
│   ├── cpp-demo-shared
│   └── cpp-demo-static
├── include
│   ├── demo
│   │   ├── core.h
│   │   └── types.h
│   ├── demo.h
│   ├── demo.hpp
│   └── demo_export.h
└── lib
    ├── libdemo.0.0.1.dylib
    ├── libdemo.0.dylib -> libdemo.0.0.1.dylib
    ├── libdemo.a
    ├── libdemo.dylib -> libdemo.0.dylib
    ├── libdemocpp.0.0.1.dylib
    ├── libdemocpp.0.dylib -> libdemocpp.0.0.1.dylib
    ├── libdemocpp.a
    └── libdemocpp.dylib -> libdemocpp.0.dylib

4 directories, 19 files
```
