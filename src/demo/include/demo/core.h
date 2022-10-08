#ifndef DEMO_CORE_H
#define DEMO_CORE_H

#include <demo/types.h>
#include <demo_export.h>

#ifdef __cplusplus
extern "C" {
#endif

DEMO_EXPORT void side_effect_for(const enum demo_case);
DEMO_EXPORT int demo_sum(int, int);

#ifdef __cplusplus
}
#endif
#endif