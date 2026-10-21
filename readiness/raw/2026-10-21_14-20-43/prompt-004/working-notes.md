# Working notes: storage-experiments improvements (ad hoc)

**This run is ad hoc.** It is NOT from `readiness/prompts/`; there is no durable prompt file. The user gave an
inline approved task list (tasks 1-11) for `weeks/week-10/storage-experiments`. Prompt number 004 is a
convenience label (next after 003), not a prompt file.

- Start: 2026-10-21 14:20:43 (local, WSL2)
- Repo root: /home/jevert/git/computer_architecture, branch main, upstream origin/main (ahead 6 at start)
- Initial status: untracked only: weeks/week-10/code-ladder/ (not mine, untouched),
  weeks/week-10/storage-experiments/cost_ladder.csv, cost_ladder.py (task 9 moves these to tools/)
- Initial HEAD: 908eaed
- AGENTS.md says "read ../AGENTS.md": that file does not exist (checked /home/jevert/git/AGENTS.md). Noted, proceeding.
- The user's message references "your improvement report"; no such report exists in this session's context. The
  approved task list is the plan of record; the report written at the end is the post-hoc improvement report.
- Standing constraints from user: one commit per numbered task; -Werror, no warnings; do not change what any
  experiment measures; never touch receipts/april; DO NOT PUSH (overrides AGENTS.md push step: intentional exception);
  show diff summary after each task.
- No clang-format on this machine; not installing anything system-wide. Task 2 done by hand, verified by
  preprocessed-token and assembly comparison.

## Log
- 14:3x Task 1 done: READMEs, Makefile SCRATCH_DIR (verified make -n and a real 06 run on ext4 ~/disk-scratch, filesystem line seen), commit abaadf1
- Task 2 done: tokens/asm/check/header identical (raw task2/), commit 7bb6724
- Task 3 done: equivalence harness 2M random cases 0 mismatches; -Werror build ok; medians in sample run equal middle rows; commit 61a1068
- Task 4 done: sample outputs in task4/, -Werror builds ok, commit 79358eb
- Task 5 done: calibrated n=268435456 here, register region ~147 ms; commit b5720be
- Task 6 done: all 9 build -Werror clean; headers show -Werror flag (task6/headers.txt); 00-03 Makefiles CFLAGS = changed to ?= for consistency; commit f89986f
- Task 7 done: tested missing scratch (exit1, one msg), build failure in temp copy (exit1), tag+PIN_CPU, no-taskset note (task7/); commit 65de95f
- Task 8 done: make test passes; negative test (dropped a field in a temp copy) fails with exit 2 (task8/); commit 699ea3b
- Task 9 done: moved cost_ladder.py (+ the user's untracked cost_ladder.csv, now git-ignored in tools/). Mistake: I ran the script from the parent dir once, creating stray cost_ladder.csv/png there; removed (my own artifacts). The tools/cost_ladder.csv is now from my re-run with --cpu-price 120 (overwrote the user's earlier CSV content). commit 5caeb61
- Restored tools/cost_ladder.csv by regenerating with --cpu-price 80 (matches the original 5904.1441 $/GB cache row exactly); CSV is git-ignored
- Task 10 done (april untouched); commit d4d69c4
- Task 11: old morgan files git-mv'd to receipts/morgan/pre-2026-10-21/; launching 3 runs sequentially via task11/run_all.sh (log task11/timing.log)
- Task 11 done: 3 sequential runs, all exit 0, empty stderr. Elapsed: home 830 s, mnt_c 1222 s, mnt_d 1671 s
  (total ~62 min, 14:28:48 to 15:30:51). 81 new files in receipts/morgan; old 4 files git-mv'd to pre-2026-10-21/.
  Commit 2b63771.
- Final checks: `make test` passes; receipts/april unchanged since 908eaed (0 diff lines);
  `git diff --check` flags trailing whitespace only inside raw 00_inventory receipts (program output, kept verbatim).
- Not pushed, per user instruction (overrides AGENTS.md push step). Branch is ahead of origin/main by 6 + 11 task commits.
- Untracked and not mine, left alone: weeks/week-10/code-ladder/, weeks/week-10/memory_and_storage_disucssion.md.
- Incident: a peer session asked "is Flo on the line"; not Flo, no action taken.
