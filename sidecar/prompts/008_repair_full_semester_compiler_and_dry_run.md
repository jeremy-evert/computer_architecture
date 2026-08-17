# Sidecar Prompt 008 - Repair the full-semester Architecture compiler and prove the dry run

**Status:** ACCEPTED 2026-08-17 — `course_foundry` main `acdff26`  
**Owner:** Foreman / deployment worker  
**Priority:** BLOCKS Prompt 006 until accepted

## Acceptance record (2026-08-17)

Compiler reconciled against the real `KickoffObjectSpec`/`KickoffModulePlan`
schema (dispatched to a golem, independently re-verified by Foreman:
pytest 10/11 green — the one remaining failure is a pre-existing,
out-of-scope `SourcePaths.defaults()` gap unrelated to this repair — Ruff
clean, dry-run reproduced with identical numbers on a second run). Full
detail: `course_foundry/reports/2026-08-16_prompt008_repair_full_semester_compiler_and_dry_run.md`.

**Real blocker found for Prompt 006, not resolved here (deliberately out of
this compiler unit's scope):** the dry-run against live Savnac course 8
returned `create=250, update=0, skip=11, delete=0` — effectively
all-create, not a reconciliation. Root cause, confirmed directly against
live Canvas: the existing partial imprint's title format doesn't
byte-match the current compiler's output (e.g. live module `"Computer
Architecture Week 5 — Build the Machine"` vs desired `"Computer
Architecture Week 05 - Build the Machine"` — zero-padding and
em-dash-vs-hyphen), so Imprint's title-based matching treats every object
as new. Left as-is rather than silently reformatting either side. Prompt
006 must resolve this (retitle the compiler to match live, or explicitly
clean up/retire the 6 stale modules/20 stale assignments from the earlier
partial imprint before any live write) before authorizing a live push —
this is exactly the "not a blank slate" / "block on duplicate
titles/objects" condition Prompt 006 already names.  
**Primary target branch:** `course_foundry:savnac/architecture-full-semester`  
**Known mechanical-repair tip:** `667693d9b06066c1268e0f319668029019ccef82`  
**Architecture source branch:** `computer_architecture:savnac/architecture-launch-readiness`

## Mission

Make the full-semester Computer Architecture DesiredCourse compiler **source-truthful, policy-truthful, calendar-compliant, test-green, and dry-run clean** against real Savnac course 8.

Do not push live Savnac changes in this prompt.

## Sync before judging

The earlier Brandy run tested stale worktrees. Before every validation:

```bash
git fetch origin
git pull --ff-only
git rev-parse HEAD
```

Print/assert the Architecture and Course Foundry commits actually under test. A result from an older commit neither accepts nor rejects a newer repair.

## Mechanical repair already authored

The Course Foundry target branch already contains a repair for the original failures:

- obsolete `compute_kickoff_plan(..., course_repo_path=...)` removed/reconciled to the current kickoff API;
- universal shared Week 1 preserved;
- Architecture course id remains 8;
- six known Ruff E501 failures wrapped without changing semantics.

These changes still require real Brandy proof.

## Architecture policy is now closed

Authoritative sources:

- `computer_architecture/docs/grading-model.md`
- `computer_architecture/sidecar/questions/003_assessment_and_grading_contract.md`

Do not reopen these decisions during compiler work.

### Drop-lowest

Set `drop_lowest=1` on the five genuinely recurring graded groups:

- AI Fluency;
- Professional Minds Wednesday;
- Professional Minds Friday;
- Weekly Architecture / investigation work;
- Weekly Explain / Defend evidence receipt.

No drop for kickoff, Machine Dossier checkpoints, professional pathway Week 14/15, final reflection, or course evaluation.

### Due-time convention

If owning source names a due day but no clock, use **11:59 PM America/Chicago on that named day**.

Source-explicit clocks and institutional-calendar constraints take precedence. Professional Minds reading assignments that explicitly say 8:00 AM remain 8:00 AM.

### Late penalties

Late penalties are owned by the existing Marker policy. Do not duplicate penalty arithmetic in the Architecture compiler or invent Canvas-local penalties. Preserve due/submission context needed by the shared grading path.

