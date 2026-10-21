# Registers to Repositories: storage experiments in C

Week 10 walk-through. Each folder is one small C program that answers one question about a tier of storage: what it is for, and how we can SEE its cost on a real machine. Do them in order. Nothing here needs a library; you need `gcc`, `make`, and `python3` (for one text plot).

## How to use a folder
1. Read its `README.md` (Question, then Prediction). **Write your prediction down before you run anything.**
2. `cd` into the folder, then `make` and `make run`.
3. Compare the shape of what you got with the "Expected shape" and "What would surprise us" sections.
4. `make clean` when done.

`make` and `make run` in this folder do the same for every experiment (06 and 08 write temporary files and delete them; by default they use a fresh directory under `/tmp`, which may be RAM; 04 takes several minutes). To point 06 and 08 (only) at a real disk, run `make run SCRATCH_DIR=$HOME/disk-scratch` (create the directory first).

## The set
| # | Folder | Question | Tier |
|---|--------|----------|------|
| 00 | `00_inventory` | What does this machine actually have? | read this first |
| 01 | `01_registers` | What does it cost to keep a value in memory instead of a register? | registers |
| 02 | `02_cache_line_stride` | What is a cache line, and can we see its size? | L1 to RAM |
| 03 | `03_working_set` | Where do the cache sizes show up as time? | L1, L2, L3, RAM |
| 04 | `04_sequential_vs_random` | Latency versus bandwidth: what does the prefetcher do for us? | caches and RAM |
| 05 | `05_first_touch_pages` | What does the OS charge to hand us memory? | RAM and the OS |
| 06 | `06_disk` | How much faster is "written" than "safely written"? | disk |
| 07 | `07_network` | What does talking to another process, or another machine, add? | network (loopback only) |
| 08 | `08_repository` | What does remembering every version cost? | repository |

03 builds on the instructor lab `lab/experiments/memory.c`: it keeps the same dependent pointer chase but uses finer steps, a column that marks which cache level a size fits in, and a text plot.

## WSL2 notes
These programs are Linux only. They work under WSL2, but where the scratch files live decides what 06 and 08 measure:
- `~` (your Linux home) is ext4 on a virtual disk file that Windows stores on a physical drive. This is the closest thing to a real disk inside WSL2.
- `/mnt/<letter>` (for example `/mnt/c`, `/mnt/d`) is a Windows drive shared over 9p. Speed is often limited by the file-sharing layer, and `posix_fadvise` may not make reads cold.
- `/tmp` may be tmpfs, which is RAM, not disk. It stays the default on purpose, so you meet the `# WARNING: tmpfs is RAM, not disk` line and learn to read the `# filesystem_type=` header. Give a scratch directory (`SCRATCH_DIR`) to measure a disk.
- `00_inventory` prints `virtualization=wsl2` and a note that `physical_ram_bytes` is the RAM this OS can see, which can be less than the host has.

Two limits on the disk tests:
- Root users can drop the page cache between runs: `echo 3 | sudo tee /proc/sys/vm/drop_caches`. Without root, 06 can only ask politely with `posix_fadvise`.
- `fsync` on a WSL2 virtual disk or a 9p share depends on what Windows does with the request, so a returned `fsync` is not proof the bytes are durable on the physical device.

## Receipts: where the numbers in the READMEs come from
`receipts/april/` holds three full runs of every program, made on **april** (Intel Core Ultra 7 265, 30 MiB L3, ext4 on NVMe, Linux). Every file starts with host, CPU, and date lines. Regenerate with `make receipts` (about 10 minutes). Notes:
- The CPU has two kinds of cores. Runs were pinned to CPU 0 (a performance core, 48 KiB L1d, 3 MiB L2) so that the cache sizes `00_inventory` prints describe the core that ran the test. The network test was not pinned.
- Numbers belong to that machine on that day. Compare shapes and ratios, not exact values; your own machine will differ, and that is the lesson.
- `receipts/REVIEW.md` is an independent code review of the programs (undefined behavior, loops optimized away, timer misuse).

## Honest limits
- 06: Linux may keep disk pages cached even after we ask it not to; without root we cannot prove the "cold" read really came from the SSD.
- 07: loopback is not a network. There is no wire and no switch.
- 08: the "loose-object-style" store skips the zlib compression real git does.
- Not built: a `09_summary` table across tiers (optional; see the receipts for the raw numbers).
