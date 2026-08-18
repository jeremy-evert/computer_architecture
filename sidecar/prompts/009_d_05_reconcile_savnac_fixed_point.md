# Prompt 009d05 — Reconcile Savnac and prove current fixed point

**Status:** READY TO EXECUTE — d04 accepted `EXPECTED_MATERIAL_DELTA`
**Initiative:** 009
**Mode:** guarded non-production Savnac write
**Target:** existing Savnac Computer Architecture course 8 only
**Recommended seat:** Architecture-local Luna via `sidecar/scripts/009_d_05_launch_savnac_reconcile_luna.sh`
**Prerequisite evidence:** `sidecar/reports/009_d_04_foreman_acceptance.md`

## Mission

Reconcile the seven accepted current-main body updates into existing Savnac course 8 and prove a fresh fixed point.

Accepted d04 evidence established a bounded material delta. This prompt is therefore required, not speculative cleanup.

## Accepted d04 envelope

The pre-write freshness dry-run must reproduce exactly:

```text
0 create / 7 update / 233 unchanged / 0 delete
```

The seven accepted updates are:

1. Week 02 — Week at a Glance;
2. Week 03 — Week at a Glance;
3. Week 04 — Week at a Glance;
4. A6 — Professional Pathway (Week 14 Update);
5. A6 — Professional Pathway (Week 15 Submission);
6. Week 16 — Week at a Glance;
7. Week 16 — Explain / Defend.

No assignment-group change, create, delete, kind change, duplicate collision, or prune action belongs to this unit.

## Execution-seat boundary

This is a Computer Architecture-local execution unit. `jeremy_task_tracking` is not the work queue, evidence ledger, or dispatch authority for this run.

The bounded launcher is:

`sidecar/scripts/009_d_05_launch_savnac_reconcile_luna.sh`

The Luna seat executes and records evidence. The external Foreman independently reviews, accepts/rejects, promotes, and releases d06.

## Preconditions

Before any write:

1. d03 remains accepted GREEN;
2. d04 is accepted with `EXPECTED_MATERIAL_DELTA`;
3. current Architecture main is proven not to contain a student-facing desired-source change after the d04 source SHA;
4. shared source/compiler SHAs still match accepted d04 evidence;
5. exact Savnac course-8 identity is rechecked;
6. enrollment/submission/live object state has not drifted unexpectedly;
7. guarded dry-run reproduces exactly the accepted `0 create / 7 update / 233 unchanged / 0 delete` envelope;
8. prune scope remains `none`;
9. a collision-free execution seat is available.

Unexpected drift stops the run before write and returns to read-only analysis.

## Write boundary

Use the established Course Foundry / Imprint reconcile path. Do not build a course-specific loader.

Allowed:

- write only to existing Savnac course 8;
- perform only the seven accepted body updates;
- read back and rerun guarded dry-runs.

Forbidden:

- production SWOSU Canvas;
- other Savnac courses;
- shared code/source edits during the write;
- creates or deletes;
- pruning;
- unexplained assignment-group changes;
- course creation when course 8 exists;
- hiding convergence defects by weakening comparison rules;
- JTT traversal/logging/mutation for this course-local run.

## Required proof

After the reconcile:

1. record the live write counts and require `0 create / 7 update / 0 delete`;
2. read back course 8 inventory;
3. verify module order/count and desired objects;
4. verify groups/weights/drop rules;
5. verify A6/A7/evaluation and Week-16 dead-days behavior;
6. verify no unexpected duplicates/orphans;
7. verify links/files/assets relevant to changed source;
8. run an immediate guarded dry-run and require zero create/update/delete;
9. run a second consecutive guarded dry-run and require the same no-op result;
10. if a normalization/convergence defect appears, stop and record ownership rather than patching shared mechanisms inside d05.

## Required report

Write:

`sidecar/reports/009_d_05_reconcile_savnac_fixed_point.md`

Include:

- pre-write freshness evidence;
- accepted and reproduced dry-run delta;
- explicit write command/path used;
- write counts;
- read-back counts;
- both post-write fixed-point dry-runs;
- any defect discovered and how ownership was handled;
- exact SHAs and dirt caveats.

Useful raw receipts may go under `sidecar/runs/` with no secrets/student data.

## Acceptance criterion

GREEN only if Savnac course 8 represents the current authoritative desired state and two consecutive post-write guarded dry-runs prove a true no-op fixed point with no unexplained mutation remaining.

## Stop condition

Stop after Savnac fixed-point evidence is committed and pushed on the bounded d05 branch. Do not merge, self-certify, inspect production Canvas, or execute d06.
