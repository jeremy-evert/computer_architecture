#define _GNU_SOURCE
#ifndef FLAGS
#define FLAGS "unknown (built without -DFLAGS)"
#endif
#define _POSIX_C_SOURCE 200809L
#include <dirent.h>
#include <ctype.h>
#include <errno.h>
#include <inttypes.h>
#include <mntent.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/statfs.h>
#include <sys/statvfs.h>
#include <unistd.h>

static void value(const char *key, const char *text) {
    printf("%s=%s\n", key, text && *text ? text : "unknown");
}

static void read_one_line(const char *path, char *out, size_t cap) {
    FILE *f = fopen(path, "r");
    if (!f) { out[0] = '\0'; return; }
    if (!fgets(out, (int)cap, f)) out[0] = '\0';
    out[strcspn(out, "\r\n")] = '\0';
    fclose(f);
}

static void cpu_model(char *out, size_t cap) {
    FILE *f = fopen("/proc/cpuinfo", "r");
    char line[512];
    out[0] = '\0';
    if (!f) return;
    while (fgets(line, sizeof line, f)) {
        if (strncmp(line, "model name", 10) == 0 || strncmp(line, "Hardware", 8) == 0) {
            char *colon = strchr(line, ':');
            if (colon) {
                colon++;
                while (*colon == ' ' || *colon == '\t') colon++;
                colon[strcspn(colon, "\r\n")] = '\0';
                snprintf(out, cap, "%s", colon);
                break;
            }
        }
    }
    fclose(f);
}

static void caches(void) {
    DIR *d = opendir("/sys/devices/system/cpu/cpu0/cache");
    struct dirent *e;
    if (!d) { value("cpu0_cache", "unknown"); return; }
    while ((e = readdir(d))) {
        if (strncmp(e->d_name, "index", 5) != 0) continue;
        char base[512], path[768], level[64], size[64], line[64], ways[64], type[64];
        snprintf(base, sizeof base, "/sys/devices/system/cpu/cpu0/cache/%s", e->d_name);
#define READ_CACHE(field, file) do { snprintf(path, sizeof path, "%s/%s", base, file); read_one_line(path, field, sizeof field); } while (0)
        READ_CACHE(level, "level"); READ_CACHE(size, "size");
        READ_CACHE(line, "coherency_line_size"); READ_CACHE(ways, "ways_of_associativity");
        READ_CACHE(type, "type");
#undef READ_CACHE
        printf("cpu0_cache_%s_level=%s\n", e->d_name, *level ? level : "unknown");
        printf("cpu0_cache_%s_size=%s\n", e->d_name, *size ? size : "unknown");
        printf("cpu0_cache_%s_line_size=%s\n", e->d_name, *line ? line : "unknown");
        printf("cpu0_cache_%s_associativity=%s\n", e->d_name, *ways ? ways : "unknown");
        printf("cpu0_cache_%s_type=%s\n", e->d_name, *type ? type : "unknown");
    }
    closedir(d);
}

static void core_types(void) {
    DIR *d = opendir("/sys/devices/system/cpu");
    struct dirent *e;
    char first[64] = "", path[512], type[64];
    int distinct = 0, seen = 0;
    if (!d) { value("core_type_note", "unknown"); return; }
    while ((e = readdir(d))) {
        if (strncmp(e->d_name, "cpu", 3) != 0 || e->d_name[3] < '0' || e->d_name[3] > '9') continue;
        snprintf(path, sizeof path, "/sys/devices/system/cpu/%s/topology/core_type", e->d_name);
        read_one_line(path, type, sizeof type);
        if (!*type) {
            snprintf(path, sizeof path, "/sys/devices/system/cpu/%s/cpu_capacity", e->d_name);
            read_one_line(path, type, sizeof type);
        }
        if (!*type) continue;
        seen++;
        if (!*first) { snprintf(first, sizeof first, "%s", type); distinct = 1; }
        else if (strcmp(first, type) != 0) distinct = 2;
    }
    closedir(d);
    if (!seen) value("core_type_note", "hybrid status unknown; core type and capacity metadata unavailable; cpu0 cache data may differ on other cores");
    else value("core_type_note", distinct > 1 ? "multiple core types or capacities reported; cpu0 cache data may not represent other cores" : "one reported core type or capacity; cpu0 cache data may still differ on other cores");
}

