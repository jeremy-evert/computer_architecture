# Piper Report — Initiative 009 Ready-to-Ship Preparation

**Owner:** Piper  
**Date:** 2026-08-18  
**Repository:** `jeremy-evert/computer_architecture`  
**Purpose:** collapse remaining analysis/orchestration work so Flo receives only credentialed runtime execution

## Verdict

**READY FOR FLO PREFLIGHT — NOT YET READY TO SHIP**

The Architecture student-facing desired state remains the accepted d03 model. The remaining uncertainty is live-system truth: Savnac fixed-point reconciliation and fresh SWOSU production target/diff evidence. Production mutation remains behind a separate fresh human authorization gate.

## Current Git truth reconstructed

### Architecture source

Accepted d03 source SHA:

`b0ae4211715e067c64895f59b2f36c0715f7aa75`

Architecture canonical `main` at Piper's initial inspection:

`151c59cea65a37e3e994c0c9f6968e970b552e98`

A compare from accepted d03 source through that current main showed the later changes were Sidecar/control/evidence only. No course-source file changed. Therefore the accepted desired model is still the current student-facing Git truth pending Flo's clean runtime revalidation.

Accepted desired model:

- 21 modules covering Weeks 1–17;
- 229 objects: 81 pages, 32 files, 116 assignments;
- 11 desired assignment groups totaling 100%;
- exactly five recurring groups with `drop_lowest=1`;
- Machine Dossier checkpoints only Weeks 6, 9, and 14;
- Week 15 asynchronous wind-down;
- Week 16 Farkle/Machine Learning with no Week 16 checkpoint and no graded recurring dead-day work;
- Week 17 reflection;
- A6, A7, and course evaluation present;
- zero undeclared omissions;
- zero unresolved link tokens.

### Accepted Savnac baseline

Accepted d04 proved Savnac course `8` structurally matched desired state and the only material delta was:

`0 create / 7 update / 233 unchanged / 0 delete`

The seven accepted body updates were:

1. Week 02 — Week at a Glance;
2. Week 03 — Week at a Glance;
3. Week 04 — Week at a Glance;
4. A6 — Professional Pathway (Week 14 Update);
5. A6 — Professional Pathway (Week 15 Submission);
6. Week 16 — Week at a Glance;
7. Week 16 — Explain / Defend.

No create/delete/prune/group/kind/topology mutation belonged to the accepted envelope.

### The buried d05 stop

The remote branch `golem/009-d05-savnac-fixed-point` contains a worker report proving an attempted d05 correctly stopped **before any external write** because its active shared Course Foundry checkout had advanced/dirty state relative to the d04 evidence pin.

This stop was never promoted as an accepted d05 result. It is useful evidence of zero writes and of a stale reproducibility assumption, not evidence that Savnac reached fixed point.

### Course Foundry drift analysis

Accepted d04 Course Foundry SHA:

`22b895a593ef72d0787882b5f40d8463b36db981`

Course Foundry `main` before Piper's repair:

`a49b658f3a230ad74787757cb0ed66ba24d1c7e5`

That main was exactly three commits ahead of the accepted d04 SHA. Those commits touched only the generic production deployer, its tests, and reports. They did not change Architecture desired-course compilation, Savnac deployment, or Architecture source.

The earlier d05 worker therefore encountered an environmental/shared-checkout reproducibility stop, not a demonstrated Architecture compiler drift.

## Work Piper completed

### 1. Added guarded Architecture production support to Course Foundry

Piper promoted these commits to `jeremy-evert/course_foundry` `main`:

- `165f8f2a382e06ad7a44c856f44ba2806165437f` — `Add runtime-locked Architecture production target`
- `9c4493520e5db08e7784e884eaf59a4c483121c7` — `Test Architecture production target lock guards`

Current Course Foundry main after Piper's promotion:

`9c4493520e5db08e7784e884eaf59a4c483121c7`

The production deployer now:

- supports `--course architecture`;
- gives Architecture **no default production Canvas id**;
- refuses Architecture dry-run/push without explicit `--course-id` from fresh target-lock evidence;
- preserves fixed CS1/DSCT ids and rejects mismatched overrides;
- preserves the production-host guard and one-course allowlist;
- re-reads live Architecture course metadata and refuses a target whose name/section identity does not match the expected Computer Architecture / `COMSC-3013-1438` target;
- keeps `prune_scope=none` by default;
- still requires `--confirm-live` for a push.

