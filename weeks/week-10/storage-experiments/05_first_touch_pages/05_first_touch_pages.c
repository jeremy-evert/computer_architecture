#define _GNU_SOURCE
#define _POSIX_C_SOURCE 200809L
#include <errno.h>
#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <sys/resource.h>
#include <time.h>
#include <unistd.h>

#ifndef MAP_POPULATE
#define MAP_POPULATE 0x8000
#endif

#define TRIALS 3
#define DEFAULT_BYTES (512ULL * 1024ULL * 1024ULL)

typedef struct {
    double map_ns;
    double touch_ns;
    long map_minflt;
    long map_majflt;
    long minflt;
    long majflt;
    double ns_per_page;
} sample;

static volatile unsigned char page_sink;

static double elapsed_ns(const struct timespec *start, const struct timespec *end)
{
    return (double)(end->tv_sec - start->tv_sec) * 1e9 + (double)(end->tv_nsec - start->tv_nsec);
}

static int get_usage(struct rusage *usage)
{
    return getrusage(RUSAGE_SELF, usage);
}

/* Volatile writes keep each timed page touch observable to the compiler. */
static void touch_pages(volatile unsigned char *memory, size_t bytes, size_t page_size)
{
    unsigned char last = 0;
    for (size_t offset = 0; offset < bytes; offset += page_size) {
        memory[offset] = 1U;
        last = memory[offset];
    }
    page_sink = last;
}

static int read_available_bytes(uint64_t *available)
{
    FILE *file = fopen("/proc/meminfo", "r");
    char label[64];
    unsigned long long kib;
    char unit[16];
    if (file == NULL) return -1;
    while (fscanf(file, "%63s %llu %15s", label, &kib, unit) == 3) {
        if (strcmp(label, "MemAvailable:") == 0) {
            fclose(file);
            if (kib > UINT64_MAX / 1024ULL) return -1;
            *available = (uint64_t)kib * 1024ULL;
            return 0;
        }
    }
    fclose(file);
    return -1;
}

static int parse_size(const char *text, uint64_t *bytes)
{
    char *end = NULL;
    errno = 0;
    unsigned long long value = strtoull(text, &end, 10);
    if (errno != 0 || end == text || value == 0) return -1;
    uint64_t scale = 1;
    if (*end == '\0') scale = 1;
    else if ((*end == 'K' || *end == 'k') && end[1] == '\0') scale = 1024ULL;
    else if ((*end == 'M' || *end == 'm') && end[1] == '\0') scale = 1024ULL * 1024ULL;
    else if ((*end == 'G' || *end == 'g') && end[1] == '\0') scale = 1024ULL * 1024ULL * 1024ULL;
    else return -1;
    if (value > UINT64_MAX / scale) return -1;
    *bytes = (uint64_t)value * scale;
    return 0;
}

static void print_metadata(uint64_t bytes, size_t pages, size_t page_size, uint64_t available)
{
    char host[256] = "unknown";
    char cpu[256] = "unknown";
    char date[64] = "unknown";
    char thp[256] = "unavailable";
    time_t now = time(NULL);
    struct tm utc;
    FILE *file;
    if (gethostname(host, sizeof(host) - 1) != 0) (void)strcpy(host, "unknown");
    host[sizeof(host) - 1] = '\0';
    file = fopen("/proc/cpuinfo", "r");
    if (file != NULL) {
        char line[512];
        while (fgets(line, sizeof(line), file) != NULL) {
            if (strncmp(line, "model name", 10) == 0) {
                char *colon = strchr(line, ':');
                if (colon != NULL) {
                    colon++;
                    while (*colon == ' ' || *colon == '\t') colon++;
                    (void)snprintf(cpu, sizeof(cpu), "%s", colon);
                    cpu[strcspn(cpu, "\r\n")] = '\0';
                }
                break;
            }
        }
        fclose(file);
    }
    file = fopen("/sys/kernel/mm/transparent_hugepage/enabled", "r");
    if (file != NULL) {
        if (fgets(thp, sizeof(thp), file) != NULL) thp[strcspn(thp, "\r\n")] = '\0';
        fclose(file);
    }
    if (gmtime_r(&now, &utc) != NULL) (void)strftime(date, sizeof(date), "%Y-%m-%dT%H:%M:%SZ", &utc);
    printf("# experiment=first_touch_pages\n# host=%s\n# cpu=%s\n# utc=%s\n", host, cpu, date);
    printf("# compiler_flags=%s\n# region_bytes=%" PRIu64 "\n# page_size=%zu\n# pages=%zu\n",
           "-std=c11 -O2 -Wall -Wextra", bytes, page_size, pages);
    printf("# MemAvailable_bytes=%" PRIu64 "\n# transparent_hugepage_enabled=%s\n", available, thp);
}

