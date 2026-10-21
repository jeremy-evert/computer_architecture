# Registers to Repositories: storage experiments in C

Week 10 walk-through. Each folder is one small C program that answers one question about a tier of storage: what it is for, and how we can SEE its cost on a real machine. Do them in order. Nothing here needs a library; you need `gcc`, `make`, and `python3` (for one text plot).

## How to use a folder
1. Read its `README.md` (Question, then Prediction). **Write your prediction down before you run anything.**
2. `cd` into the folder, then `make` and `make run`.
3. Compare the shape of what you got with the "Expected shape" and "What would surprise us" sections.
4. `make clean` when done.

`make` and `make run` in this folder do the same for every experiment (06 and 08 write temporary files under `/tmp` and delete them; 04 takes several minutes).

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
