# Report 004: storage-experiments improvements (ad hoc)

Source: inline user request, **not** a file in `readiness/prompts/`. No improvement report from an earlier session
was available; the approved task list was the plan of record.
Raw evidence and working notes: [`readiness/raw/2026-10-21_14-20-43/prompt-004/`](../../raw/2026-10-21_14-20-43/prompt-004/working-notes.md)

## Pre-work state
Branch main at 908eaed, ahead of origin/main by 6. Untracked: `code-ladder/`, `cost_ladder.py`, `cost_ladder.csv`.

## Changes (one commit per task; run from `weeks/week-10/storage-experiments`)
| Task | Commit | Verification (observed) |
|---|---|---|
| 1 docs, SCRATCH_DIR, WSL2 notes | abaadf1 | `make -n run`; real 06 run via `make run SCRATCH_DIR` showed ext4 header |
| 2 reformat 08 | 7bb6724 | identical preprocessed tokens, identical -O2 assembly, identical `make check` and CSV header (`task2/`) |
| 3 median3 in 06 | 61a1068 | 2M-case equivalence harness vs old inline sort: 0 mismatches (`task3/`) |
| 4 `kind` column | 79358eb | sample runs of 06 and 08 (`task4/`); `make test` asserts shape |
| 5 01 calibration | b5720be | run: n=268435456, register region about 147 ms (`task5_run.txt`) |
| 6 -DFLAGS | f89986f | all 9 build with -Werror; headers/binaries show the real flags (`task6/`) |
| 7 run_receipts.sh | 65de95f | missing SCRATCH_DIR (exit 1, one message), forced build failure in temp copy (exit 1), tag, PIN_CPU, no-taskset note (`task7/`) |
| 8 `make test` | 699ea3b | passes; negative test with a dropped field fails (`task8/`) |
| 9 tools/ | 5caeb61 | script runs from `tools/`; csv/png ignored |
| 10 REVIEW status, receipts README | d4d69c4 | april untouched (0 diff lines since 908eaed) |
| 11 regenerate morgan | 2b63771 | 3 runs, exit 0, empty stderr |

Task 11 elapsed: home 830 s, mnt_c 1222 s, mnt_d 1671 s (about 62 min total).
Observed 06/08 on morgan (run 2): buffered write MB/s home 4773, mnt_c 252, mnt_d 219; 08 loose-object sync-each ms/batch
home 5474, mnt_c 19046, mnt_d 55573. fdatasync ms/sync: home 2.56, mnt_c 1.56, mnt_d 17.3. Interpretation (not tested here):
9p drives are limited by the sharing layer, and the HDD pays the most for sync.

## Deviations and uncertainty
- Task 4: 06 median rows also carry a median ratio and an `advice_status` (accepted only if all 3 trials were); the empty `trial` field marks median rows.
- Task 5: calibration target is 100 ms (twice the floor) so jitter cannot go under 50 ms. The register/volatile ratio on this unpinned run was about 3.0, versus about 7.1 on april's pinned run; not investigated.
- Task 6: Makefiles for 00 to 03 changed `CFLAGS =` to `?=` for consistency (command-line override already worked).
- Task 10: only some findings were spot-checked in code; the rest of "fixed" statuses come from the existing Resolution note and are labeled that way.
- Mistake: I ran `cost_ladder.py` once with `--cpu-price 120`, overwriting your untracked `cost_ladder.csv`; I regenerated it with `--cpu-price 80`, which reproduces the original cache row exactly, and removed stray outputs I made in the parent directory. The file is git-ignored.
- `../AGENTS.md` named by AGENTS.md does not exist. `git diff --check` flags trailing whitespace only inside raw 00_inventory receipts.
- No clang-format available; task 2 was by hand.

## Final state / unresolved
Not pushed, per instruction (intentional exception to AGENTS.md). Local main is ahead of origin/main. Untracked and untouched:
`weeks/week-10/code-ladder/`, `weeks/week-10/memory_and_storage_disucssion.md`. Deferred items not done, as instructed.
README text quoting april numbers for 01 still reflects the old fixed-iteration run (noted in the README).
