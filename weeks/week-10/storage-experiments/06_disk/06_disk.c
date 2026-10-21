#define _POSIX_C_SOURCE 200809L
#include <errno.h>
#include <fcntl.h>
#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <time.h>
#include <unistd.h>
#ifdef __linux__
#include <sys/vfs.h>
#endif

#define CHUNK (4U * 1024U * 1024U)
#define DEFAULT_SIZE (256ULL * 1024ULL * 1024ULL)
static volatile uint64_t sink;
static char cleanup_file[4096];
static char cleanup_dir[4096];
static int cleanup_own_dir;

static int remove_file(void)
{
    if (!cleanup_file[0]) return 0;
    if (unlink(cleanup_file) != 0 && errno != ENOENT) {
        perror("unlink scratch file");
        return -1;
    }
    cleanup_file[0] = '\0';
    return 0;
}

static int cleanup(void)
{
    int failed = 0;
    if (remove_file() != 0) failed = 1;
    if (cleanup_own_dir && cleanup_dir[0]) {
        if (rmdir(cleanup_dir) != 0 && errno != ENOENT) {
            perror("rmdir scratch directory");
            failed = 1;
        } else {
            cleanup_dir[0] = '\0';
            cleanup_own_dir = 0;
        }
    }
    return failed ? -1 : 0;
}

static void cleanup_at_exit(void) { (void)cleanup(); }

static void prepare_scratch_file(const char *dir)
{
    char path[4096];
    int n = snprintf(path, sizeof path, "%s/disk-bench-XXXXXX", dir);
    if (n < 0 || (size_t)n >= sizeof path) { fprintf(stderr, "scratch path too long\n"); exit(1); }
    int fd = mkstemp(path);
    if (fd < 0) { perror("mkstemp scratch file"); exit(1); }
    if (strlen(path) >= sizeof cleanup_file) { fprintf(stderr, "scratch path too long\n"); if (close(fd) != 0) perror("close scratch file"); if (unlink(path) != 0 && errno != ENOENT) perror("unlink scratch file"); exit(1); }
    strcpy(cleanup_file, path);
    if (close(fd) != 0) { perror("close scratch file"); exit(1); }
}

static double now_s(void)
{
    struct timespec t;
    if (clock_gettime(CLOCK_MONOTONIC, &t) != 0) { perror("clock_gettime"); exit(1); }
    return (double)t.tv_sec + (double)t.tv_nsec / 1e9;
}

static void full_write(int fd, const void *buf, size_t n)
{
    const char *p = buf;
    while (n) {
        ssize_t k = write(fd, p, n);
        if (k < 0 && errno == EINTR) continue;
        if (k <= 0) { perror("write"); exit(1); }
        p += k; n -= (size_t)k;
    }
}

static void full_read(int fd, void *buf, size_t n)
{
    char *p = buf;
    while (n) {
        ssize_t k = read(fd, p, n);
        if (k < 0 && errno == EINTR) continue;
        if (k <= 0) { perror("read"); exit(1); }
        p += k; n -= (size_t)k;
    }
}

static void syncfd(int fd) { if (fsync(fd) != 0) { perror("fsync"); exit(1); } }