static void disk_models(void) {
    DIR *d = opendir("/sys/block");
    struct dirent *e;
    if (!d) { value("disk_model", "unknown"); return; }
    int found = 0;
    while ((e = readdir(d))) {
        if (e->d_name[0] == '.') continue;
        char path[512], model[256], key[300];
        snprintf(path, sizeof path, "/sys/block/%s/device/model", e->d_name);
        if (access(path, F_OK) != 0) continue;
        read_one_line(path, model, sizeof model);
        snprintf(key, sizeof key, "disk_model_%s", e->d_name);
        value(key, model); found = 1;
    }
    closedir(d);
    if (!found) value("disk_model", "unknown");
}

int main(void) {
    char host[256] = "unknown", model[512] = "unknown", date[64] = "unknown";
    FILE *f;
    if (gethostname(host, sizeof host) != 0) snprintf(host, sizeof host, "unknown");
    host[sizeof host - 1] = '\0'; cpu_model(model, sizeof model);
    f = popen("date -u +%Y-%m-%dT%H:%M:%SZ", "r");
    if (f) { if (fgets(date, sizeof date, f)) date[strcspn(date, "\r\n")] = '\0'; pclose(f); }
    printf("# experiment=00_inventory\n# host=%s\n# cpu_model=%s\n# date_utc=%s\n# compiler_flags=%s\n", host, *model ? model : "unknown", date, FLAGS);
    value("cpu_model", model);
    caches(); core_types();
    long p = sysconf(_SC_PAGESIZE); printf("page_size_bytes=%s", p > 0 ? "" : "unknown"); if (p > 0) printf("%ld", p); putchar('\n');
#ifdef _SC_LEVEL1_DCACHE_LINESIZE
    long line = sysconf(_SC_LEVEL1_DCACHE_LINESIZE);
    if (line > 0) printf("sysconf_l1d_line_size_bytes=%ld\n", line); else value("sysconf_l1d_line_size_bytes", "unknown");
#else
    value("sysconf_l1d_line_size_bytes", "unknown");
#endif
    long cpus = sysconf(_SC_NPROCESSORS_ONLN);
    if (cpus > 0) printf("online_cpus=%ld\n", cpus); else value("online_cpus", "unknown");
    long pages = sysconf(_SC_PHYS_PAGES);
    if (pages > 0 && p > 0 && (uint64_t)pages <= UINT64_MAX / (uint64_t)p)
        printf("physical_ram_bytes=%" PRIu64 "\n", (uint64_t)pages * (uint64_t)p);
    else value("physical_ram_bytes", "unknown");
    value("physical_ram_note", "physical_ram_bytes is the RAM this OS can see; inside a VM it may be less than the host has");
    {
        char osrelease[256], lower[256];
        size_t i;
        read_one_line("/proc/sys/kernel/osrelease", osrelease, sizeof osrelease);
        for (i = 0; osrelease[i]; i++) lower[i] = (char)tolower((unsigned char)osrelease[i]);
        lower[i] = '\0';
        value("virtualization", strstr(lower, "microsoft") ? "wsl2" : "none_detected");
    }
    FILE *mounts = setmntent("/proc/mounts", "r");
    int root_found = 0;
    struct mntent *mount;
    if (mounts) {
        while ((mount = getmntent(mounts))) if (strcmp(mount->mnt_dir, "/") == 0) {
            value("root_filesystem_type", mount->mnt_type); root_found = 1; break;
        }
        endmntent(mounts);
    }
    if (!root_found) {
        struct statfs fs;
        if (statfs("/", &fs) == 0) printf("root_filesystem_type=unknown (statfs magic 0x%lx)\n", (unsigned long)fs.f_type);
        else value("root_filesystem_type", "unknown");
    }
    disk_models();
    return 0;
}
