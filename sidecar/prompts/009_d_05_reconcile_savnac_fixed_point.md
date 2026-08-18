# Prompt 009d05 — Reconcile Savnac and prove current fixed point

**Status:** CONDITIONAL — only if 009_d_04 returns `EXPECTED_MATERIAL_DELTA`  
**Initiative:** 009  
**Mode:** guarded non-production Savnac write  
**Target:** existing Savnac Computer Architecture course 8 only

## Mission

If and only if d_04 proves the current authoritative source has a bounded expected material delta from Savnac, reconcile course 8 to that desired state and prove a fresh fixed point.

This prompt does not exist to make a dashboard green. If d_04 is `ZERO_OR_EQUIVALENT`, skip this prompt.

## Preconditions

Before any write:

1. d_03 is GREEN;
2. d_04 is accepted with `EXPECTED_MATERIAL_DELTA`;
3. exact source/compiler/shared SHAs still match the accepted d_04 evidence;
4. exact Savnac course-8 identity is rechecked;
5. enrollment/submission/live object state has not drifted unexpectedly;
6. the dry-run create/update/delete scope still matches the accepted delta;
7. a collision-free execution seat is available.

Unexpected drift stops the run and returns to read-only analysis.

## Write boundary

Use the established Course Foundry / Imprint reconcile path. Do not build a course-specific loader.

Allowed:

- write only to Savnac course 8;
- perform the accepted bounded create/update/delete operations;
- read back and rerun dry-run.

Forbidden:

- production SWOSU Canvas;
- other Savnac courses;
- shared code/source edits during the write;
- unexplained pruning;
- course creation when course 8 exists;
- hiding convergence defects by weakening comparison rules.

## Required proof

After the reconcile:

1. read back course 8 inventory;
2. verify module order/count and desired objects;
3. verify groups/weights/drop rules;
4. verify A6/A7/evaluation and Week-16 dead-days behavior;
5. verify no unexpected duplicates/orphans;
6. verify links/files/assets relevant to changed source;
7. run an immediate dry run;
8. if a one-time normalization delta is exposed, classify/repair only through a separately owned source/mechanism unit, then rerun;
9. final accepted state must reach a true no-op fixed point: zero create, zero update, zero delete.

## Required report

Write:

`sidecar/reports/009_d_05_reconcile_savnac_fixed_point.md`

Include:

- pre-write freshness evidence;
- accepted dry-run delta;
- explicit write command/path used;
- write counts;
- read-back counts;
- fixed-point proof;
- any defect discovered and how ownership was handled;
- exact SHAs.

## Acceptance criterion

GREEN only if Savnac course 8 represents the current authoritative desired state and a subsequent dry run proves convergence with no unexplained mutation remaining.

## Stop condition

Stop after Savnac fixed-point evidence. Do not inspect or write production Canvas in this prompt.
