#define _POSIX_C_SOURCE 200809L
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

static volatile uint64_t sink;

static inline uint64_t step(uint64_t x) {
    return x * 6364136223846793005ULL + 1442695040888963407ULL;
}

static double now_s(void) {
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    return (double)ts.tv_sec + (double)ts.tv_nsec / 1e9;
}

int main(int argc, char **argv) {
    uint64_t n = argc > 1 ? strtoull(argv[1], NULL, 10) : 40000000ULL;
    uint64_t a = 1;
    double t0 = now_s();
    for (uint64_t i = 0; i < n; ++i) a = step(a);
    double dep = now_s() - t0;
    sink = a;

    uint64_t q = n / 4;
    uint64_t a0=1, a1=2, a2=3, a3=4;
    t0 = now_s();
    for (uint64_t i = 0; i < q; ++i) {
        a0 = step(a0); a1 = step(a1); a2 = step(a2); a3 = step(a3);
    }
    double indep = now_s() - t0;
    sink ^= a0 ^ a1 ^ a2 ^ a3;

    puts("mode,updates,seconds,ns_per_update,checksum");
    printf("dependent,%llu,%.9f,%.6f,%llu\n", (unsigned long long)n, dep, dep*1e9/(double)n, (unsigned long long)a);
    printf("independent4,%llu,%.9f,%.6f,%llu\n", (unsigned long long)(q*4), indep, indep*1e9/(double)(q*4), (unsigned long long)(a0^a1^a2^a3));
    if (sink == 0xdeadbeefULL) fprintf(stderr, "%llu", (unsigned long long)sink);
    return 0;
}
