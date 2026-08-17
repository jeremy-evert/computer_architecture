# Sidecar Prompt 008 - Repair the full-semester Architecture compiler and prove the dry run

**Status:** IMPLEMENTED IN PART — POLICY/COMPLIANCE RECONCILIATION REQUIRED BEFORE BRANDY ACCEPTANCE  
**Owner:** Foreman / deployment worker  
**Priority:** BLOCKS Prompt 006 until accepted  
**Primary target branch:** `course_foundry:savnac/architecture-full-semester`  
**Known implementation tip:** `667693d9b06066c1268e0f319668029019ccef82`  
**Architecture source branch:** `computer_architecture:savnac/architecture-launch-readiness`

## Mission

Repair the full-semester Computer Architecture DesiredCourse compiler until it is not merely test-green but **source-truthful, policy-truthful, calendar-compliant, and dry-run clean** against the real Savnac course 8.

Do not push live Savnac changes in this prompt.

## Current state

The original connector-authored API/style failures have been repaired on the Course Foundry branch, but a source audit found additional policy/compliance gaps that must be reconciled before the implementation may be accepted.

Before judging any implementation, prove the worktree is actually on the intended remote code:

```bash
git pull --ff-only
git rev-parse HEAD
```

The known API/style repair tip is:

```text
667693d9b06066c1268e0f319668029019ccef82
```

A validation result from an older commit does not accept or reject a newer repair.

## Evidence that opened this prompt

A real Brandy run against older Course Foundry tip `6f82a68f53389530e4fdb3d81e3efaf23de13d67` produced:

- 6 failed / 4 passed targeted tests;
- all six failures collapsed to the same kickoff API mismatch:

```text
TypeError: compute_kickoff_plan() got an unexpected keyword argument 'course_repo_path'
```

- Ruff found six E501 line-length violations.

Those mechanical failures have been repaired on the target branch.

## Additional audit findings that now block acceptance

### A. Drop-lowest mechanics are not yet source-authorized

`computer_architecture/docs/grading-model.md` explicitly says the exact drop-lowest mechanics are still an operational decision/pass. The candidate compiler currently hardcodes `drop_lowest=1` for some recurring groups.

That is not acceptable merely because CS1 has a similar humane policy.

CS1 provides a **precedent**, not automatic authorization. Its accepted rule drops the lowest one in recurring weekly categories while leaving one-time/milestone categories intact. Architecture's own grading model says to preserve that *spirit* but still requires an explicit operational decision.

Required resolution:

- do not silently ship invented drop rules;
- either leave Architecture drop rules unset until explicitly decided, or record an explicit Architecture operational decision adopting a clearly named policy;
- if Architecture adopts the CS1-family rule, apply it coherently to every intended recurring category rather than an arbitrary subset;
- checkpoints, kickoff, professional-pathway submissions, final reflection, and course evaluation must not casually disappear through drop-lowest.

### B. Week 16 dead-days compliance is a hard gate

The accepted CS1 grading closeout already verified the SWOSU semester-exam/dead-days rule and found that the three class days before finals are Monday Nov. 30, Wednesday Dec. 2, and Friday Dec. 4 — all of Week 16 for the Fall 2026 M/W/F calendar.

Architecture's own grading model explicitly says the deployment pass must verify the same institutional rule before publication.

The current candidate compiler still creates graded recurring Week 16 objects, including AI Fluency, Professional Minds, Architecture Investigation, and Explain/Defend work.

That is a compliance blocker.

Required resolution:

- Week 16 Farkle + ML content remains available as the shared application/fun week;
- **no recurring graded assignment may be scheduled during the three dead days**;
- Week 16 must not gain a Machine Dossier checkpoint;
- any Week 16 evidence retained for participation/learning must be ungraded or otherwise compliant with the verified institutional rule;
- add a regression test that fails if a Week 16 recurring graded assignment is reintroduced.

### C. Due-date provenance must be explicit

The compiler may not manufacture exact clock times merely because Canvas accepts them.

Use three buckets:

1. **Source-explicit:** e.g. Professional Minds Wednesday reading source explicitly closes Wednesday at 8:00 AM. Preserve it.
2. **Source-explicit date but no clock:** e.g. a Professional Minds slides assignment explicitly closes the following Monday but does not itself state a clock time. Do not pretend the source specified 23:59; either apply an already-accepted family-wide operational convention and document that provenance, or leave the exact clock unresolved until decided.
3. **Compiler-derived / course-owned:** Architecture Wednesday/Friday placement and break avoidance may derive a date from the accepted weekly grammar and official calendar, but exact due-time policy still requires an accepted operational rule.