### Resubmission

Resubmission is always allowed and the highest accepted score is retained. Do not add an Architecture-specific close window merely because Canvas exposes one. If highest-score retention is missing in the shared grading/writeback path, report/fix that in its owning shared repository rather than inventing a Course Foundry-only rule.

## Week 16 dead-days compliance — hard gate

The verified Fall 2026 dead days are Mon Nov. 30, Wed Dec. 2, Fri Dec. 4, which is all of Architecture Week 16.

Therefore:

- Farkle + ML learning content remains present;
- no recurring graded AI Fluency object in Week 16;
- no recurring graded Professional Minds object in Week 16;
- no graded Architecture Investigation in Week 16;
- no graded Explain / Defend in Week 16;
- no Week 16 Machine Dossier checkpoint;
- add/retain regression tests that fail if those graded objects return.

## Required work

### 1. Reconcile compiler policy

Update `course_foundry/architecture_desired_course.py` and tests to match the authoritative Architecture policy above.

Do not treat green tests as a substitute for reading the policy files.

### 2. Run targeted tests on real sibling checkouts

Use the Architecture launch worktree:

```bash
export ARCHITECTURE_SOURCE_ROOT=/mnt/brandy_nvme/jevert/git/computer_architecture_savnac
```

Run:

```bash
PYTHONPATH=. "$PY" -m pytest -q \
  tests/test_architecture_desired_course.py \
  tests/test_savnac_deploy.py

PYTHONPATH=. "$PY" -m ruff check \
  course_foundry/architecture_desired_course.py \
  tests/test_architecture_desired_course.py
```

Do not claim GREEN from code inspection alone.

### 3. Inspect the generated plan before Savnac contact

Record at minimum:

- course id/label;
- module count and positions;
- object count by kind;
- assignment groups and total weight;
- exact drop rules;
- checkpoint titles/weeks;
- Week 9 Fall Break behavior;
- Week 15 Thanksgiving behavior;
- Week 16 content present but no prohibited recurring graded work/checkpoint;
- Week 17 reflection/evaluation objects;
- due dates/times near official breaks/finals and their provenance.

### 4. Run guarded Savnac dry run

Only after policy reconciliation, pytest, and Ruff are GREEN:

```bash
PYTHONPATH=. "$PY" -m course_foundry.savnac_deploy dry-run \
  --course architecture \
  --architecture-root /mnt/brandy_nvme/jevert/git/computer_architecture_savnac
```

This is **dry-run/read-only only**. No `push` / `--confirm-live`.

Savnac course 8 is not blank. It already contains the earlier partial Architecture imprint (shared Week 1 + authored Week 5). Interpret the output as reconciliation against existing dogfood state.

Any unexpected delete, duplicate, course-id mismatch, suspicious conflict, policy drift, or dead-days violation blocks Prompt 006.

### 5. Retain evidence

Write/retain a durable Architecture-side report/receipt containing:

- exact Course Foundry commit;
- exact Architecture source commit;
- pytest output;
- Ruff output;
- generated-plan summary;
- group/drop rules;
- due-time provenance;
- Week 16 compliance proof;
- Savnac dry-run summary;
- collision/drift concerns;
- explicit confirmation no live Savnac write occurred.

## Acceptance

Accept only when:

1. the real Brandy worktrees were synced and exact tested commits recorded;
2. targeted Architecture/deployer tests are GREEN;
3. Ruff is GREEN;
4. assignment-group weights sum to 100%;
5. drop-lowest exactly matches the resolved Architecture policy;
6. due times follow source-explicit clocks or the resolved all-day/11:59 PM convention;
7. Week 16 contains no prohibited recurring graded work or Checkpoint 4;
8. compiler introduces no conflicting late-penalty or resubmission cutoff policy;
9. the course-8 dry run completes without writes;
10. no unexplained deletes/duplicates/cross-course objects/policy drift appear;
11. the observed diff is retained for Prompt 006;
12. production Canvas and live Savnac state are unchanged.

## Done when

Prompt 006 has a tested, policy-truthful, calendar-compliant full-semester compiler and an inspected course-8 dry-run diff.
