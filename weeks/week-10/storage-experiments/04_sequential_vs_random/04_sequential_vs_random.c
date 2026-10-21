#define _POSIX_C_SOURCE 200809L
#include <dirent.h>
#include <errno.h>
#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>

#define TRIALS 3
#define PASSES 10
#define MIB (1024ULL * 1024ULL)

/* The sink and barrier keep the compiler from removing the measured reads. */
static volatile uint64_t result_sink;

static uint64_t xorshift64(uint64_t *state)
{
    uint64_t x = *state;
    x ^= x << 13;
    x ^= x >> 7;
    x ^= x << 17;
    *state = x;
    return x;
}

static uint64_t parse_cache_size(const char *text)
{
    char *end = NULL;
    unsigned long long value = strtoull(text, &end, 10);
    if (end == text || value == 0) return 0;
    if (*end == 'K' || *end == 'k') value *= 1024ULL;
    else if (*end == 'M' || *end == 'm') value *= MIB;
    else if (*end != '\0') return 0;
    return (uint64_t)value;
}

static uint64_t last_level_cache_bytes(void)
{
    const char *base = "/sys/devices/system/cpu/cpu0/cache";
    DIR *dir = opendir(base);
    if (dir == NULL) return 0;
    unsigned best_level = 0;
    uint64_t best_size = 0;
    struct dirent *entry;
    while ((entry = readdir(dir)) != NULL) {
        unsigned index = 0;
        char path[512];
        char type[32] = "";
        unsigned level = 0;
        FILE *file;
        if (sscanf(entry->d_name, "index%u", &index) != 1) continue;
        (void)snprintf(path, sizeof(path), "%s/%s/level", base, entry->d_name);
        file = fopen(path, "r");
        if (file == NULL) continue;
        if (fscanf(file, "%u", &level) != 1) level = 0;
        fclose(file);
        (void)snprintf(path, sizeof(path), "%s/%s/type", base, entry->d_name);
        file = fopen(path, "r");
        if (file == NULL) continue;
        if (fscanf(file, "%31s", type) != 1) type[0] = '\0';
        fclose(file);
        if (strcmp(type, "Unified") != 0 && strcmp(type, "Data") != 0) continue;
        (void)snprintf(path, sizeof(path), "%s/%s/size", base, entry->d_name);
        file = fopen(path, "r");
        if (file == NULL) continue;
        char size_text[64] = "";
        if (fscanf(file, "%63s", size_text) != 1) size_text[0] = '\0';
        fclose(file);
        uint64_t size = parse_cache_size(size_text);
        if (level > best_level || (level == best_level && size > best_size)) {
            best_level = level;
            best_size = size;
        }
        (void)index;
    }
    closedir(dir);
    return best_size;
}

static void print_metadata(uint64_t buffer_bytes, uint64_t reads)
{
    char host[256] = "unknown";
    char cpu[256] = "unknown";
    char date[64] = "unknown";
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
    if (gmtime_r(&now, &utc) != NULL) (void)strftime(date, sizeof(date), "%Y-%m-%dT%H:%M:%SZ", &utc);
    printf("# experiment=sequential_vs_random\n# host=%s\n# cpu=%s\n# utc=%s\n", host, cpu, date);
    printf("# compiler_flags=%s\n# buffer_bytes=%" PRIu64 "\n# reads_per_mode=%" PRIu64 "\n",
           "-std=c11 -O2 -Wall -Wextra", buffer_bytes, reads);
    puts("# random-independent also reads a sequential shuffled-index array.");
}

static double elapsed_ns(const struct timespec *start, const struct timespec *end)
{
    return (double)(end->tv_sec - start->tv_sec) * 1e9 + (double)(end->tv_nsec - start->tv_nsec);
}

static double run_sequential_independent(const uint64_t *data, size_t count)
{
    struct timespec start, end;
    uint64_t sum = 0;
    if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) { perror("clock_gettime"); exit(1); }
    for (size_t pass = 0; pass < PASSES; pass++) {
        for (size_t i = 0; i < count; i++) sum += data[i];
    }
    __asm__ volatile("" : "+r"(sum));
    result_sink = sum;
    if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) { perror("clock_gettime"); exit(1); }
    return elapsed_ns(&start, &end);
}

