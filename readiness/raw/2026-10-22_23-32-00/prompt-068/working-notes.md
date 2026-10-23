# Working notes — CONNIE-068 Architecture Obsidian demo

## Authorization and objective

Owner-authorized work received 2026-10-22: create a portable five-minute Obsidian demonstration for Computer Architecture using actual executable experiment results; no DSCT, Character Garden/Wilbur, Canvas, unrelated course edits, or main merge. Commit and push a reviewed feature branch; preserve other branches/worktrees. The demonstration must label actual evidence honestly and leave unavailable measurements unmeasured.

## Initial repository state

- Repository: `jeremy-evert/computer_architecture`, remote `origin` (`git@github.com:jeremy-evert/computer_architecture.git`).
- Isolated worktree at `/tmp/connie-068-architecture`; initial branch `luna/connie-068-obsidian-arch` started at cached `origin/main` `3317bdeb683f2abbda1fdb35fb9018f94b759219`.
- Existing checkout `/mnt/nora/git/computer_architecture` was clean on `ivy/concept-hub-pointer-link`; it and all existing worktrees were left untouched. Its local `main` is 28 commits behind its cached `origin/main`.
- Connie `main` was clean at `bf745a751b816966e52883ff6f1dd40faff98030`.

## Existing task reconciliation

Connie already has CONNIE-068, so this mission is a scope/authorization update to that task, not a duplicate. Earlier decision prohibited a predetermined vault until Jeremy and Wilbur chose content. The current Owner request explicitly authorizes this Architecture experiment vault and states the teaching question/content; that is the new scope. CONNIE-071 and its creative stop remain unchanged. Older CONNIE-067 evidence remains preserved.

## Course inspection and chosen experiment

Read `AGENTS.md`, Week 10 README, Monday/Wednesday/Friday material, instructor note, planning index, `lab/README.md`, `lab/MEASUREMENT.md`, `lab/archlab/experiments.py`, `lab/archlab/experiments/memory.c`, and the CLI.

Week 10 requires working-set-size sweeps, dependent pointer-chase latency versus streaming bandwidth, shape-based conclusions, and explicit limits on exact cache-boundary claims. The existing validated `./lab/bin/archlab run memory` is the direct course fit. The student/instructor canonical command already exists; no new benchmark is planned.

## Host observation before measurement

- `hostname`: `maise`.
- OS: Linux `7.0.0-38-generic`, x86_64.
- CPU: AMD Ryzen 9 3950X 16-Core Processor, 16 cores / 32 threads; visible L1d 512 KiB across 16 instances, L2 8 MiB across 16, L3 64 MiB across four instances.
- GCC: 15.2.0.
- `./lab/bin/archlab doctor`: **FAIL** overall because Python `matplotlib` and RISC-V cross compiler are absent. Native GCC and OpenMP checks passed. This is broader than the memory experiment's dependency set; the memory-specific command will be tested directly. No package or service changes are authorized or planned.

## Work plan

1. Capture machine probe and six independent executions of the existing Week 10 memory experiment on Maise, preserving CSV/receipts and machine scope in the course repository; capture stdout on the last three runs.
2. Create a small linked-note Markdown vault, runbook and student explanation. Keep evidence separate from raw/private conversations (none used).
3. Add a standard-library validation command for all internal vault links and required note coverage; validate experiment CSV/receipts.
4. Test commands, links, receipts, code hygiene and diff; review final diff.
5. Commit/push only this feature branch; no merge. Record exact SHA and remote branch readback in report and Connie.

## Chronology and evidence

At initial intake this file was created before the first benchmark run. Commands, results and corrections are recorded chronologically below.

### 2026-10-22 23:30–23:33 CT — actual Maise runs

