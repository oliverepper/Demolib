#include <stdio.h>
#include <demo.h>

void side_effect_for(const enum demo_case x) {
    if (x == CASE_A)
        printf("A\n");
    else
        printf("B\n");
}

int demo_sum(int a, int b) {
    return a + b;
}