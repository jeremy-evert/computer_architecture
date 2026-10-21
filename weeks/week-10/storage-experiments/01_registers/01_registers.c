#define _POSIX_C_SOURCE 200809L
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>

#define CALIBRATE_NS 100e6
static volatile uint64_t sink;
static double now_ns(void) { struct timespec t; if (clock_gettime(CLOCK_MONOTONIC, &t) != 0) exit(2); return (double)t.tv_sec * 1e9 + (double)t.tv_nsec; }
static void metadata(void) {
    char host[256] = "unknown", cpu[256] = "unknown";
    gethostname(host, sizeof host); host[sizeof host - 1] = '\0';
    FILE *f = fopen("/proc/cpuinfo", "r"); char line[512];
    if (f) { while (fgets(line, sizeof line, f)) if (strncmp(line, "model name", 10) == 0) { char *p = strchr(line, ':'); if (p) { p += 2; p[strcspn(p, "\r\n")] = '\0'; snprintf(cpu, sizeof cpu, "%s", p); } break; } fclose(f); }
    f = popen("date -u +%Y-%m-%dT%H:%M:%SZ", "r"); char date[64] = "unknown"; if (f) { if (fgets(date, sizeof date, f)) date[strcspn(date, "\r\n")] = '\0'; pclose(f); }
    printf("# experiment=01_registers\n# host=%s\n# cpu_model=%s\n# date_utc=%s\n# compiler_flags=-std=c11 -O2 -Wall -Wextra\n", host, cpu, date);
}

__attribute__((noinline)) static uint64_t register_loop(uint64_t n) {
    uint64_t x = 1;
    /* The volatile sink consumes the final recurrence result. */
    for (uint64_t i = 0; i < n; ++i) x = (x ^ i) + UINT64_C(7);
    sink = x; return x;
}
__attribute__((noinline)) static uint64_t volatile_loop(uint64_t n) {
    /* Volatile x forces each dependent update through memory. */
    volatile uint64_t x = 1;
    for (uint64_t i = 0; i < n; ++i) x = (x ^ i) + UINT64_C(7);
    sink = x; return x;
}
static double median(double a, double b, double c) { if (a > b) { double t=a; a=b; b=t; } if (b > c) { double t=b; b=c; c=t; } if (a > b) b=a; return b; }
int main(void) {
    double a[3], b[3];
    metadata(); puts("variant,trial,iterations,ns_per_iteration");
    register_loop(10000); volatile_loop(10000);
    /* Calibrate: double n until the faster (register) loop runs for CALIBRATE_NS, twice the 50 ms floor so
       trial-to-trial jitter cannot push a timed region below 50 ms. The slower volatile loop is longer still. */
    uint64_t n = UINT64_C(1) << 20;
    for (;;) {
        double s = now_ns(); register_loop(n); double e = now_ns();
        if (e - s >= CALIBRATE_NS) break;
        n *= 2;
    }
    for (int t=0; t<3; ++t) {
        double s=now_ns(); register_loop(n); double e=now_ns(); a[t]=(e-s)/(double)n;
        printf("register,%d,%llu,%.6f\n", t+1, (unsigned long long)n, a[t]);
        s=now_ns(); volatile_loop(n); e=now_ns(); b[t]=(e-s)/(double)n;
        printf("volatile,%d,%llu,%.6f\n", t+1, (unsigned long long)n, b[t]);
    }
    double ma=median(a[0],a[1],a[2]), mb=median(b[0],b[1],b[2]);
    printf("register_median,median,%llu,%.6f\n", (unsigned long long)n, ma);
    printf("volatile_median,median,%llu,%.6f\n", (unsigned long long)n, mb);
    printf("median_ratio,median,1,%.6f\n", mb/ma);
    return sink == UINT64_MAX ? 1 : 0;
}
