# Storage experiments C review

Scope: experiments 00 through 08, including every C file, per-experiment
Makefile, README, `03_working_set/plot.py`, `08_repository/walkthrough.sh`, and
the top-level Makefile. Source was reviewed read-only; only this receipt was
written.

Validation performed:

- Every C file passed `gcc -std=c11 -O2 -Wall -Wextra -fsyntax-only` with zero
  warnings.
- Every C file built with
  `gcc -std=c11 -O1 -g -Wall -Wextra -fsanitize=address,undefined
  -fno-omit-frame-pointer`.
- Tiny sanitizer runs passed for 00, 05 (`1M`), 06 (`65536` bytes), and 08
  (`--vectors`). The 06 run reproduced the caller-directory removal finding
  below. Long default runs of 04 and 06 were not repeated.
- `gcc -std=c11 -S -O2 -Wall -Wextra` output was inspected for the measured
  loops. The register/volatile distinction in 01 is present with the exact
  labels described by its README on this GCC; the load loops in 02 through 05,
  07, and 08 remain between the timer calls. No measured loop was found deleted
  or hoisted out of its timed region.
- `gcc -std=c11 -O0 -Wall -Wextra -fanalyzer -fsyntax-only` reported no
  diagnostics for any C file.

## Status of findings

"Spot-checked" means the fix was confirmed present in the code on 2026-10-21; "per Resolution" means the status comes from the Resolution note below and was not re-checked.

| Exp | Finding | Status |
|-----|---------|--------|
| 01 | RISK: ordinary-register timed region shorter than 50 ms | fixed in 6e31c6f; now calibrated in b5720be |
| 02 | BUG: README says 10 million accesses, code makes 100 million | fixed in 6e31c6f (README corrected; spot-checked) |
| 02 | BUG: README quotes values that appear in no receipt | fixed in 6e31c6f (per Resolution, not re-checked) |
| 02 | NIT: array-size rule in prose differs from code | fixed in 6e31c6f (README now states the two-size rule; spot-checked) |
| 03 | RISK: unchecked size arithmetic from sysfs | fixed in 6e31c6f (checked_mul_size/checked_add_size present; spot-checked) |
| 03 | NIT: plot.py divides by zero on a one-point range | fixed in 6e31c6f (guard present; spot-checked) |
| 04 | RISK: failed clock_gettime printed as a real time | fixed in 6e31c6f (clock failures exit; spot-checked) |
| 05 | RISK: warm touch passes far shorter than 50 ms | fixed in 6e31c6f (repeats passes to 50 ms; spot-checked) |
| 06 | BUG: caller-supplied directory removed | fixed in 6e31c6f (per Resolution, not re-checked) |
| 06 | BUG: unlink results ignored | fixed in 6e31c6f (per Resolution, not re-checked) |
| 06 | RISK: posix_fadvise result ignored, row labeled cold | fixed in 6e31c6f (advice_status column; spot-checked) |
| 06 | NIT: unchecked strtoull byte argument | fixed in 6e31c6f (parse_bytes; spot-checked) |
| 07 | RISK: server binds INADDR_ANY | fixed in 6e31c6f (127.0.0.1 default; spot-checked) |
| 07 | RISK: local-call timing region far below 50 ms | fixed in 6e31c6f (per Resolution, not re-checked) |
| 07 | BUG: negative port accepted | fixed in 6e31c6f (per Resolution, not re-checked) |
| 07 | RISK: SIGPIPE ignored too late | fixed in 6e31c6f (signal set at start of main; spot-checked) |
| 08 | RISK: three timed modes far below 50 ms | fixed in 6e31c6f (batches repeat to 50 ms; spot-checked) |
| 08 | BUG: cleanup discards rm status | fixed in 6e31c6f (direct removal with checked status; spot-checked) |
| 08 | RISK: close results ignored | fixed in 6e31c6f (close_checked; spot-checked) |
| -- | Independent re-review of the fixed code | open (the Resolution notes it has not been done) |

## 00_inventory

Clean. No undefined behavior, allocation issue, measured-loop issue, timer
misuse, unsupported README claim, or scratch-file leak was found. This is an
inventory program rather than a timed experiment. Its Makefile is also clean.

## 01_registers

- **RISK — `01_registers/01_registers.c:34-40`:** The ordinary-register timed
  region is shorter than the shared contract's roughly 50 ms target. The three
  April receipts put 150,000,000 iterations at about 0.203 ns each, or about
  30.5 ms, while the volatile region is long enough. Shorter regions are more
  sensitive to scheduling and clock overhead. Suggested fix: raise `n` enough
  that the faster mode exceeds 50 ms, or calibrate a shared iteration count
  before collecting the three trials.

The recurrence is unsigned, its result is consumed by a volatile sink, and the
current optimized assembly matches the README's load/store explanation. The
README's quoted April values are supported by all three checked receipts. The
Makefile is clean.

## 02_cache_line_stride