static void trial(const char *path, size_t bytes, int mode,
                  double *write_s, double *warm_s, double *cold_s, int *advice_ok)
{
    int fd = open(path, O_CREAT | O_TRUNC | O_RDWR, 0600);
    if (fd < 0) { perror("open scratch file"); exit(1); }
    char *buffer = malloc(CHUNK);
    if (!buffer) { perror("malloc"); exit(1); }
    for (size_t i = 0; i < CHUNK; i++) buffer[i] = (char)(i * 31U + 7U);
    double start = now_s();
    size_t left = bytes;
    while (left) {
        size_t n = left < CHUNK ? left : CHUNK;
        full_write(fd, buffer, n); left -= n;
        if (mode == 2) syncfd(fd);
    }
    if (mode == 1) syncfd(fd);
    *write_s = now_s() - start;
    if (lseek(fd, 0, SEEK_SET) < 0) { perror("lseek"); exit(1); }
    start = now_s(); left = bytes; uint64_t sum = 0;
    while (left) {
        size_t n = left < CHUNK ? left : CHUNK;
        full_read(fd, buffer, n);
        for (size_t i = 0; i < n; i += 4096) sum += (unsigned char)buffer[i];
        left -= n;
    }
    *warm_s = now_s() - start; sink += sum;
    syncfd(fd);
#if defined(POSIX_FADV_DONTNEED)
    int advice_error = posix_fadvise(fd, 0, 0, POSIX_FADV_DONTNEED);
    *advice_ok = advice_error == 0;
    if (advice_error != 0) fprintf(stderr, "posix_fadvise failed: %s\n", strerror(advice_error));
#else
    *advice_ok = 0;
#endif
    if (lseek(fd, 0, SEEK_SET) < 0) { perror("lseek"); exit(1); }
    start = now_s(); left = bytes; sum = 0;
    while (left) {
        size_t n = left < CHUNK ? left : CHUNK;
        full_read(fd, buffer, n);
        for (size_t i = 0; i < n; i += 4096) sum += (unsigned char)buffer[i];
        left -= n;
    }
    *cold_s = now_s() - start; sink += sum;
    if (close(fd) != 0) { perror("close scratch file"); exit(1); }
    free(buffer);
}

/* Sorts three values ascending in place, so v[1] is the median. */
static void median3(double *v)
{
    for (int i = 0; i < 3; i++)
        for (int j = i + 1; j < 3; j++)
            if (v[i] > v[j]) { double x = v[i]; v[i] = v[j]; v[j] = x; }
}

static int parse_bytes(const char *text, size_t *bytes)
{
    if (*text == '-' || *text == '+') return 0;
    errno = 0; char *end = NULL;
    unsigned long long parsed = strtoull(text, &end, 10);
    if (errno != 0 || end == text || *end != '\0' || parsed == 0 || parsed > SIZE_MAX) return 0;
    *bytes = (size_t)parsed;
    return 1;
}

