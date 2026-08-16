#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <omp.h>

static double now_s(void) {
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    return (double)ts.tv_sec + (double)ts.tv_nsec / 1e9;
}

static uint64_t mix(uint64_t x) {
    x ^= x >> 33; x *= 0xff51afd7ed558ccdULL;
    x ^= x >> 33; x *= 0xc4ceb9fe1a85ec53ULL;
    x ^= x >> 33; return x;
}

int main(int argc, char **argv) {
    long long n = argc > 1 ? atoll(argv[1]) : 12000000LL;
    int max_threads = omp_get_max_threads();
    if (max_threads > 8) max_threads = 8;
    puts("threads,seconds,speedup,checksum");
    double baseline = 0.0;
    for (int t = 1; t <= max_threads; t *= 2) {
        omp_set_num_threads(t);
        uint64_t sum = 0;
        double t0 = now_s();
        #pragma omp parallel for reduction(+:sum) schedule(static)
        for (long long i = 0; i < n; ++i) sum += mix((uint64_t)i + 12345u);
        double elapsed = now_s() - t0;
        if (t == 1) baseline = elapsed;
        printf("%d,%.9f,%.6f,%llu\n", t, elapsed, baseline / elapsed, (unsigned long long)sum);
    }
    return 0;
}
