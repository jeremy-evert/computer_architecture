# Prompt 009d06 — Lock Architecture production target and semantic diff

**Status:** WAITING ON 009_d_03 + accepted 009_d_04 (and 009_d_05 if required)  
**Initiative:** 009  
**Mode:** production Canvas read-only reconnaissance; **zero production writes**  
**Course identity:** COMSC-3013 Computer Architecture, Fall 2026, section `COMSC-3013-1438`

## Mission

Perform the Computer Architecture equivalent of CS1's launch-recon/target-lock stage: identify the exact real Fall 2026 production Canvas course by converging evidence, compile the current authoritative desired state, and produce a semantic desired-vs-live diff sufficient for Foreman to decide `GREEN TO WRITE` or `RED`.

This prompt must not change production Canvas.

## Read first

- Initiative 009 charter/report/map/plan;
- accepted d_01 through d_04 evidence and d_05 if it ran;
- `course_metadata.yaml`;
- current grading/professional-pathway doctrine;
- current full-semester compiler contract;
- CS1 Prompt/Report 102 as responsibility-pattern evidence only.

## Preflight source lock

Record exact branch/HEAD/worktree state for:

- `computer_architecture`;
- `course_foundry`;
- kickoff;
- AI Fluency;
- Professional Minds;
- any other source actually consumed.

Preserve unrelated dirt and concurrent work. Do not reset/stash/clean another owner's checkout.

## Exact production target discovery

Use live **read-only** Canvas API evidence. Do not infer the course id solely from memory, a historical Savnac id, or the section number.

For every plausible candidate, inspect enough metadata to converge on one target:

- course name;
- course code;
- SIS course id where available;
- term;
- section id/name;
- `COMSC-3013-1438` match;
- dates;
- workflow/publish state;
- Jeremy's enrollment/teacher role;
- enrollment counts relevant to write risk.

Explicitly state why plausible wrong candidates are rejected.

If exact identity does not converge, verdict is RED. Do not guess.

## Current desired-state compile

Run the actual current compiler from the accepted d_03 source set and record:

- module count;
- page/assignment/file/object counts;
- assignment-group names/weights/drop rules;
- Week 1 ownership;
- Week 16 dead-days/ungraded behavior;
- A6/A7/evaluation presence;
- due-date/calendar exceptions;
- warnings/skips/omissions;
- source/file resolution.

## Live production inventory

Read the exact target course without mutation and inventory at minimum:

- modules/items;
- pages;
- assignments;
- files/assets where relevant;
- assignment groups and rules;
- course publish/workflow state;
- enrollment/submission facts needed to bound destructive risk.

Do not assume the course is empty.

## Semantic desired-vs-production diff

Classify:

1. missing desired modules/objects;
2. stale desired-owned objects needing update;
3. live objects absent from Git/shared desired state;
4. duplicates/orphans/dangling module items;
5. assignment-group/weight/drop-rule differences;
6. due/availability-date differences;
7. publish-state differences;
8. Week-1 shared-content state;
9. links/files/assets and unresolved internal-link risk;
10. prune/delete candidates;
11. any live student/instructor data that makes overwrite/delete unsafe;
12. any source/compiler/live contradiction that cannot be explained.

Every proposed delete must have an ownership/provenance reason. “Not in desired state” is not automatically permission to delete live production content.

## Shared defect boundary

If reconnaissance exposes a real shared Course Foundry/Harbor defect:

- reproduce/name it;
- record affected current SHA;
- state why it blocks or does not block the production write;
- do not repair it here.

Foreman may author the next unused evidence-specific d_NN when ownership is collision-free.

## Required report

Write:

`sidecar/reports/009_d_06_production_recon_and_target_lock.md`

Required sections:

1. source SHA/worktree table;
2. exact target-candidate table and locked target;
3. current desired-state build summary;
4. live target inventory;
5. semantic diff table;
6. destructive-scope analysis;
7. shared-infra findings;
8. production-write preconditions;
9. final verdict.

## Verdict

### `GREEN TO WRITE`

Only if:

- one exact target is locked;
- current desired state is proven;
- the semantic delta is bounded/explained;
- no unexplained destructive action is required;
- no unresolved source/shared defect blocks reconcile;
- d_07 can be written against one exact target and diff.

### `RED`

Name the exact blocker and next evidence/repair responsibility.

## Authority

Allowed: production reads only, local compile/tests, Architecture-local evidence writes.

Forbidden: **all production mutation**, shared repo mutation, target guessing, publish changes, prune/delete/write probes.

## Stop condition

Stop after the target-lock/diff report. A GREEN report still does not authorize d_07 execution.
