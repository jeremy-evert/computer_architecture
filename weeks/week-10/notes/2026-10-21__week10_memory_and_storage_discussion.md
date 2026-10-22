# Week 10 — Memory and Storage Discussion (Durable Artifact)

**Course:** Fall 2026 Computer Architecture (COMSC-3013-1438), SWOSU
**Week:** 10 — *Make the Memory Hierarchy Hurt*
**Date of session:** 2026-10-21
**Machine measured:** `morgan` (Intel i7-8700K, Windows host + WSL2 Ubuntu)
**Reference machine:** `april` (instructor receipts in `receipts/april/`)
**Repo folder:** `~/git/computer_architecture/weeks/week-10/storage-experiments`

---

## 0. Handoff instructions for april (read first)

This file is the record of a live exploration session on `morgan`. On `april`, please:

1. Save this file into the course repo at
   `weeks/week-10/notes/2026-10-21__week10_memory_and_storage_discussion.md` and commit it.
2. Build **one Canvas page** for Week 10 titled
   **"Week 10 — Memory & Storage: A Worked Example on a Real Machine"** using Sections 1–7.
   Student-facing tone: friendly, plain English, short paragraphs, tables kept.
   Do **not** copy Section 9 (instructor notes) or Section 10 (Claude Code task list) into Canvas.
3. Add a short **"Notes for later"** block at the bottom of this file (Section 11) with anything
   you change, skip, or find wrong while building the page. Keep receipts: date each note.
4. Respect the Week 10 overclaim rule everywhere: describe **regions and shapes**, never claim
   measured cliffs equal advertised cache sizes.
5. Prices in Section 3 are **dated snapshots (2026-10-21)**. Keep the date next to every price.

---

## 1. The central question

> Why do we need layers of memory, and what does crossing a layer feel like?

Short answer: faster storage is physically bigger per bit, closer to the core, and far more
expensive. Nobody can afford to build a whole computer out of the top layer, so we stack small
fast layers on top of big slow ones. **Locality** (programs reuse recent data and touch nearby
data) is what makes a small fast layer pay off.

$$\text{AMAT} = t_{\text{hit}} + (\text{miss rate}) \times (\text{miss penalty})$$

---

## 2. What morgan actually has ("who is reporting this number?")

