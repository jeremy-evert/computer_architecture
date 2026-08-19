# Computer Architecture — Deployment Planning Board

**Course:** COMSC-3013 Computer Architecture, Fall 2026  
**Repository:** `jeremy-evert/computer_architecture`  
**Source of truth:** Git  
**Current initiative:** 009 — Architecture launch readiness  
**Current stage:** Piper ship-prep complete; ready for credentialed Flo preflight  
**Active burn:** `sidecar/FLO_BURN.md`  
**Next command:** `./sidecar/launch_flo.sh`

## Mission

Build and launch an online Computer Architecture course where students understand a computer as a connected, measurable system rather than a vocabulary list.

**build the investigator → build the machine → open the machine → stress the machine → make the architecture decision → wind down and reflect**

## Current desired-course truth

Accepted d03 source/compiler evidence remains the current student-facing Git truth. Piper compared accepted d03 source through the pre-capsule Architecture main and found only Sidecar/control/evidence changes after d03, not course-source changes.

The desired Fall 2026 course remains:

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

Accepted d03 historically passed Architecture/source/compiler/deployment validation. Flo preflight must rerun current validation on a clean execution worksite before live mutation claims are accepted.

## Savnac truth

Accepted d04 read-only Savnac course-8 evidence had verdict `EXPECTED_MATERIAL_DELTA` and showed:

- intended Architecture course `8`;
- 21 canonical modules;
- 229 module items: 81 pages, 32 files, 116 assignments;
- no submitted student work;
- no module-local duplicate titles;
- 11 desired weighted groups at 100% with correct drop rules;
- only Test Student and Jeremy teacher enrollments;
- dry-run `0 create / 7 update / 233 unchanged / 0 delete`.

The seven accepted updates were only:

1. Week 02 — Week at a Glance;
2. Week 03 — Week at a Glance;
3. Week 04 — Week at a Glance;
4. A6 — Professional Pathway (Week 14 Update);
5. A6 — Professional Pathway (Week 15 Submission);
6. Week 16 — Week at a Glance;
7. Week 16 — Explain / Defend.

No create, delete, prune, assignment-group change, kind change, topology change, or duplicate cleanup belonged to the accepted envelope.

A prior d05 worker attempt on branch `golem/009-d05-savnac-fixed-point` stopped correctly before all external writes because its shared Course Foundry checkout had advanced/dirty state relative to the historical d04 pin. That branch is a **zero-write stop receipt**, not an accepted fixed point.

Piper later proved the Course Foundry drift that triggered that stop did not alter Architecture compilation/Savnac machinery. Preflight therefore reasons from current semantic truth rather than demanding stale SHA equality.

## Production machinery truth

Piper promoted guarded Architecture production support to `jeremy-evert/course_foundry` main through:

- `165f8f2a382e06ad7a44c856f44ba2806165437f` — runtime-locked Architecture production target;
- `9c4493520e5db08e7784e884eaf59a4c483121c7` — Architecture production target-lock tests.

Architecture now has **no default production Canvas id**. The generic production deployer requires explicit `--course-id` from fresh target-lock evidence, preserves the production-host guard and one-course allowlist, performs live Architecture identity checking before reconcile, defaults to no prune, and still requires `--confirm-live` for a push.

The exact Fall 2026 SWOSU Canvas id remains intentionally **unknown until fresh live read-only discovery**. Historical ids are not proof.

## Active execution surface

The old d05 → d06 → d07 → d08 → 009e sequence remains design/provenance. Piper collapsed its remaining runtime intent into two Foreman jobs so Jeremy is not the message bus.

| Burn | Status | Launcher | Outcome |
|---|---|---|---|
| Architecture preflight | **READY** | `./sidecar/launch_flo.sh` | current validation + Savnac fixed point + fresh SWOSU target/diff → `GREEN TO WRITE` |
| Architecture production closeout | **HUMAN GATE** | `./sidecar/launch_flo.sh production` | bounded production reconcile + independent closeout + final green |

Canonical jobs:

- `sidecar/jobs/009_architecture_preflight_to_green_to_write.md`
- `sidecar/jobs/009_architecture_production_closeout.md`

Canonical Piper preparation receipt:

- `sidecar/reports/009_piper_ready_to_ship_preparation.md`

## Preflight boundary

Plain launcher mode is allowed to:

- re-establish current Git/compiler truth in clean/isolated worktrees;
- repair proven Architecture/shared-tool defects;
- reconcile only Savnac course `8` inside the accepted d04 body-update envelope;
- prove two consecutive Savnac no-op dry-runs;
- read SWOSU production Canvas;
- freshly lock exact `COMSC-3013-1438` target identity;
- produce and classify a fresh production semantic diff.

Plain mode is **forbidden from writing SWOSU production Canvas**.

A successful preflight report must be promoted to canonical `main` and contain exactly:

```text
**Verdict:** `GREEN TO WRITE`
```

before production mode can consume authorization.

## Production boundary

Only a separate fresh:

```bash
./sidecar/launch_flo.sh production
```

may convey human authorization for the bounded production write.

The launcher checks canonical `origin/main` for the exact accepted preflight verdict before it grants that authority to fresh Flo. Flo must then re-prove source/target/enrollment/submission/diff freshness before mutation.

The intended production command shape is:

```bash
python -m course_foundry.production_deploy push \
  --course architecture \
  --course-id <FRESHLY_LOCKED_ID> \
  --prune-scope none \
  --confirm-live
```

No force, guessed target, broader prune, other course, or unexplained destructive cleanup belongs to this authority.

After write, Flo performs independent API readback and dispatches a fresh read-only closeout focus for the d08 student path. A closeout defect requiring another mutation stops; it does not silently consume the old authorization twice.

## Stop / partial-write posture

Canvas reconcile is not assumed transactional. If mutation becomes ambiguous:

- stop new writes;
- independently read the locked course back;
- classify applied/absent/ambiguous desired changes;
- retry only the exact same idempotent desired operation when evidence makes that safe;
- otherwise stop with the smallest precise gate.

Do not broad-delete/recreate as rollback.

## Human decision surface

There is no Jeremy decision blocking preflight.

After Flo preflight returns and promotes `GREEN TO WRITE`, the intended remaining human decision is only fresh authorization for production. Operationally:

```bash
./sidecar/launch_flo.sh production
```

## READY TO SHIP criterion

Piper may truthfully say **READY TO SHIP** only after evidence proves:

- current course source/compiler/tests green;
- Savnac fixed point;
- fresh exact production target lock;
- bounded understood production semantic diff;
- production reconcile completed on only that target;
- independent readback/fixed point passed;
- independent student-path closeout passed;
- final 009 validation says `GREEN — PRODUCTION DEPLOYED AND LAUNCH-CLOSED`;
- no launch-relevant yellow is disguised as green.

Until then, current status is **READY FOR FLO PREFLIGHT**.