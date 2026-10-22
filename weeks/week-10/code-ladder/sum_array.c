#include <stdio.h>
#define COUNT 1000000
static long numbers[COUNT];

int main(void) {
    for (long i = 0; i < COUNT; i++) numbers[i] = i;
    long total = 0;
    for (long i = 0; i < COUNT; i++) total += numbers[i];
    printf("%ld\n", total);
    return 0;
}