static sample measure_one(size_t bytes, size_t page_size, int populate, int pass_number)
{
    sample output = {0};
    int flags = MAP_PRIVATE | MAP_ANONYMOUS | (populate ? MAP_POPULATE : 0);
    struct timespec map_start, map_end, touch_start, touch_end;
    struct rusage before_map, after_map, before_touch, after_touch;
    if (get_usage(&before_map) != 0 || clock_gettime(CLOCK_MONOTONIC, &map_start) != 0) {
        perror("measurement setup");
        exit(1);
    }
    void *mapping = mmap(NULL, bytes, PROT_READ | PROT_WRITE, flags, -1, 0);
    if (mapping == MAP_FAILED) {
        perror("mmap");
        exit(1);
    }
    if (clock_gettime(CLOCK_MONOTONIC, &map_end) != 0 || get_usage(&after_map) != 0) {
        perror("mapping measurement");
        (void)munmap(mapping, bytes);
        exit(1);
    }
    output.map_ns = elapsed_ns(&map_start, &map_end);
    output.map_minflt = after_map.ru_minflt - before_map.ru_minflt;
    output.map_majflt = after_map.ru_majflt - before_map.ru_majflt;
    if (pass_number == 2) {
        touch_pages((volatile unsigned char *)mapping, bytes, page_size);
    }
    if (get_usage(&before_touch) != 0 || clock_gettime(CLOCK_MONOTONIC, &touch_start) != 0) {
        perror("touch measurement setup");
        (void)munmap(mapping, bytes);
        exit(1);
    }
    touch_pages((volatile unsigned char *)mapping, bytes, page_size);
    if (clock_gettime(CLOCK_MONOTONIC, &touch_end) != 0 || get_usage(&after_touch) != 0) {
        perror("touch measurement");
        (void)munmap(mapping, bytes);
        exit(1);
    }
    output.touch_ns = elapsed_ns(&touch_start, &touch_end);
    output.ns_per_page = output.touch_ns / (double)((bytes + page_size - 1) / page_size);
    output.minflt = after_touch.ru_minflt - before_touch.ru_minflt;
    output.majflt = after_touch.ru_majflt - before_touch.ru_majflt;
    if (munmap(mapping, bytes) != 0) {
        perror("munmap");
        exit(1);
    }
    (void)after_map;
    return output;
}

static int compare_double(const void *a, const void *b)
{
    double left = *(const double *)a;
    double right = *(const double *)b;
    return (left > right) - (left < right);
}

static long median_long(long values[TRIALS])
{
    long sorted[TRIALS];
    memcpy(sorted, values, sizeof(sorted));
    for (size_t i = 0; i < TRIALS; i++) {
        for (size_t j = i + 1; j < TRIALS; j++) {
            if (sorted[j] < sorted[i]) {
                long temporary = sorted[i];
                sorted[i] = sorted[j];
                sorted[j] = temporary;
            }
        }
    }
    return sorted[1];
}

