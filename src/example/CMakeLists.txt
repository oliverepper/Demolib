add_executable(c-demo-objfiles main.c)
target_link_libraries(c-demo-objfiles PRIVATE demolib)

add_executable(c-demo-static main.c)
target_link_libraries(c-demo-static PRIVATE demolib_static)

add_executable(c-demo-shared main.c)
target_link_libraries(c-demo-shared PRIVATE demolib_shared)

add_executable(cpp-demo-objfiles main.cpp)
target_link_libraries(cpp-demo-objfiles PRIVATE democpplib)

add_executable(cpp-demo-static main.cpp)
target_link_libraries(cpp-demo-static PRIVATE democpplib_static)

add_executable(cpp-demo-shared main.cpp)
target_link_libraries(cpp-demo-shared PRIVATE democpplib_shared)