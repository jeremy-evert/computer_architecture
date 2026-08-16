#define _POSIX_C_SOURCE 200809L
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

static double now_s(void) {
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    return (double)ts.tv_sec + (double)ts.tv_nsec / 1e9;
}

__attribute__((noinline))
static void kernel(size_t n, const float *__restrict a, const float *__restrict b, float *__restrict c, float alpha) {
    for (size_t i=0; i<n; ++i) c[i] = a[i] * alpha + b[i];
}

int main(int argc, char **argv) {
    size_t n = argc > 1 ? strtoull(argv[1], NULL, 10) : 8000000ULL;
    float *a = aligned_alloc(64, ((n*sizeof(float)+63)/64)*64);
    float *b = aligned_alloc(64, ((n*sizeof(float)+63)/64)*64);
    float *c = aligned_alloc(64, ((n*sizeof(float)+63)/64)*64);
    if (!a || !b || !c) return 2;
    for (size_t i=0;i<n;++i){a[i]=(float)(i%97)*0.01f;b[i]=(float)(i%89)*0.02f;c[i]=0.0f;}
    double t0=now_s();
    for (int r=0;r<12;++r) kernel(n, a, b, c, 1.0001f + (float)r*0.00001f);
    double elapsed=now_s()-t0;
    double checksum=0.0;
    for(size_t i=0;i<n;i+=4096) checksum += c[i];
    printf("%zu,%.9f,%.6f\n", n, elapsed, checksum);
    free(a); free(b); free(c);
    return 0;
}