static void report_mode(const char *mode, sample trials[TRIALS], size_t pages)
{
    double ns[TRIALS];
    long minor[TRIALS], major[TRIALS];
    for (size_t i = 0; i < TRIALS; i++) {
        ns[i] = trials[i].ns_per_page;
        minor[i] = trials[i].minflt;
        major[i] = trials[i].majflt;
        printf("%s,%zu,%zu,%.0f,%ld,%ld,%.3f,%ld,%ld\n", mode, i + 1, pages,
               trials[i].map_ns, trials[i].map_minflt, trials[i].map_majflt,
               trials[i].ns_per_page, trials[i].minflt, trials[i].majflt);
    }
    qsort(ns, TRIALS, sizeof(ns[0]), compare_double);
    double map_ns[TRIALS];
    long map_minor[TRIALS], map_major[TRIALS];
    for (size_t i = 0; i < TRIALS; i++) {
        map_ns[i] = trials[i].map_ns;
        map_minor[i] = trials[i].map_minflt;
        map_major[i] = trials[i].map_majflt;
    }
    qsort(map_ns, TRIALS, sizeof(map_ns[0]), compare_double);
    printf("%s,median,%zu,%.0f,%ld,%ld,%.3f,%ld,%ld\n", mode, pages, map_ns[1],
           median_long(map_minor), median_long(map_major), ns[1], median_long(minor),
           median_long(major));
}

static void warm_up(size_t page_size)
{
    for (int populate = 0; populate <= 1; populate++) {
        int flags = MAP_PRIVATE | MAP_ANONYMOUS | (populate ? MAP_POPULATE : 0);
        void *mapping = mmap(NULL, page_size, PROT_READ | PROT_WRITE, flags, -1, 0);
        if (mapping == MAP_FAILED) {
            perror("warm-up mmap");
            exit(1);
        }
        touch_pages((volatile unsigned char *)mapping, page_size, page_size);
        touch_pages((volatile unsigned char *)mapping, page_size, page_size);
        if (munmap(mapping, page_size) != 0) {
            perror("warm-up munmap");
            exit(1);
        }
    }
}

int main(int argc, char **argv)
{
    uint64_t bytes64 = DEFAULT_BYTES;
    uint64_t available;
    long page_size_long = sysconf(_SC_PAGESIZE);
    if (argc > 2 || (argc == 2 && parse_size(argv[1], &bytes64) != 0)) {
        fprintf(stderr, "usage: %s [bytes[K|M|G]]\n", argv[0]);
        return 2;
    }
    if (page_size_long <= 0) {
        fprintf(stderr, "could not determine page size\n");
        return 1;
    }
    if (read_available_bytes(&available) != 0) {
        fprintf(stderr, "could not read MemAvailable from /proc/meminfo\n");
        return 1;
    }
    if ((long double)bytes64 > (long double)available * 0.40L) {
        fprintf(stderr, "refusing region: requested bytes exceed 40%% of MemAvailable\n");
        return 1;
    }
    if (bytes64 > SIZE_MAX) {
        fprintf(stderr, "requested region is not addressable on this system\n");
        return 1;
    }
    size_t bytes = (size_t)bytes64;
    size_t page_size = (size_t)page_size_long;
    if (bytes > SIZE_MAX - (page_size - 1)) {
        fprintf(stderr, "invalid region size\n");
        return 1;
    }
    size_t pages = (bytes + page_size - 1) / page_size;
    if (pages == 0) {
        fprintf(stderr, "invalid region size\n");
        return 1;
    }
    print_metadata(bytes64, pages, page_size, available);
    puts("mode,trial,pages,map_ns,map_minflt,map_majflt,ns_per_page,minflt,majflt");
    warm_up(page_size);

    sample normal[TRIALS];
    sample populated[TRIALS];
    sample second[TRIALS];
    for (size_t i = 0; i < TRIALS; i++) {
        normal[i] = measure_one(bytes, page_size, 0, 1);
        second[i] = measure_one(bytes, page_size, 0, 2);
        populated[i] = measure_one(bytes, page_size, 1, 1);
    }
    report_mode("first-touch", normal, pages);
    report_mode("second-touch", second, pages);
    report_mode("MAP_POPULATE-first-touch", populated, pages);
    return 0;
}