| Layer | morgan | Reported by | Notes |
|---|---|---|---|
| L1d | 32 KiB per core, 8-way, 64 sets, 64 B lines | `lscpu -C`, sysfs | private to one core (CPUs `0-1` = one core's two hyperthreads) |
| L1i | 32 KiB per core, 8-way, 64 sets | same | private |
| L2 | 256 KiB per core, 4-way, 1024 sets | same | private |
| L3 | 12 MiB shared, 16-way, 12288 sets | same | shared by CPUs `0-11` |
| RAM | 32 GB physical (4 × 8 GB G.SKILL F4-3000C15-8GTZR, DDR4-3000) | PowerShell | WSL2 sees only ~16 GB (default = about half the host) |
| Swap | 4 GiB (WSL swap file) | `free -h` | 0 used |
| Linux `/` | 1 TB ext4 virtual disk (`ext4.vhdx`), 59 GB used | `df -h` | a *file* on a Windows drive, not a physical disk |
| C: | Samsung 960 EVO 250 GB NVMe (disk 2) | `Get-Partition` | |
| F: | Samsung 960 EVO 250 GB NVMe (disk 3) | | |
| D: | Seagate IronWolf 4 TB HDD (disk 0) | | separate volume, not mirrored |
| E: | Seagate IronWolf 4 TB HDD (disk 1) | | separate volume |

Cache geometry check (size = sets × ways × line):

$$64 \times 8 \times 64 = 32\text{ KiB} \qquad 1024 \times 4 \times 64 = 256\text{ KiB} \qquad 12288 \times 16 \times 64 = 12\text{ MiB}$$

**Tools that told confident untruths (great Critique examples):**
- `lsblk` reported `ROTA=1` (spinning) for every disk, including the one living on NVMe — the model is `Virtual Disk`.
- The IronWolfs report `BusType: RAID` because they sit behind the motherboard RAID/RST controller.
- `06_disk` printed `filesystem_type=0x1021997 (unknown)` — that is **9p**, WSL2's Windows-drive file share.
- `free`, `df`, and `00_inventory` report the **VM's** view, not the host hardware.

**Why L1 is split into L1d and L1i:** the core fetches instructions and loads/stores data in the
same cycle. Separate caches mean separate ports, no contention. Below L1 everything is unified
(modified Harvard design).

**Why L1/L2 are private but L3 is shared:** L1/L2 must be tiny and close to be fast; sharing would
add wire length and arbitration. L3 is already slower, so sharing costs little and buys flexible
capacity, fast core-to-core sharing, and coherence bookkeeping. Physically L3 is 6 slices of
2 MiB on a ring bus; logically it is one cache.

---

## 3. What the layers cost (dollars only, no performance) — prices as of 2026-10-21

| Layer | Capacity on morgan | Price used | $ per GB | Bytes per $1 |
|---|---|---|---|---|
| Registers (architectural, 12 threads) | 7,680 B | $80 (whole CPU) | ~$10,400,000 | 96 |
| L1d | 192 KiB | $80 (whole CPU) | ~$407,000 | ~2,500 |
| L1i | 192 KiB | $80 (whole CPU) | ~$407,000 | ~2,500 |
| L2 | 1.5 MiB | $80 (whole CPU) | ~$51,000 | ~20,000 |
| L3 | 12 MiB | $80 (whole CPU) | ~$6,400 | ~157,000 |
| *All cache together* | *~13.9 MiB* | *$80* | *~$5,500* | *~182,000* |
| RAM 4 × 8 GB | 32 GiB | $250 (new 2×16 GB kit) | $7.28–$7.81 | ~137 million |
| SSD 2 × 960 EVO | 500 GB | ~$75 used (estimate) | ~$0.15 | ~6.7 billion |
| HDD 2 × IronWolf 4 TB | 8,000 GB | ~$200 used (estimate) | ~$0.025 | ~40 billion |

How the numbers were built:
- **CPU:** median of 38 used i7-8700K eBay *asking* prices ≈ **$80** (middle half $74–$98).
  Excluded non-K chips, new/open box, a "broken" listing, $20 bait ads, duplicates.
  Best real-sales signal: one seller showed 190 sold at $89.99. Students should re-check with **Sold Items**.
- **CPU rows are upper bounds:** you cannot buy cache alone, so each row charges the whole chip to that layer. Do not add them up.
- **RAM:** new replacement kits — 2×16 GB at $249.99 ($7.81/GB), 2×32 GB at $629.99 ($9.84/GB). Market tracker median for desktop DDR4 that day: $7.81/GB.
- **Drives:** used-price ranges were estimates, not checked listings. Market reference: 2 TB NVMe ≈ $140/TB; new 8 TB HDD ≈ $41–61/TB (HDD prices up sharply in 2026 due to AI data-center demand).

**One sentence for students:** on morgan, $1 buys 96 bytes of register space or 40 billion bytes of spinning disk.

---

## 4. Typical latency ladder (teaching values, NOT measurements)

At 3.7 GHz one cycle ≈ 0.27 ns.

| Layer | Approx. cycles | Approx. time | If 1 cycle = 1 second |
|---|---|---|---|
| Register | ~1 | ~0.3 ns | 1 s |
| L1 | ~4–5 | ~1.2 ns | 4 s |
| L2 | ~12 | ~3.3 ns | 12 s |
| L3 | ~40–70 | ~11–19 ns | ~1 min |
| RAM (DDR4-3000 CL15) | ~300 | ~60–90 ns | ~5 min |
| NVMe SSD | ~300,000 | ~50–100 µs | ~3.5 days |
| HDD (5,900 rpm IronWolf) | ~40,000,000 | ~10–15 ms | ~1.3 years |

Why each step costs more:
- **Inside the chip:** distance on the die, bigger arrays, TLB lookup, ring hops to the right L3 slice.
- **RAM:** leave the die; DRAM must open a row (tRCD ≈ 10 ns), read a column (CAS ≈ 10 ns), maybe close a row first (tRP ≈ 10 ns).
- **Storage:** no longer one instruction — a system call through the OS, filesystem, driver, device (and in WSL, Hyper-V and 9p).
- **HDD:** the only layer limited by *moving metal*. Half a rotation at 5,900 rpm ≈ 5.1 ms.

RAM bandwidth ceiling (dual channel DDR4-3000): 3000 MT/s × 8 B × 2 = **48 GB/s**.

---

## 5. What we measured on morgan

### 5.1 Working set (`03_working_set`, dependent pointer chase, median of 3)

| Region | Working set | ns per access | Interpretation |
|---|---|---|---|
| Flat | up to ~28 KB | ~1.66 | fits L1d |
| Jump | 33,920 B | 2.3 → 3.6 | just past 32 KiB |
| Plateau | ~40–229 KB | ~3.7–5.5 | L2 region |
| Jump | 272,832 B | ~7.7 | just past 256 KiB |
| Slow climb | ~0.3–3.6 MB | ~8–17 | L3 region |
| **Early steep rise** | ~4–12 MB | ~21 → 69 | L3 "cliff" starts **before** 12 MiB |
| Plateau | 14–58 MB | ~74–86 | RAM latency |

The L1 and L2 edges land on the advertised sizes. The L3 edge does not — that is the Critique lesson.

### 5.2 Cache line (`02_cache_line_stride`)
Cost per access climbs as stride grows, then flattens past **64 B** → 64-byte line.

### 5.3 Registers (`01_registers`)
Register loop 0.56 ns/iter; `volatile` 1.66 ns/iter (3×). The `volatile` number matches the
L1 hit time from 5.1 — two experiments, one number.

### 5.4 Sequential vs. random (`04_sequential_vs_random`, 256 MB buffer)

| Mode | ns/read | GB/s |
|---|---|---|
| sequential-independent | 0.31 | 26.2 |
| sequential-dependent | 1.57 | 5.1 |
| random-independent | 20.8 | 0.38 |
| random-dependent | 108 | 0.07 |

Same memory, ~350× slower per read when the prefetcher cannot predict the next address.
26 GB/s single-thread ≈ 55% of the 48 GB/s theoretical peak.

### 5.5 First touch (`05_first_touch_pages`, 512 MiB, 4 KiB pages)
First touch ≈ 1,680 ns/page (page fault: find, zero, map); second touch ≈ 9 ns/page.
`MAP_POPULATE` prefaults in a batch at ≈ 840 ns/page. Transparent huge pages = `madvise`
(so arrays use 4 KiB pages unless asked otherwise).

### 5.6 Disk (`06_disk`, 256 MiB file)

| Location | Buffered write | One fsync | fsync each 4 MiB | Cold read | 4 KiB fdatasync |
|---|---|---|---|---|---|
| `/tmp` (tmpfs = RAM!) | 3,492 MB/s | 3,560 | 3,588 | n/a | 0.002 ms |
| `~` (ext4 virtual disk on NVMe) | 4,679 MB/s | 1,061 | 465 | **2,685** | 2.7 ms |
| `/mnt/c` (NVMe via 9p) | 224 MB/s | 158 | 154 | 250 | 1.7 ms |
| `/mnt/d` (IronWolf via 9p) | 215 MB/s | **92** | **52** | 245 | **17.1 ms** |

- The default run wrote to `/tmp`, which is RAM — the program warned us.
- **9p caps C: and D: near 250 MB/s.** The same NVMe reads at 2.7 GB/s from `~`.
- Buffered writes hide the device; only `fsync` reveals the HDD (17 ms/sync ≈ seek + rotation).
- On 9p, cold ≈ warm (ratio ≈ 1.0), so the cold-read column is not meaningful there.

### 5.7 Network (`07_network`, loopback)
Function call 1.4 ns; pipe round trip 67 µs; loopback TCP 80 µs.
Talking to another process costs about as much as an NVMe read. (67 µs is slow for pipes;
WSL/Hyper-V scheduling is a plausible but unproven cause.)

### 5.8 Repository (`08_repository`)
`make check`: MATCH with `git hash-object`; `abc` and empty vectors PASS.
Per batch: one plain file ≈ 2.0 ms; loose-object style ≈ 28.8 ms (~14×).
**Sync made no difference — because it ran in `/tmp` (RAM).** April's receipts show ~1.4 s/batch with per-object sync.
Walkthrough: 2 commits → 6 objects (2 blobs, 2 trees, 2 commits).

---

## 6. From Python down to the cache (the code ladder)

| Level | What it is | Which L1 it uses |
|---|---|---|
| Python source | text | — |
| Python bytecode (`LOAD_NAME`, `BINARY_OP`…) | instructions for a *virtual* machine | read as **data** → L1d |
| CPython interpreter | C program's machine code | L1i |
| C source | text | — |
| Assembly (`add rcx, QWORD PTR [rax]`) | readable machine instructions | — |
| Machine code (`48 03 08`) | the bytes the CPU decodes | L1i |
| Arrays and variables | program data | L1d |

Measured with cachegrind (same sum of 1,000,000 numbers):

| Version | Instructions (I refs) | Data refs (D refs) |
|---|---|---|
| Python | 1,198,569,257 | 472,395,635 |
| C `-O1` | 9,126,403 | 2,042,259 |
| C `-O3 -march=native` (AVX2 `vpaddq ymm`, 4 longs per instruction) | 2,001,525 | 542,285 |

- Python → vectorized C: ~600× fewer instructions.
- The C `-O1` hot loop is 14 bytes (`0x11a0`–`0x11ad`) — fits in one 64 B L1i line.
- C D1 misses 251,702 ≈ 8,000,000 B ÷ 64 B × 2 passes = 250,000. The cache line, again.
- Cachegrind *simulates* a cache; treat as shape and ratios, not silicon truth.

---

## 7. Open questions and Critique (Lens 10) moments

1. **Why does the L3 cliff start near 4 MB instead of 12 MiB?** Hypotheses (unproven):
   TLB reach (~1,536 STLB entries × 4 KiB ≈ 6 MiB), shared/inclusive L3 with other CPUs, Windows,
   and the hypervisor, hashed slice placement.
2. **Why is random-dependent 108 ns in `04` but RAM plateau ~86 ns in `03`?** Likely page walks at 256 MB (unproven).
3. **Which layer did you actually measure?** tmpfs vs ext4 vhdx vs 9p — same SSD, wildly different numbers.
4. **Which price is "the price"?** $20, $35, $80, $154, $300 for the same CPU on one page.
5. **Who reported this number?** VM vs host for RAM, disk, rotational flag, bus type.

---

## 8. Commands we used (copy-ready)

```bash
# Inventory
lscpu -C
for d in /sys/devices/system/cpu/cpu0/cache/index*; do
  printf "L%s %-12s size=%-6s line=%sB ways=%s sets=%s shared=%s\n" \
    "$(cat $d/level)" "$(cat $d/type)" "$(cat $d/size)" "$(cat $d/coherency_line_size)" \
    "$(cat $d/ways_of_associativity)" "$(cat $d/number_of_sets)" "$(cat $d/shared_cpu_list)"
done
free -h --si; lsblk -o NAME,SIZE,TYPE,FSTYPE,MOUNTPOINT,ROTA,MODEL; df -hT -x tmpfs -x devtmpfs

# Tools
sudo apt install -y build-essential valgrind python3-matplotlib

# Experiments
cd ~/git/computer_architecture/weeks/week-10/storage-experiments
for d in 00_inventory 01_registers 02_cache_line_stride 03_working_set 04_sequential_vs_random 05_first_touch_pages 07_network; do make -C $d run; done

# Disk on three real locations
cd 06_disk
mkdir -p ~/disk-scratch /mnt/c/Users/evertj/disk-scratch /mnt/d/disk-scratch ../receipts/morgan
./06_disk ~/disk-scratch 268435456                   | tee ../receipts/morgan/06_disk_linux_home.txt
./06_disk /mnt/c/Users/evertj/disk-scratch 268435456 | tee ../receipts/morgan/06_disk_mnt_c.txt
./06_disk /mnt/d/disk-scratch 268435456              | tee ../receipts/morgan/06_disk_mnt_d.txt
```

```powershell
# Host truth (Windows PowerShell). Note: no square brackets, so rich-text paste cannot break it.
Get-CimInstance Win32_PhysicalMemory | Select-Object Manufacturer, PartNumber, @{n='GB';e={$_.Capacity/1GB}}, Speed
Get-PhysicalDisk | Select-Object DeviceId, FriendlyName, MediaType, @{n='GB';e={'{0:N0}' -f ($_.Size/1GB)}}
Get-Partition | Where-Object DriveLetter | Select-Object DriveLetter, DiskNumber, @{n='GB';e={'{0:N0}' -f ($_.Size/1GB)}}
```

Artifacts created during the session: `cost_ladder.py` (speed vs $/GB table + plot),
`plot_working_set_png.py` (latency curve with *advertised* cache lines dashed),
`weeks/week-10/code-ladder/sum_array.{c,py}`.

---

## 9. Instructor notes (not for Canvas)

- Lesson flow that worked: inventory → cost → latency theory → measure → find the lies.
- Two independent experiments agreeing (L1 1.66 ns in `01` and `03`; 64 B line in `02` and cachegrind) is the strongest evidence moment — highlight it.
- Corrections made during the session (keep honest):
  - PowerShell `[math]::Round` got stripped by rich-text paste twice; final commands use `'{0:N0}' -f` instead.
  - An earlier pasted RAM-upgrade suggestion had wrong slot math (2×32 + 2×8 = 80 GB, not 64).
  - An earlier pasted drive summary claimed 0 GB free; D: and E: are ~1% used.
- `run_receipts.sh` runs `06_disk` and `08_repository` in `/tmp` (RAM) — disk receipts from it are not disk evidence.
- Commit `receipts/morgan` before any Claude Code changes.

---

## 10. Pending Claude Code task list (for the storage-experiments folder)

1. `06_disk`: recognize `0x01021997` as 9p; print a WARNING; README note about WSL2 (`~` = ext4 vhdx, `/mnt/x` = 9p).
2. `08_repository`: optional scratch-dir argument (same pattern as `06_disk`); tmpfs WARNING; `# filesystem_type=` header.
3. `08_repository`: append `ms_per_batch` column at the end (do not reorder columns).
4. `00_inventory`: `virtualization=wsl2|none_detected`; note that `physical_ram_bytes` is the OS's view.
5. `run_receipts.sh`: optional `SCRATCH_DIR` passed only to `06_disk` and `08_repository`.
6. One commit per task; build with no warnings; never touch `receipts/`; do not push.

Prompt file on morgan: `~/claude-prompts/2026-10-21_week10_storage_experiments.md`

---

## 11. Notes for later (april: append dated notes here)

- 2026-10-21 — Artifact created on morgan session. Next: commit morgan receipts, run Claude Code tasks, re-run `08_repository` on `~` and `/mnt/d`, generate `03_working_set.png` for the dossier.

