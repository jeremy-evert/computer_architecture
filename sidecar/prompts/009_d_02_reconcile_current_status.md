# Prompt 009d02 — Reconcile current Architecture status and navigation

**Status:** WORKER COMPLETE / AWAITING FOREMAN ACCEPTANCE
**Initiative:** 009
**Plan:** `sidecar/reports/009_c_plan_architecture_launch_readiness.md`
**Worksite:** `computer_architecture` only
**Mode:** status/navigation repair; no curriculum redesign and no LMS work

## Mission

After d_01 is accepted and promoted, make the repository's cold-start status surfaces describe the course that actually exists and the work that actually remains.

The goal is not more documentation. The goal is **one coherent navigation path instead of three stale queues arguing in the hallway**.

## Read first

- accepted d_01 report and promoted source;
- `README.md`;
- `sidecar/README.md`;
- `sidecar/PLANNING.md`;
- `sidecar/prompts/README.md`;
- `planning/week-17-finals.md` and any planning shell changed/clarified by d_01;
- Initiative 009 charter/report/map/plan.

## Required topology

### Root `README.md`

Keep it as durable course orientation. Repair only stale readiness claims and point current launch/process questions to `sidecar/PLANNING.md`.

### `sidecar/PLANNING.md`

Make this the single current **what remains to launch?** board.

It must state:

- accepted current course/source truth;
- what Prompt 006 proved historically;
- that d_01 restored canonical launch source to main;
- current Initiative 009 stage;
- next READY prompt;
- named remaining gates only;
- production Canvas remains separately gated.

### `sidecar/prompts/README.md`

Make this a dispatch index, not a competing readiness narrative.

It should classify 001–008 as historical/completed/accepted accurately and show the Initiative 009 prompt chain with READY/WAITING/CONDITIONAL/HUMAN-GATE status.

### Durable planning/docs

Where a planning file still says an object “needs authoring” but d_01 has promoted the accepted source, replace the obsolete TODO with durable design truth or a pointer to the implemented source. Do not erase useful historical intent.

## Do not

- invent a new ROADMAP/START_HERE ledger unless existing topology demonstrably cannot work;
- rewrite course pedagogy;
- mark d_03+ gates complete;
- touch Course Foundry/shared repos;
- touch Savnac or production Canvas;
- delete historical prompts/reports merely because they are complete.

## Validation

Perform a cold-reader consistency check:

1. Start at root `README.md`.
2. Follow its current-status pointer.
3. Determine the next executable Architecture unit.
4. Verify no current-status surface still says Prompt 005/006/007/008 is waiting when accepted evidence says otherwise.
5. Verify no current status claims production target lock/deployment that has not happened.
6. Run `git diff --check` and inspect the intended diff.

## Required report

Write:

`sidecar/reports/009_d_02_reconcile_current_status.md`

Record:

- stale claims removed/replaced;
- final authority/navigation roles;
- cold-reader path tested;
- next READY unit;
- validation results;
- commit SHA.

## Worker / Git contract

- Use a bounded job branch/worktree.
- Modify only status/navigation/planning prose required by this prompt plus its report.
- Stage explicit paths.
- Commit/push.
- Do not self-merge or self-certify; Foreman reviews/promotes.

## Acceptance criterion

A cold worker should be able to enter the repository, understand current truth, and dispatch the next unit without reading tonight's chat or being sent backward into already-completed work.

## Stop condition

Stop after status/navigation reconciliation and report. Do not run compiler/Savnac/production reconnaissance.
