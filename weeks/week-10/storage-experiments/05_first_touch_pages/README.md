# 05: First touch of memory pages

## Question

RAM has a hidden cost: the operating system must hand a process usable pages. What work does it still need to do after a program asks for a large anonymous region?

## Prediction

Before running, predict how first-touch, second-touch, and MAP_POPULATE-first-touch will compare in time and page faults.

My prediction: ______

## Run

```sh
make
make run
```

By default the program maps 512 MiB. You can pass a different size in bytes or with a K, M, or G suffix, for example `./05_first_touch_pages 128M`. It checks `/proc/meminfo` and refuses to map a region larger than 40% of MemAvailable. The CSV has three trials and a median for each mode. `map_ns` reports the time spent creating the mapping; `ns_per_page` and touch fault counts describe the measured touch work. First-touch uses one pass over its fresh mapping to preserve first-touch behavior; second-touch and MAP_POPULATE repeat the populated pass until it has lasted at least 50 ms, and divide by total page touches. Separate map fault columns show faults that happen during `mmap`, including the work moved into mapping by MAP_POPULATE.

## What to look at

A new anonymous mapping can be reserved before physical pages are assigned. First-touch writes one byte per page and may make the OS provide backing pages, which can add minor page faults. Second-touch writes the same pages again. MAP_POPULATE asks the OS to populate pages during `mmap`; compare its `map_ns` and measured touch row with first-touch. The first-touch trial uses one pass on a fresh mapping so each page is observed before it has been touched by this process. Warm modes repeat the pass to reach a useful timer interval; the CSV reports total page touches, while fault deltas cover all measured passes.

## Expected shape

First-touch will usually take longer and report more minor faults than second-touch. With MAP_POPULATE, some of that work moves into `mmap`, so mapping time can rise while the later touch pass becomes more like a second touch. Major faults are often zero for anonymous memory when RAM is available.


On april (`../receipts/april/05_first_touch_pages_run*.txt`, 512 MiB, 4 KiB pages, transparent huge pages set to `madvise` so they were not in play): first touch cost about 855 to 870 ns per page with exactly 131,072 minor faults (one per page); second touch about 14.4 ns per page with zero faults, roughly 60 times cheaper; with MAP_POPULATE the touch pass also cost about 14.4 ns per page because the 131,072 faults were paid inside `mmap` (about 69 ms in the `map_ns` column).

## What would surprise us / falsify the idea

If first-touch reports no additional minor faults, inspect the kernel's transparent huge page setting and whether the mapping was populated before measurement. If MAP_POPULATE does not shift work into mapping time, the kernel may ignore or limit population for this region.

## Caveat

Transparent huge pages can back several base pages with one larger page. That can reduce the number of minor faults, and may change both first-touch time and fault counts. The program prints the current `/sys/kernel/mm/transparent_hugepage/enabled` setting, whose bracketed value is active. The result also depends on memory pressure and kernel policy.