- **BUG — `02_cache_line_stride/README.md:18` and
  `02_cache_line_stride/02_cache_line_stride.c:35`:** The README says each
  stride makes 10 million accesses, but the program makes 100 million.
  Suggested fix: change the README to 100 million, or change the constant and
  then re-check that each timed region remains long enough.
- **BUG — `02_cache_line_stride/README.md:22`:** The exact 1.111010 ns and
  2.021371 ns values do not occur in the checked project receipts. The three
  April receipts instead show 32-byte medians of 1.320006--1.337758 ns and
  64-byte medians of 2.161806--2.176578 ns. The shared contract permits exact
  numbers only when tied to an actual receipt. Suggested fix: cite one existing
  receipt and use its values, or describe only the observed shape.
- **NIT — `02_cache_line_stride/README.md:18` and
  `02_cache_line_stride/02_cache_line_stride.c:29`:** The prose says the array
  is raised to four times the largest cache when needed, capped at 512 MiB. The
  implementation switches directly from 256 MiB to 512 MiB when the cache is
  larger than 128 MiB; it does not compute four times the cache and cap that
  result. Suggested fix: implement
  `min(max(256 MiB, 4 * largest), 512 MiB)` with overflow checks, or describe
  the actual two-size rule.

The access loop remains in optimized assembly, all indices are in range for the
fixed power-of-two allocation sizes, and the Makefile is clean.

## 03_working_set

- **RISK — `03_working_set/03_working_set.c:19,29-32,36,60`:** Size arithmetic
  derived from sysfs is not checked throughout. `last * 4`, cache-unit
  multiplication, capacity doubling, allocation-size multiplication, and
  round-up arithmetic can wrap; if `x` grows beyond the range of `size_t`, the
  conversion from `double` back to `size_t` at line 30 has undefined behavior.
  Real cache sizes are far below these limits, but the shared contract
  explicitly requires overflow-safe size handling. Suggested fix: use checked
  integer multiply/add helpers, stop before `SIZE_MAX`, and replace the
  floating-point growth calculation with checked integer/rational arithmetic.
- **NIT — `03_working_set/plot.py:33,42`:** A valid input containing exactly
  one median row makes `log_max == log_min`; if a cache marker equals that size,
  line 42 divides by zero. Normal program output has many rows, so this does not
  affect the documented path. Suggested fix: special-case a one-point x range
  when placing markers.

The dependent address chain remains in optimized assembly, each measured
region runs until at least 50 ms, allocations and page touches occur before
timing, and the README's approximate April observations are supported by the
receipts. The Makefile is clean.

## 04_sequential_vs_random

- **RISK — `04_sequential_vs_random/04_sequential_vs_random.c:126-132,140-147,154-159,215-232`:** A failed ending `clock_gettime` makes a helper return
  `-1.0`, but callers do not check it and `report_mode` prints it as a real
  elapsed time, including nonsensical negative latency/bandwidth. The same is
  true of a failed warm-up timer. Suggested fix: make each measurement helper
  return status plus an output value, or exit on clock failure as the other
  experiments do; validate every warm-up and trial before reporting.

No long benchmark was rerun. Existing receipt timings show the shortest mode
at about 57 ms, meeting the target. Allocation, initialization, shuffling, and
page faults are outside the timed regions, and optimized assembly retains all
four measured loops. The README and Makefile are otherwise clean.

## 05_first_touch_pages

- **RISK — `05_first_touch_pages/05_first_touch_pages.c:153-169`:** The timed
  touch pass is performed only once. First touch may be long enough at the
  default size, but second touch and the post-`MAP_POPULATE` touch are normally
  far below the roughly 50 ms target. A 1 MiB optimized check completed the
  median second-touch and populated-touch passes in under 1 microsecond total;
  scaling to 512 MiB still leaves substantial risk of a short timing region.
  Suggested fix: aggregate repeated already-populated passes for the warm modes
  until at least 50 ms and divide by total page touches. For first-touch
  semantics, aggregate several fresh mappings or clearly document why a single
  pass is necessary.

The program deliberately keeps mapping time separate from touch time, records
fault deltas around the touch, uses volatile page accesses, and cleans every
mapping on checked error paths. The README and Makefile are otherwise clean.

## 06_disk

- **BUG — `06_disk/06_disk.c:39-40,54`:** A caller-supplied scratch directory
  is treated as owned and removed when empty. Line 40 always sets
  `cleanup_own_dir = 1`, and line 54 calls `rmdir(dir)` even when `argc > 1`
  because the call is the left operand of `&&`. The tiny sanitizer run confirmed
  that the supplied directory disappeared. On an error path, `atexit` can also
  remove a supplied empty directory. Suggested fix: set the ownership flag only
  when this process successfully calls `mkdtemp`, and call `rmdir` only when
  that flag is true. Update the README to promise that user-provided directories
  are never removed.
- **BUG — `06_disk/06_disk.c:50-54`:** `unlink` results are ignored. The final
  unlink is followed by `cleanup_file[0] = 0`, so a failed unlink disables the
  `atexit` retry and can silently leave the scratch file behind. Suggested fix:
  check every unlink, clear the registered cleanup path only after confirmed
  removal (or `ENOENT`), and report cleanup failure.
