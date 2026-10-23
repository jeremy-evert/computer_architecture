# CONNIE-068 — Computer Architecture Obsidian demo

## Outcome

Prepared a portable Obsidian Markdown vault for the Week 10 memory-hierarchy experiment. It links the central question, concept, prediction, executable experiment, measured evidence, justified conclusion, design decision and student-facing notebook rationale. The instructor runbook fits five minutes. All measurements in the vault are actual Maise runs and are linked to raw CSVs and experiment receipts.

## Provenance and repository state

- Owning repository: `jeremy-evert/computer_architecture` (`origin`).
- Original course checkout before work: `/mnt/nora/git/computer_architecture`, clean on `ivy/concept-hub-pointer-link`; left unchanged. Existing other worktrees and uncommitted work were not touched.
- Current remote base after `git fetch origin`: `408b3b2` (`Week 10: Canvas page source for the memory and storage worked example; Section 11 notes`).
- Work branch: `luna/connie-068-obsidian-demo`, in `/tmp/connie-068-architecture`, isolated from existing course worktrees.
- Start-to-finish raw work log and chronology: [working notes](../../raw/2026-10-22_23-32-00/prompt-068/working-notes.md).

## Experiment observed on Maise

The course's existing command `./lab/bin/archlab run memory` was executed on Maise and returned **PASS, 12 rows**. Six additional independent runs were captured as the durable comparison set; all six receipts say PASS with 12 CSV measurements each. A final default-output-path invocation of the documented no-option command also passed.

Captured machine context: host-visible Ubuntu 26.04.1 LTS, Linux 7.0.0-38-generic x86_64, AMD Ryzen 9 3950X (16 cores / 32 logical processors), GCC 15.2.0, 60.5 GiB visible memory. Full privacy-safe machine receipt: `demos/obsidian-week10-memory/evidence/2026-10-22/maise-machine/`.

Six-run medians and observed ranges (pointer chase ns/access; stream read decimal GB/s):

| Working set | Pointer chase | Stream read |
|---:|---:|---:|
| 4 KiB | 1.243232 (1.205110–1.506460) | 63.015385 (50.305891–63.015385) |
| 32 KiB | 1.221135 (1.206760–1.530265) | 65.948176 (52.745272–65.968921) |
| 256 KiB | 3.159565 (3.080771–3.271670) | 65.502538 (51.862847–66.302100) |
| 2 MiB | 9.705651 (9.565574–9.815440) | 64.637400 (62.212377–65.585445) |
| 8 MiB | 11.621718 (11.232872–12.353522) | 60.402643 (52.083341–61.779288) |
| 32 MiB | 56.403880 (54.937204–56.539880) | 36.661975 (36.191274–37.068467) |

Interpretation is limited to this process and host. The data support a size-sensitive shape and different latency/bandwidth behavior. They do not prove an exact cache transition, cache-miss count, or unique causal mechanism. Placement, scheduling, frequency, thermal state, prefetch, and TLB behavior were not controlled. Small-stream samples were noisy and their ranges remain visible.

## Validation

- `./lab/bin/archlab run memory`: **PASS**, 12 rows; default-output-path run observed on Maise.
- Six preserved run receipts and CSVs: **6/6 PASS**, each with 12 rows.
- `python3 -B demos/obsidian-week10-memory/scripts/summarize_runs.py`: **PASS**, recomputes medians/ranges from the six raw CSVs into `summary.json`.
- `python3 -B demos/obsidian-week10-memory/scripts/validate_vault.py`: **PASS**, all 9 required notes and local links resolve.
- `python3 -B -m unittest discover -s demos/obsidian-week10-memory/tests -v`: **7/7 PASS**. Covers links, traversal prevention, evidence receipts/row counts, host scope and reproducible summary.
- `git diff --check`: to be recorded after final staged review.

## Limitations and remaining review

`./lab/bin/archlab doctor` reports **FAIL** because this machine lacks matplotlib and the RISC-V cross compiler. The memory experiment itself uses GCC and passed; this demo does not need a plot or RISC-V toolchain. Obsidian is not installed on Maise, so the vault's render, backlink panel and graph view were not GUI-verified; the ordinary Markdown/Wikilink files and link checker pass, and the runbook gives the built-in Obsidian steps. Confirm Obsidian is available on the presentation computer before Friday.

This branch has not been merged. Independent review and Owner approval are still required before any main-branch merge. No Canvas publication, service changes, course-content changes outside this demo, or Character Garden/Wilbur edits were made.

## Delivery metadata

- Feature commit: pending.
- Remote push/readback: pending.
- Connie task tracking: existing CONNIE-068 will be updated; no duplicate task will be created.
