#define _POSIX_C_SOURCE 200809L
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

static volatile uint64_t sink = 0;

static double now_ns(void) {
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    return (double)ts.tv_sec * 1e9 + (double)ts.tv_nsec;
}

static uint32_t rng_state = 0x12345678u;
static uint32_t xrnd(void) {
    uint32_t x = rng_state;
    x ^= x << 13; x ^= x >> 17; x ^= x << 5;
    rng_state = x;
    return x;
}

static void make_cycle(uint32_t *next, size_t n) {
    uint32_t *perm = malloc(n * sizeof(uint32_t));
    if (!perm) exit(2);
    for (size_t i = 0; i < n; ++i) perm[i] = (uint32_t)i;
    for (size_t i = n - 1; i > 0; --i) {
        size_t j = xrnd() % (i + 1);
        uint32_t t = perm[i]; perm[i] = perm[j]; perm[j] = t;
    }
    for (size_t i = 0; i + 1 < n; ++i) next[perm[i]] = perm[i + 1];
    next[perm[n - 1]] = perm[0];
    free(perm);
}

static double pointer_chase(size_t bytes) {
    size_t n = bytes / sizeof(uint32_t);
    uint32_t *next = aligned_alloc(64, ((bytes + 63) / 64) * 64);
    if (!next || n < 2) exit(2);
    make_cycle(next, n);
    size_t accesses = n < 1000000 ? n * 16 : n * 2;
    if (accesses < 200000) accesses = 200000;
    uint32_t idx = 0;
    double t0 = now_ns();
    for (size_t i = 0; i < accesses; ++i) idx = next[idx];
    double t1 = now_ns();
    sink += idx;
    free(next);
    return (t1 - t0) / (double)accesses;
}

static double stream_read(size_t bytes) {
    size_t n = bytes / sizeof(uint64_t);
    uint64_t *a = aligned_alloc(64, ((bytes + 63) / 64) * 64);
    if (!a || n < 2) exit(2);
    for (size_t i = 0; i < n; ++i) a[i] = i + 1;
    size_t reps = bytes < (1u << 20) ? 64 : (bytes < (8u << 20) ? 16 : 4);
    double t0 = now_ns();
    uint64_t s = 0;
    for (size_t r = 0; r < reps; ++r)
        for (size_t i = 0; i < n; ++i) s += a[i];
    double t1 = now_ns();
    sink += s;
    double total_bytes = (double)bytes * (double)reps;
    free(a);
    return total_bytes / ((t1 - t0) / 1e9) / 1e9;  // GB/s, decimal
}

int main(void) {
    const size_t sizes[] = {4u<<10, 32u<<10, 256u<<10, 2u<<20, 8u<<20, 32u<<20};
    const size_t count = sizeof(sizes)/sizeof(sizes[0]);
    puts("kind,size_bytes,value,unit");
    for (size_t i = 0; i < count; ++i) {
        double ns = pointer_chase(sizes[i]);
        printf("pointer_chase,%zu,%.6f,ns_per_access\n", sizes[i], ns);
        double gbps = stream_read(sizes[i]);
        printf("stream_read,%zu,%.6f,GB_per_s\n", sizes[i], gbps);
    }
    if (sink == 0xdeadbeef) fprintf(stderr, "%llu\n", (unsigned long long)sink);
    return 0;
}