Do not conflate "official calendar says this date is legal" with "Jeremy chose this exact due time."

Late-work and revision/resubmission mechanics also remain unresolved unless an accepted Architecture source/decision explicitly says otherwise.

## Implemented mechanical repair already present

The Course Foundry target branch now:

- reconciles `_week1_modules()` to the current `compute_kickoff_plan` API;
- uses the supported universal shared Week 1 path rather than inventing an Architecture-only kickoff overlay;
- preserves Architecture course id 8;
- keeps Week 1 free of a fake Architecture technical gate;
- wraps the six observed E501 violations without changing rubric/course semantics.

These fixes remain necessary but are no longer sufficient for acceptance.

## Required work

### 1. Reconcile policy/compliance before chasing GREEN tests

Inspect:

- `computer_architecture/docs/grading-model.md`;
- accepted CS1-family precedent only as precedent, not automatic Architecture policy;
- Architecture weekly source files;
- Professional Minds scheduling language;
- official Fall 2026 calendar/dead-days evidence already preserved in the course-family grading work.

Repair the compiler and tests so unsupported policy cannot silently become Canvas truth.

### 2. Assert source commits first

Fast-forward and print the exact Course Foundry and Architecture source commits before testing. Do not validate a stale worktree by accident.

### 3. Run targeted tests on real sibling checkouts

Use the Architecture launch worktree rather than requiring Architecture `main` to move first:

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

### 4. Inspect the resulting plan before Savnac contact

Record at minimum:

- course id/label;
- module count and positions;
- object count by kind;
- assignment groups and total weight;
- exact group rules, including whether any drop-lowest rule is present and its source/decision provenance;
- checkpoint titles/weeks;
- Week 9 Fall Break behavior;
- Week 15 Thanksgiving behavior;
- **Week 16: content present, no prohibited recurring graded work, no checkpoint**;
- Week 17 reflection/evaluation objects;
- every due date/time near official breaks/finals, with provenance category (source-explicit, accepted operational convention, or compiler-derived date).

### 5. Run the guarded Savnac dry run

Only after policy/compliance reconciliation, targeted tests, and Ruff are GREEN:

```bash
PYTHONPATH=. "$PY" -m course_foundry.savnac_deploy dry-run \
  --course architecture \
  --architecture-root /mnt/brandy_nvme/jevert/git/computer_architecture_savnac
```

This prompt authorizes **dry-run/read-only reconciliation only**. It does not authorize `push` or `--confirm-live`.

The target is **not blank**. Savnac course 8 already contains the earlier partial Architecture imprint (shared Week 1 + authored Week 5). The full-semester dry run must therefore be interpreted as reconciliation against existing course state, not a first creation pass.

Retain the complete reconcile summary and enough detail to inspect create/update/skip/delete intent. Any unexpected delete, duplicate, course-id mismatch, suspicious existing-object conflict, unsupported group rule, or dead-days violation blocks Prompt 006.

### 6. Write a durable report

Write an Architecture-side receipt/report or update Prompt 006's report with:

- Course Foundry commit tested;
- Architecture source commit tested;
- targeted pytest output;
- Ruff output;
- plan summary;
- group-rule provenance;
- due-date/time provenance;
- dead-days proof;
- Savnac dry-run summary;
- any collision/drift concerns;
- explicit statement that no live Savnac write occurred.

## Acceptance

Accept only when:

1. the kickoff compiler call matches the real current API;
2. targeted Architecture/deployer tests are GREEN on Brandy;
3. Ruff is GREEN for the touched compiler/test files;
4. the full Architecture plan builds from the launch worktree;
5. assignment-group weights sum to 100%;
6. no drop-lowest rule exists without explicit Architecture decision/source provenance;
7. calendar exception tests remain GREEN;
8. Week 16 satisfies the verified dead-days rule and contains no prohibited recurring graded work or hidden Checkpoint 4;
9. exact due times have explicit provenance rather than compiler convenience;
10. the Savnac course-8 dry run completes without writes;
11. the dry-run intent contains no unexplained deletes/duplicates/cross-course objects or policy drift;
12. the observed diff is retained for Prompt 006 review;
13. production Canvas and live Savnac state are unchanged.

## Done when

Prompt 006 has a tested, policy-truthful, calendar-compliant full-semester compiler and an inspected course-8 dry-run diff, not merely a green unit test suite.
