#ifndef DEMO_CPP_HPP
#define DEMO_CPP_HPP

#include <demo/types.h>
#include <demo_export.h>

namespace demo {

struct demo {
    DEMO_EXPORT static void side_effect_for(const enum demo_case);
};

}

#endif