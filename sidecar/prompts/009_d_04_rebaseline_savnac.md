# Prompt 009d04 - Re-baseline Architecture against Savnac

**Status:** ACCEPTED / PROMOTED — verdict `EXPECTED_MATERIAL_DELTA`
**Initiative:** 009
**Mode:** Savnac read-only inventory/dry run; no live reconcile
**Target:** existing Savnac Computer Architecture course 8 only
**Execution evidence:** `sidecar/reports/009_d_04_rebaseline_savnac.md`
**Foreman acceptance:** `sidecar/reports/009_d_04_foreman_acceptance.md`

## Mission

Determine whether Prompt 006's proven Savnac fixed point remains materially valid after canonical launch source is reconciled into current main.

Do the smallest falsifiable check first. Do **not** automatically rewrite Savnac just because source SHAs changed.

## Accepted result

d04 returned and Foreman accepted `EXPECTED_MATERIAL_DELTA`.

The accepted dry-run is:

```text
0 create / 7 update / 233 unchanged / 0 delete
```

The seven updates are bounded student-facing body changes already explained by accepted current-main source. No creates, deletes, assignment-group changes, kind changes, duplicate collisions, or prune actions were proposed. Conditional d05 is therefore released.

## Execution-seat boundary

This was a Computer Architecture-local execution gate. `jeremy_task_tracking` was not the work queue, evidence ledger, or dispatch authority for the run.

## Required actions executed

1. Built current desired state from authoritative Architecture main.
2. Read current Savnac course 8.
3. Ran the existing guarded dry-run/diff path with no live-write confirmation.
4. Compared current desired/live state against Prompt 006 historical fixed-point evidence.
5. Classified every observed delta.

## Verdict contract

### `ZERO_OR_EQUIVALENT`
Current Savnac state already a no-op fixed point or only evidence-only normalization. d05 skipped.

### `EXPECTED_MATERIAL_DELTA`
Current authoritative source intentionally differs from Savnac in bounded student-facing desired state. **This is the accepted d04 verdict.** d05 is required.

### `UNEXPLAINED_DELTA`
Unexpected create/update/delete behavior, unknown live objects, source contradictions, missing assets, non-convergence, or unsafe prune scope. Would require a separate repair/investigation unit.

## Semantic checks completed

The accepted report covers:

- module titles/order;
- object counts/types;
- A6/A7/evaluation presence;
- assignment groups/weights/drop rules;
- due/dead-day behavior;
- Week 1 preserved shared content;
- duplicates/orphans;
- file/link diffs;
- delete/prune scope;
- student/submission/enrollment state relevant to non-production write safety.

## Authority boundary

Allowed during d04:

- Savnac reads;
- dry-run/diff;
- Architecture-local report/run evidence.

Forbidden and not performed:

- JTT task traversal/logging/mutation;
- live Savnac push/reconcile;
- production Canvas access/write;
- shared repo mutation;
- opportunistic compiler repair.

## Durable evidence

- `sidecar/reports/009_d_04_rebaseline_savnac.md`
- `sidecar/reports/009_d_04_foreman_acceptance.md`
- `sidecar/runs/009_d_04_savnac_rebaseline_receipt.md`
- `sidecar/runs/architecture_savnac_source_validation_20260818T143157Z.md`

## Stop condition

d04 is complete. Do not redispatch it. The next executable unit is `009_d_05_reconcile_savnac_fixed_point.md`.
