#include <iostream>
#include <demo.hpp>
#include <demo.h>

void demo::demo::side_effect_for(const enum demo_case x) {
    std::cout << "Calling into C code\n";
    ::side_effect_for(x);
    #ifdef EXTRA_MSG
    std::cout << "Did call into C code\n";
    #endif
}