int main(int argc, char **argv)
{
    char templ[] = "/tmp/arch-disk-XXXXXX";
    int own_dir = argc <= 1;
    const char *dir = own_dir ? mkdtemp(templ) : argv[1];
    size_t bytes = (size_t)DEFAULT_SIZE;
    if (argc > 3 || (argc > 1 && argv[1][0] == '\0') || (argc > 2 && !parse_bytes(argv[2], &bytes))) {
        fprintf(stderr, "usage: %s [scratch-dir] [positive-bytes]\n", argv[0]); return 2;
    }
    if (!dir) { perror("mkdtemp"); return 1; }
    if (own_dir) {
        if (strlen(dir) >= sizeof cleanup_dir) { fprintf(stderr, "scratch path too long\n"); return 1; }
        strcpy(cleanup_dir, dir); cleanup_own_dir = 1;
    }
    if (atexit(cleanup_at_exit) != 0) { fprintf(stderr, "could not register cleanup\n"); return 1; }
    struct stat st;
    if (stat(dir, &st) != 0 || !S_ISDIR(st.st_mode)) { perror("scratch directory"); return 1; }
    prepare_scratch_file(dir);

    char host[256] = "unknown", cpu[256] = "unknown", date[64] = "unknown";
    (void)gethostname(host, sizeof host); host[sizeof host - 1] = '\0';
    FILE *cf = fopen("/proc/cpuinfo", "r");
    if (cf) { char line[512]; while (fgets(line, sizeof line, cf)) if (!strncmp(line, "model name", 10)) { char *p = strchr(line, ':'); if (p) { snprintf(cpu, sizeof cpu, "%s", p + 2); cpu[strcspn(cpu, "\n")] = '\0'; } break; } fclose(cf); }
    time_t tt = time(NULL); struct tm tm;
    if (gmtime_r(&tt, &tm)) strftime(date, sizeof date, "%Y-%m-%dT%H:%M:%SZ", &tm);
    printf("# experiment=disk\n# host=%s\n# cpu=%s\n# date_utc=%s\n# flags=-std=c11 -O2 -Wall -Wextra\n", host, cpu, date);
#ifdef __linux__
    struct statfs fs;
    if (statfs(dir, &fs) == 0) {
        unsigned long type = (unsigned long)fs.f_type;
        const char *name = type == 0xef53UL ? "ext2/3/4" : type == 0x01021994UL ? "tmpfs" : type == 0x58465342UL ? "xfs" : type == 0x9123683eUL ? "btrfs" : type == 0x01021997UL ? "9p (WSL2 Windows drive share or similar)" : "unknown";
        printf("# filesystem_type=0x%lx (%s)\n", type, name);
        if (type == 0x01021994UL) puts("# WARNING: tmpfs is RAM, not disk");
        if (type == 0x01021997UL) puts("# WARNING: 9p is a file-sharing layer, so throughput may be limited by that layer rather than the device, and post_fadvise reads may not be cold");
    } else perror("statfs");
#else
    puts("# filesystem_type=use df -T on this platform");
#endif
    printf("# bytes=%zu\nkind,trial,method,write_MB_s,warm_read_MB_s,post_fadvise_read_MB_s,post_fadvise_warm_ratio,advice_status\n", bytes);
    double warm[3]; int advice_ok = 1;
    trial(cleanup_file, bytes, 1, &warm[0], &warm[1], &warm[2], &advice_ok);
    if (remove_file() != 0) return 1;
    prepare_scratch_file(dir);
    double results[3][3][3]; const char *names[] = {"buffered", "one_fsync", "fsync_each_4MiB"};
    for (int mode = 0; mode < 3; mode++) {
        double ratios[3]; int mode_advice_ok = 1;
        for (int t = 0; t < 3; t++) {
            trial(cleanup_file, bytes, mode, &results[mode][t][0], &results[mode][t][1], &results[mode][t][2], &advice_ok);
            printf("trial,%d,%s,%.2f,%.2f,%.2f,%.3f,%s\n", t + 1, names[mode], bytes / 1e6 / results[mode][t][0], bytes / 1e6 / results[mode][t][1], bytes / 1e6 / results[mode][t][2], results[mode][t][2] / results[mode][t][1], advice_ok ? "advice_accepted" : "advice_failed_not_cold");
            ratios[t] = results[mode][t][2] / results[mode][t][1]; mode_advice_ok &= advice_ok;
            if (remove_file() != 0) return 1;
            prepare_scratch_file(dir);
        }
        double w[3], r[3], c[3];
        for (int t = 0; t < 3; t++) { w[t] = bytes / 1e6 / results[mode][t][0]; r[t] = bytes / 1e6 / results[mode][t][1]; c[t] = bytes / 1e6 / results[mode][t][2]; }
        median3(w); median3(r); median3(c); median3(ratios);
        printf("median,,%s,%.2f,%.2f,%.2f,%.3f,%s\n", names[mode], w[1], r[1], c[1], ratios[1], mode_advice_ok ? "advice_accepted" : "advice_failed_not_cold");
    }
    double ratio = results[1][2][2] / results[1][2][1];
    if (!advice_ok) puts("# cold read advice failed; post_fadvise_read is not a cold-read measurement");
    else if (ratio < 1.2) puts("# cold read was not clearly slower; page cache may not have been dropped without root privileges");
    char small[4096] = {0}; int fd = open(cleanup_file, O_CREAT | O_TRUNC | O_RDWR, 0600);
    if (fd < 0) { perror("small-write open"); return 1; }
    double start = now_s();
    for (int i = 0; i < 2000; i++) { full_write(fd, small, sizeof small); if (fdatasync(fd) != 0) { perror("fdatasync"); return 1; } }
    double elapsed = now_s() - start;
    printf("# small_writes=2000 x 4096 bytes\n# fdatasync_ms_per_sync=%.4f\n", elapsed * 1000 / 2000);
    if (close(fd) != 0) { perror("close small-write file"); return 1; }
    if (remove_file() != 0) return 1;
    if (cleanup_own_dir && cleanup() != 0) return 1;
    return sink == UINT64_MAX ? 1 : 0;
}