Tests were added for dynamic Architecture target resolution, no-default-id behavior, parser choices, matching/mismatching live identity, pre-reconcile identity-gate order, and preservation of existing fixed-target behavior.

From Piper's execution seat, the changed Python files were syntax-checked and the target resolver was exercised in a stubbed harness proving fixed CS1 resolution, Architecture rejection without an id, and propagation of an explicit Architecture id. This seat did not have a clean private Course Foundry checkout/`gh` CLI, so full repository pytest is deliberately left as a mandatory Flo preflight runtime check rather than falsely reported as complete.

### 2. Collapsed the remaining Flo burn

The historical runtime staircase d05 → d06 → d07 → d08 → 009e is preserved as design/provenance, but no longer requires five human dispatches.

Active burn is now only:

1. **Preflight to GREEN TO WRITE** — Savnac fixed point + fresh production target lock/diff, with production read-only.
2. **Production closeout** — separate freshly authorized bounded production reconcile + independent readback/student-path closeout + final 009e acceptance.

Durable burn list:

`sidecar/FLO_BURN.md`

Executable jobs:

- `sidecar/jobs/009_architecture_preflight_to_green_to_write.md`
- `sidecar/jobs/009_architecture_production_closeout.md`

### 3. Built the Architecture launch capsule

Executable launcher:

`sidecar/launch_flo.sh`

It follows the established CS1/`foreman_interface` launcher pattern:

- launches a **fresh Claude Sonnet Flo** with no resume/continue state;
- injects canonical Owner/Foreman and Foreman/Worker contracts;
- gives Flo exactly one Architecture job;
- forbids JTT/neighbor-course selection;
- leaves worker dispatch/inspection/promotion to Flo instead of Jeremy;
- preserves unexplained shared-worktree dirt and tells Flo to isolate rather than clean it;
- checks required repositories/contracts/tooling before launch.

Default/preflight mode explicitly grants **no SWOSU production write authority**.

Production mode:

```bash
./sidecar/launch_flo.sh production
```

- fetches canonical Architecture `origin/main` read-only;
- requires the promoted preflight report;
- requires the exact machine-readable verdict line `**Verdict:** ` + `GREEN TO WRITE`;
- records a fresh UTC authorization timestamp;
- tells Flo that this invocation authorizes only the bounded Architecture production write and only after every freshness precondition passes.

## Rollback / stop posture

Canvas reconcile is not treated as transactional. The production job forbids a blind delete/recreate rollback.

If mutation state becomes ambiguous, Flo must stop new writes, independently read the locked course back, classify definitely-applied/absent/ambiguous changes, and retry only when the exact same idempotent desired operation remains fully understood and safe. Otherwise Flo stops with a precise gate.

Independent d08-style closeout is read-only. A defect discovered there does not silently consume the old authorization for a second corrective production write; it returns the campaign to a new bounded preflight/write cycle.

## What remains

The remaining gap is credentialed/live-system work Piper cannot truthfully manufacture from GitHub alone:

1. run clean current Architecture/Course Foundry validation on the execution host;
2. inspect current Savnac course 8 and apply only the safe accepted-body subset if still needed;
3. prove Savnac fixed point twice;
4. freshly discover the exact SWOSU `COMSC-3013-1438` Canvas id;
5. freshly prove the production semantic diff and live enrollment/submission safety;
6. if and only if preflight returns `GREEN TO WRITE`, consume fresh human production authorization;
7. perform the one bounded production reconcile;
8. independently read back/student-walk the course and complete final 009e acceptance.

No additional broad course authoring or orchestration design is currently justified by Git truth.

## Human gate

There is **no human decision required before preflight**.

After an accepted preflight report says `GREEN TO WRITE`, the intended human gate is only fresh authorization to run:

```bash
./sidecar/launch_flo.sh production
```

That authorization does not extend to another course or a materially changed production plan.

## Piper conclusion

The repository is not yet truthfully **READY TO SHIP** because the live Savnac/production checks have not been executed from this seat.

It is now **READY FOR FLO PREFLIGHT** with analysis, safety boundaries, production machinery, evidence contracts, stop behavior, and launcher ergonomics already decided.