- **RISK — `06_disk/06_disk.c:32-35`:** The return from `posix_fadvise(...,
  POSIX_FADV_DONTNEED)` is ignored, but the following measurement is always
  labeled `cold`. The README acknowledges that the advice is only a request,
  yet an outright rejected call is not distinguished from accepted advice.
  Suggested fix: check the returned error number and label the row as a cold
  attempt or unavailable when the advice fails.
- **NIT — `06_disk/06_disk.c:39`:** The byte argument uses unchecked
  `strtoull` followed by a cast to `size_t`, so trailing junk, a negative string,
  or an out-of-range value can be accepted or truncated. Suggested fix: reset
  and inspect `errno`, require complete token consumption, reject a leading
  minus, and check against `SIZE_MAX`.

The read/write loops remain observable through the volatile sink, normal error
exits retain an `atexit` cleanup attempt, and no default/long benchmark was
rerun. The Makefile is clean.

## 07_network

- **RISK — `07_network/07_network.c:33`:** Server mode binds to
  `INADDR_ANY`, exposing the benchmark on every IPv4 interface whenever the
  user follows the README's server command. This is broader than the local
  experiment needs and conflicts with the repository safety rule against
  binding services to all interfaces without explicit scope. Suggested fix:
  bind loopback by default and require a separate explicit bind-address option
  for an instructor-controlled remote demonstration.
- **RISK — `07_network/07_network.c:17,25`:** The in-process timer covers only
  100,000 calls. April receipts report 0.7--1.4 ns per call, making the whole
  region roughly 0.07--0.14 ms, hundreds of times shorter than the roughly
  50 ms target. Suggested fix: calibrate or substantially raise the local-call
  iteration count independently of the much slower pipe/TCP count.
- **BUG — `07_network/07_network.c:32-34`:** Client validation rejects zero and
  ports above 65535 but accepts negative ports because `!port` is false and
  `port > 65535` is false. Suggested fix: parse with checked `strtol` and require
  `1 <= port && port <= 65535` for both client and server modes.
- **RISK — `07_network/07_network.c:33-34`:** `SIGPIPE` is ignored only after
  the `--serve` branch returns, so a standalone server can be terminated by a
  client disconnect during `write`. Suggested fix: install the signal handling
  before branching into server mode, or use a no-SIGPIPE send mechanism.

The volatile function pointer keeps the local call in optimized assembly; the
pipe and TCP exchanges are inherently dependent. The README and Makefile are
otherwise consistent with the code.

## 08_repository

- **RISK — `08_repository/08_repository.c:31,36`:** Three of the four timed
  modes are much shorter than the roughly 50 ms target. The April receipt
  medians are about 0.47 ms for one plain file without sync, 1.6--1.7 ms for a
  plain file with one sync, and 13.8--14.1 ms for loose-style files without
  sync. Suggested fix: calibrate the record count or repeat whole store/reset
  batches until each reported region reaches at least 50 ms, while keeping
  setup outside the measured region.
- **BUG — `08_repository/08_repository.c:17,36`:** `cleanup_scratch` discards
  the `rm` status, and the normal path clears `scratch_root` immediately after
  calling it. A failed removal is silent and cannot be retried by `atexit`,
  leaking the scratch tree. Suggested fix: return and check cleanup status,
  verify removal before clearing the registered path, and preferably remove the
  known files/directories directly rather than through `system("rm -rf ...")`.
- **RISK — `08_repository/08_repository.c:31`:** All `close` results are
  ignored. A delayed storage error can therefore be reported as a successful
  trial, especially in the no-sync cases. Suggested fix: check each `close`,
  fail the trial on error, and decide explicitly whether close latency belongs
  inside the timed storage operation.

The SHA-1 operations use unsigned arithmetic, the standard vectors pass under
ASan/UBSan, and optimized assembly retains hashing/storage work. The Makefile's
temporary hash-check file has a cleanup trap, and `walkthrough.sh` has an
effective cleanup trap; both are clean.

## Top-level Makefile

Clean. The driver scopes build/run/clean to numbered experiment directories and
does not itself create or leak scratch files.

## Resolution (Anna, after the fix pass)

Findings above were fixed by a second Codex pass and all receipts under `april/` were regenerated from the fixed code (so earlier quoted values were replaced). Fixed: 07 binds 127.0.0.1 by default (`--bind` required otherwise), port parsing, SIGPIPE, local-call timing region; 06 never removes a caller-supplied directory, unlink/fadvise return values checked, column renamed `post_fadvise_*`; 01, 05, 08 timed regions now at least 50 ms; 04 clock failures exit; 03 size arithmetic checked and plot single-point guard; 02 README corrected to match code and receipts. Not re-reviewed by Sol after the fixes. Known limits remain as stated in the READMEs (cold read unprovable without root, loopback is not a network, no zlib in 08).
