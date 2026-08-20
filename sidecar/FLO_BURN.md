# Computer Architecture — Flo Burn

This is the active executable burn list for Initiative 009.

## Current status — recovery pivot

**2026-08-19:** Architecture preflight is complete and remains valuable base evidence. Flo proved current source/compiler truth, reconciled Savnac course 8 to fixed point, freshly locked the exact Fall 2026 SWOSU target as course `75249` / `COMSC-3013-1438`, and produced verdict `GREEN TO WRITE`.

A subsequent direct visual check of the production course exposed a larger launch problem: the shell still presents legacy/wrong-course material, including Kim Zachary identity/content, while students have not yet received the intended Jeremy Evert Computer Architecture course experience.

The old additive-only production closeout job intentionally forbids destructive legacy cleanup. It therefore no longer matches the Owner's current recovery intent and is **HELD / SUPERSEDED FOR THIS LAUNCH**.

## 1. PREFLIGHT — COMPLETE

**Job:** `sidecar/jobs/009_architecture_preflight_to_green_to_write.md`

**Evidence:** `sidecar/reports/009_flo_preflight_to_green_to_write.md`

**Verdict:** `GREEN TO WRITE`

Important carried-forward facts, subject to fresh live verification:

- production target: course `75249`, Fall 2026 Computer Architecture / `COMSC-3013-1438`;
- course was unpublished;
- six real student enrollments existed;
- zero submissions existed on the then-live 27 assignments;
- desired Architecture truth is 21 modules / 229 objects / 11 weighted assignment groups;
- seven legacy placeholder modules were already known outside desired state.

## 2. CANVAS RECOVERY — ACTIVE HUMAN GATE

**Launch:**

```bash
./sidecar/launch_flo.sh recovery
```

**Job:** `sidecar/jobs/009_architecture_canvas_recovery_rebuild.md`

**Outcome:**

1. fully inventory production Canvas course `75249`;
2. classify every live object as `KEEP`, `REPLACE`, `REMOVE`, `PRESERVE_BLOCKED`, or `UNKNOWN`;
3. preserve a durable before-state inventory and exact removal manifest;
4. remove only proven legacy/wrong-course objects with no protected student state;
5. reconcile the current Git-backed Architecture desired state;
6. independently read back and walk the student path;
7. stop with the course still **unpublished** and verdict `GREEN — CLEAN AND LOADED; READY FOR PUBLISH DECISION`, or a truthful bounded yellow/red.

**Authority:** the fresh `recovery` launcher invocation authorizes the inventory, the explicit object-level `REMOVE` manifest after its safety gate, and the desired-state reconcile on the one freshly verified Architecture production course.

**Forbidden:** another Canvas course; guessed target; broad blind reset/prune; deletion of ambiguous/submitted/graded objects; section/enrollment/cross-list/SIS changes; course publication; other course work; JTT work.

**Stop:** target identity mismatch; course unexpectedly published before cleanup; protected student state on a removal candidate; unresolved `UNKNOWN` objects that prevent a safe cleanup boundary; partial-write ambiguity that cannot be reduced to the same explicit manifest operation; unavailable credentials/network position.

## 3. OLD PRODUCTION CLOSEOUT — HELD

**Old launcher:**

```bash
./sidecar/launch_flo.sh production
```

**Old job:** `sidecar/jobs/009_architecture_production_closeout.md`

That job remains durable provenance for the prior additive-only plan. Do **not** use it for the current recovery because it explicitly forbids the legacy cleanup the Owner has now requested.

## Human surface

The intended next command is now:

```bash
./sidecar/launch_flo.sh recovery
```

Jeremy is not the message bus after launch. Flo owns inventory, bounded worker dispatch, evidence inspection, cleanup execution, desired-state reconcile, and closeout until DONE or a genuine stop condition.