static double run_random_independent(const uint64_t *data, const uint64_t *indices, size_t count)
{
    struct timespec start, end;
    uint64_t sum = 0;
    if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) { perror("clock_gettime"); exit(1); }
    for (size_t pass = 0; pass < PASSES; pass++) {
        for (size_t i = 0; i < count; i++) sum += data[indices[i]];
    }
    __asm__ volatile("" : "+r"(sum));
    result_sink = sum;
    if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) { perror("clock_gettime"); exit(1); }
    return elapsed_ns(&start, &end);
}

static double run_dependent(uint64_t *data, uint64_t reads)
{
    struct timespec start, end;
    uint64_t index = 0;
    if (clock_gettime(CLOCK_MONOTONIC, &start) != 0) { perror("clock_gettime"); exit(1); }
    for (uint64_t i = 0; i < reads; i++) index = data[index];
    __asm__ volatile("" : "+r"(index));
    result_sink = index;
    if (clock_gettime(CLOCK_MONOTONIC, &end) != 0) { perror("clock_gettime"); exit(1); }
    return elapsed_ns(&start, &end);
}

static int compare_double(const void *a, const void *b)
{
    double left = *(const double *)a;
    double right = *(const double *)b;
    return (left > right) - (left < right);
}

static void report_mode(const char *name, double trials[TRIALS], uint64_t reads)
{
    for (size_t i = 0; i < TRIALS; i++) {
        printf("%s,%zu,%" PRIu64 ",%.0f,%.3f,%.3f\n", name, i + 1, reads, trials[i],
               trials[i] / (double)reads, (double)reads * 8.0 / trials[i]);
    }
    qsort(trials, TRIALS, sizeof(trials[0]), compare_double);
    printf("%s,median,%" PRIu64 ",%.0f,%.3f,%.3f\n", name, reads, trials[1],
           trials[1] / (double)reads, (double)reads * 8.0 / trials[1]);
}

int main(void)
{
    uint64_t llc = last_level_cache_bytes();
    uint64_t buffer_bytes = 256ULL * MIB;
    if (llc != 0 && llc <= UINT64_MAX / 4 && llc * 4 > buffer_bytes) buffer_bytes = llc * 4;
    buffer_bytes -= buffer_bytes % sizeof(uint64_t);
    size_t count = (size_t)(buffer_bytes / sizeof(uint64_t));
    if ((uint64_t)count != buffer_bytes / sizeof(uint64_t) || count == 0 ||
        (uint64_t)count > UINT64_MAX / PASSES) {
        fprintf(stderr, "buffer size is not addressable on this system\n");
        return 1;
    }
    uint64_t *data = malloc(count * sizeof(*data));
    uint64_t *indices = malloc(count * sizeof(*indices));
    if (data == NULL || indices == NULL) {
        fprintf(stderr, "could not allocate the data buffer and shuffled index array\n");
        free(data);
        free(indices);
        return 1;
    }
    for (size_t i = 0; i < count; i++) {
        data[i] = (uint64_t)i;
        indices[i] = (uint64_t)i;
    }
    uint64_t state = UINT64_C(0x9e3779b97f4a7c15);
    for (size_t i = count - 1; i > 0; i--) {
        size_t j = (size_t)(xorshift64(&state) % (uint64_t)(i + 1));
        uint64_t temporary = indices[i];
        indices[i] = indices[j];
        indices[j] = temporary;
    }
    uint64_t reads = (uint64_t)count * PASSES;
    print_metadata(buffer_bytes, reads);
    puts("mode,trial,reads,elapsed_ns,ns_per_read,effective_GB_s");

    (void)run_sequential_independent(data, count);
    double times[TRIALS];
    for (size_t t = 0; t < TRIALS; t++) times[t] = run_sequential_independent(data, count);
    report_mode("sequential-independent", times, reads);

    (void)run_random_independent(data, indices, count);
    for (size_t t = 0; t < TRIALS; t++) times[t] = run_random_independent(data, indices, count);
    report_mode("random-independent", times, reads);

    for (size_t i = 0; i < count; i++) data[i] = (uint64_t)((i + 1) % count);
    (void)run_dependent(data, reads);
    for (size_t t = 0; t < TRIALS; t++) times[t] = run_dependent(data, reads);
    report_mode("sequential-dependent", times, reads);

    for (size_t i = 0; i < count; i++) data[indices[i]] = indices[(i + 1) % count];
    (void)run_dependent(data, reads);
    for (size_t t = 0; t < TRIALS; t++) times[t] = run_dependent(data, reads);
    report_mode("random-dependent", times, reads);

    free(indices);
    free(data);
    return 0;
}
