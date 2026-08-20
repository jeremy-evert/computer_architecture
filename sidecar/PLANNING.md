# Computer Architecture — Deployment Planning Board

**Course:** COMSC-3013 Computer Architecture, Fall 2026  
**Repository:** `jeremy-evert/computer_architecture`  
**Source of truth:** Git  
**Current initiative:** 009 — Architecture launch readiness  
**Current stage:** PUBLISHED — course `75249` is live (`workflow_state=available`) as of 2026-08-20, post-publish verification passed  
**Active burn:** `sidecar/FLO_BURN.md`  
**Next human action:** none required; monitor as students begin using the course

## Mission

Build and launch an online Computer Architecture course where students understand a computer as a connected, measurable system rather than a vocabulary list.

**build the investigator → build the machine → open the machine → stress the machine → make the architecture decision → wind down and reflect**

## Current desired-course truth

Accepted Architecture source remains the current student-facing Git truth. The desired Fall 2026 course remains:

- Week 1 from shared semester kickoff;
- Weeks 2–4 Architecture-local launch/runway;
- Weeks 5–14 authored technical Architecture runway;
- Week 15 asynchronous wind-down/professional pathway;
- Week 16 shared Farkle + Machine Learning, not Checkpoint 4;
- Week 17 reflection/closure;
- Machine Dossier checkpoints only Weeks 6, 9, and 14;
- A6, A7, course evaluation, grading doctrine, and source validator present;
- 21 modules;
- 229 objects: 81 pages, 32 files, 116 assignments;
- 11 desired assignment groups totaling 100%;
- exactly five recurring groups with `drop_lowest=1`;
- zero undeclared omissions;
- zero unresolved `{{link:...}}` tokens.

## Preflight truth — completed 2026-08-19

Flo independently re-proved current Architecture/Course Foundry readiness and promoted:

`sidecar/reports/009_flo_preflight_to_green_to_write.md`

with verdict:

```text
GREEN TO WRITE
```

That preflight:

- reconciled Savnac course 8 to a proven two-run fixed point;
- freshly discovered and locked the one Fall 2026 production target as Canvas course `75249`, `Fall 2026 Computer Architecture (COMSC-3013-1438)`;
- proved Jeremy teacher authority;
- observed the course as `unpublished`;
- observed six real student enrollments and zero submissions on the then-live 27 assignments;
- produced an additive desired-state dry-run of `225 create / 6 update / 25 unchanged / 0 delete`;
- independently detected seven leftover legacy placeholder modules outside the desired-state plan.

The historical additive diff is evidence, not current mutation authority. The recovery job must freshly read the course again.

## Recovery pivot

A direct visual inspection of production course `75249` after preflight showed that the production shell still exposes legacy/wrong-course identity and instructions, including Kim Zachary content, rather than the intended Jeremy Evert Computer Architecture experience.

That changes the launch task from a simple additive reconcile to a controlled recovery:

1. inventory the entire production course;
2. classify every live object;
3. preserve a durable before-state snapshot;
4. remove only proven legacy/wrong-course objects that are safe to remove;
5. load/reconcile the current Git-backed desired Architecture state;
6. independently verify the result;
7. leave the course unpublished for a separate publish decision.

Canonical recovery job:

`sidecar/jobs/009_architecture_canvas_recovery_rebuild.md`

Canonical launcher:

```bash
./sidecar/launch_flo.sh recovery
```

## Active execution surface

| Burn | Status | Launcher | Outcome |
|---|---|---|---|
| Architecture preflight | **COMPLETE — `GREEN TO WRITE`** | `./sidecar/launch_flo.sh` | source/test truth + Savnac fixed point + fresh production target/diff |
| Architecture Canvas recovery | **COMPLETE — `GREEN — CLEAN AND LOADED; READY FOR PUBLISH DECISION`** | `./sidecar/launch_flo.sh recovery` | full inventory → safe legacy cleanup → desired reconcile → independent closeout; see `sidecar/reports/009_flo_canvas_recovery_rebuild.md` |
| Prior additive-only production closeout | **HELD / SUPERSEDED FOR CURRENT OWNER INTENT** | `./sidecar/launch_flo.sh production` | retained as provenance; do not use for recovery cleanup |

## Recovery authority and safety boundary

A fresh:

```bash
./sidecar/launch_flo.sh recovery
```

is explicit human authorization only for the recovery job on the exact freshly verified Fall 2026 Architecture course.

Flo must first classify each live object as:

- `KEEP`
- `REPLACE`
- `REMOVE`
- `PRESERVE_BLOCKED`
- `UNKNOWN`

No destructive action is authorized for `UNKNOWN` or `PRESERVE_BLOCKED` objects.

The recovery launch authorizes destructive cleanup only for the explicit object-level `REMOVE` manifest after Flo proves each object:

- is legacy/wrong-course content;
- is outside current desired Architecture state;
- has no protected student submission or graded state;
- is not required by a desired object.

Then Flo may reconcile the current Git-backed desired Architecture state using the guarded Course Foundry production machinery with the explicit freshly verified course id.

The recovery job does **not** authorize:

- course publication;
- another Canvas course;
- guessed/replacement course ids;
- blind reset or broad prune;
- deletion of ambiguous/submitted/graded objects;
- section, enrollment, cross-list, SIS, term, teacher, or student mutation;
- other course/JTT work.

## Student-state posture

Students are already enrolled, so Canvas reconciliation is not treated as transactional.

Before cleanup, Flo must refresh submission/graded-state evidence. If protected student state exists on an object proposed for deletion, preserve it and stop or downgrade to a bounded yellow rather than destroying it.

If a mutation becomes ambiguous:

- stop new destructive writes;
- independently read the locked course back;
- classify applied/absent/ambiguous operations;
- retry only the same explicit idempotent operation when evidence makes that safe;
- otherwise stop with the smallest precise gate.

No broad delete/recreate rollback ritual.

## Recovery completion criterion

The recovery job is successful when evidence proves:

- exact production target identity freshly verified;
- full before-state inventory captured;
- every live object classified;
- only explicit safe legacy objects removed;
- no protected student state destroyed;
- current Architecture desired state reconciled;
- final desired-state dry-run is at fixed point / no material delta;
- no legacy Kim Zachary identity or obsolete zyBooks setup is reachable through the student path;
- independent student-path closeout passes;
- course remains unpublished;
- final verdict is `GREEN — CLEAN AND LOADED; READY FOR PUBLISH DECISION`.

A truthful bounded yellow or red is preferred to inventing green.

## Human decision surface

The next intended human action is exactly:

```bash
./sidecar/launch_flo.sh recovery
```

After launch, Jeremy is not the message bus. Flo owns bounded dispatch, evidence inspection, cleanup, desired-state reconcile, and closeout until DONE or a genuine stop condition.