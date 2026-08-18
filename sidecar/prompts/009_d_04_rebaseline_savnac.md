# Prompt 009d04 - Re-baseline Architecture against Savnac

**Status:** READY TO EXECUTE
**Initiative:** 009
**Mode:** Savnac read-only inventory/dry run; no live reconcile
**Target:** existing Savnac Computer Architecture course 8 only
**Recommended seat:** Architecture-local Luna via `sidecar/scripts/009_d_04_launch_architecture_luna.sh`
**Prerequisite evidence:** `sidecar/reports/009_d_03_foreman_acceptance.md`

## Mission

Determine whether Prompt 006's proven Savnac fixed point remains materially valid after canonical launch source is reconciled into current main.

Do the smallest falsifiable check first. Do **not** automatically rewrite Savnac just because source SHAs changed.

## Execution-seat boundary

This is a Computer Architecture-local execution gate. `jeremy_task_tracking` is not the work queue, evidence ledger, or dispatch authority for this run.

The recommended launcher uses the Luna/medium Codex seat directly from this repository and explicitly excludes JTT traversal:

`sidecar/scripts/009_d_04_launch_architecture_luna.sh`

## Preflight

Record exact current SHAs for:

- `computer_architecture`;
- `course_foundry`;
- shared sources used by the compiler.

Confirm d03's desired-state build is the one under test.

Record current Savnac course-8 identity and inventory read-only. Do not assume the course remains unchanged since Prompt 006.

## Required actions

1. Build current desired state from authoritative Architecture main.
2. Read current Savnac course 8.
3. Run the existing guarded dry-run/diff path with **no live-write confirmation**.
4. Compare current desired/live state against Prompt 006's historical fixed-point contract.
5. Classify every delta as expected or unexplained.

## Verdicts

Return exactly one:

### `ZERO_OR_EQUIVALENT`

Current Savnac state is already a no-op fixed point or the only differences are proven normalization/evidence-only changes that do not require a live reconcile.

Consequence: d05 is SKIPPED; proceed to d06 after Foreman acceptance.

### `EXPECTED_MATERIAL_DELTA`

Current authoritative source intentionally differs from Savnac in student-facing desired state, and the dry run shows a bounded, understood non-destructive reconcile is needed.

Consequence: d05 becomes READY.

### `UNEXPLAINED_DELTA`

The diff contains unexpected create/update/delete behavior, unknown live objects, source contradictions, missing assets, non-convergence, or unsafe prune scope.

Consequence: stop. Foreman authors the next unused evidence-specific repair/investigation unit.

## Required semantic checks

At minimum inspect:

- module titles/order;
- object counts/types;
- A6/A7/evaluation presence;
- assignment groups/weights/drop rules;
- due/dead-day behavior;
- Week 1 preserved shared content;
- duplicates/orphans;
- file/link diffs;
- delete/prune scope;
- any student/submission/enrollment state relevant to non-production write safety.

## Authority

Allowed:

- Savnac reads;
- dry-run/diff;
- Architecture-local report/run evidence.

Forbidden:

- JTT task traversal/logging/mutation for this course-local run;
- live Savnac push/reconcile;
- production Canvas access/write;
- shared repo mutation;
- opportunistic compiler repair.

## Required report

Write:

`sidecar/reports/009_d_04_rebaseline_savnac.md`

Include exact SHAs, inventory, dry-run counts, semantic delta, verdict, and whether d05 is required.

## Acceptance criterion

A fresh Foreman can decide whether Prompt-006 Savnac evidence may be inherited or whether a fresh live Savnac reconcile is justified without guessing from changed SHAs alone.

## Stop condition

Stop after read-only evidence. Do not execute d05 in the same focus.