- `./lab/bin/archlab probe snapshot --out-dir demos/obsidian-week10-memory/evidence/2026-10-22/maise-machine` exited 0. It recorded host-visible Ubuntu 26.04.1, Linux 7.0.0-38, x86_64, Ryzen 9 3950X, 32 logical processors, 60.5 GiB visible memory, four cache records, no accelerator detected. Machine JSON deliberately omits usernames, home paths, serials, MAC addresses, public IP and device IDs.
- `./lab/bin/archlab run memory --out-dir .../maise-run-01` through `maise-run-06` all exited 0 and wrote PASS receipts with 12 CSV rows apiece. Six actual independent invocations, timestamps 2026-10-23 04:30:49–04:31:51 UTC. Runs 04–06 also preserve captured command output logs. Runs 01–03 preserve the CSV and JSON receipt; their CLI output was returned directly by the execution tool.
- First attempt to capture run 04's console output redirected into a directory before creating it and exited 1 (`No such file or directory`); no run output was written. Created the directory and reran successfully. This failed shell-redirection attempt is not counted as an experiment run.
- Derived six-run medians/ranges are recorded in `demos/obsidian-week10-memory/05 Observed Results.md`; a separate Python stdlib calculation read all six raw CSVs. Pointer-chase medians: 1.243232, 1.221135, 3.159565, 9.705651, 11.621718, 56.403880 ns/access as size grows 4 KiB→32 MiB. Stream medians: 63.015385, 65.948176, 65.502538, 64.637400, 60.402643, 36.661975 decimal GB/s. Small-stream ranges show noticeable variability and are reported honestly.
- Course-wide `archlab doctor` had already exited 1 due absent matplotlib and RISC-V cross compiler. The directly required memory command succeeds without those tools. No package/service/system changes made.
- After capturing the six runs, the exact no-option command `./lab/bin/archlab run memory` also exited 0 with 12 rows and PASS; its ignored default output is `lab/runs/20261023T043343Z_memory` and is excluded from the six-run summary.

### Implementation and validation

- Created nine connected Markdown notes/runbook, six-run evidence links, a short student explanation, a standard-library local-link validator, and `unittest` checks for local links, escape prevention, six PASS receipts/CSV row counts, and host-visible machine identity.
- Initial four validator tests passed before the host/summary checks were added; the final complete suite is recorded below.
- Added a stdlib summarizer; `python3 -B demos/obsidian-week10-memory/scripts/summarize_runs.py` exited 0 and wrote `evidence/2026-10-22/summary.json`. A parallel first validation overlapped creation of this linked file and reported it missing; running validation after summary generation resolved the race (no code defect).
- Exact documented default command `./lab/bin/archlab run memory` was executed at 2026-10-22 23:33 CT, exit 0, 12 rows, PASS; its default local output is under ignored `lab/runs/20261023T043343Z_memory` and is not part of the six-run summary.
- Generated `memory-sensory` binaries in the six evidence directories were removed; raw CSVs and receipts are preserved.
- Remote synchronization check: `git fetch origin` succeeded and advanced `origin/main` from `3317bde` to `408b3b2`, a Week 10 Canvas source commit outside our files. The original feature branch contained no unique commit; its tip `3317bde` was already an ancestor of new `origin/main`. To avoid merging or rebasing, switched the uncommitted worktree to a fresh `luna/connie-068-obsidian-demo` branch at `408b3b2`, preserving all files, and deleted the now-redundant old branch with non-force `git branch -d` (tip recorded above). Existing `/mnt/nora/git/computer_architecture` branch/worktrees remain untouched.
- Final sequential verification after summary creation: `summarize_runs.py` PASS; link validator PASS (9 notes); `unittest discover` PASS (7 tests). The suite checks required notes, local link resolution, link escape prevention, saved six-run receipts/CSV row counts, actual host machine record, and summary reproducibility. `git diff --check` still pending after final artifact review/staging.
- Obsidian is not installed on Maise (`command -v`, Flatpak app list, and application/Downloads search found none). The Markdown/Wikilink vault and validator are portable; actual Obsidian UI/backlink/graph rendering is not claimed as tested. The runbook gives the folder-open and command-palette steps.

## Pending

Run final `git diff --check` after staging, commit and push only this feature branch, verify remote readback, and finish this report/log. Update existing Connie CONNIE-068 record (no duplicate); do not merge without appropriate review/approval.
