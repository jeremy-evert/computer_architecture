# Report 009c — Plan the Computer Architecture launch-readiness route

**Status:** ACCEPTED PLAN  
**Date:** 2026-08-17  
**Initiative:** 009  
**Accepted inputs:** Report 009a and Map 009b  
**Mode:** implementation plan only; no source reconciliation or LMS write performed here

## Route summary

The route is intentionally ordered around evidence dependencies:

```text
009_d_01  reconcile launch source into current main
    ↓
009_d_02  reconcile repository status/navigation truth
    ↓
009_d_03  validate current-main full-semester source + compiler, shared repos read-only
    ↓
009_d_04  read-only Savnac re-baseline and inheritance decision
    ↓
    ├── zero/materially equivalent → skip d_05
    └── meaningful Savnac delta → 009_d_05 guarded Savnac reconcile + fixed-point proof
                                      ↓
009_d_06  read-only production target lock + semantic diff
    ↓
    ├── shared defect → Foreman authors next unused evidence-specific d_NN repair unit
    └── GREEN TO WRITE
            ↓
009_d_07  explicitly authorized production reconcile
            ↓
009_d_08  independent launch closeout
            ↓
009_e     cold Foreman validation
```

The first two units are entirely project-local and can proceed without touching Cleo's CS1/Brandy/shared-infrastructure lane.

The plan does not contain a speculative “repair Course Foundry” unit. Shared repair is evidence-discovered only.

---

## Non-goals

This initiative does not:

- redesign the Architecture curriculum;
- add a required commercial textbook or zyBooks dependency;
- create a new deployment stack;
- fork Course Foundry or Harbor into Architecture;
- turn WSL2/macOS/GPU optional validation into launch-blocking ceremony;
- create a fourth Machine Dossier checkpoint;
- rewrite shared Week 1, AI Fluency, Professional Minds, or Farkle curriculum locally;
- bulk-clean historical branches merely for aesthetics;
- authorize a production Canvas write merely by authoring a prompt;
- treat a successful API write as final student-view validation.

---

# Ordered implementation units

## 009_d_01 — Canonical launch-source reconciliation

**Responsibility:** Bring the still-valid launch source stranded on `savnac/architecture-launch-readiness` into current `main` while preserving newer main doctrine.

**Dependency:** accepted 009a/009b/009c only.

**Primary surfaces:**

- `main`;
- `savnac/architecture-launch-readiness` as read-only provenance source;
- `weeks/week-02/`, `week-03/`, `week-04/`, `week-15/`, `week-17/`;
- `assignments/A6-professional-pathway-artifacts.md`;
- `assignments/A7-final-reflection.md`;
- `docs/course-evaluation.md`;
- `scripts/validate_savnac_launch_source.py`;
- branch-only launch reports/receipts only where they remain useful provenance;
- current main `docs/professional-pathway.md`, grading doctrine, and any conflicting newer source.

**Allowed authority:** mutate `computer_architecture` only; create/update course-local files; run repo-local checks; commit/push narrow work.

**Forbidden:** blind branch merge; resetting main to branch; deleting newer main truth; mutation of Course Foundry/shared repos; any LMS write.

**Acceptance proof:**

1. every branch-only launch artifact is classified `INTEGRATE`, `SUPERSEDED`, or `HISTORICAL_ONLY`;
2. every file required by the current full-semester compiler exists on current main after reconciliation;
3. A6/Week-15 content agrees with the newer accepted professional-pathway doctrine;
4. no required launch source remains available only on the Savnac branch;
5. repository-native source checks possible without shared mutation pass;
6. explicit diff reviewed and committed.

**Evidence:** `sidecar/reports/009_d_01_reconcile_canonical_launch_source.md`.

**Repair route:** stay within d_01 until source ownership is coherent. Do not advance with a known stranded required source.

**Can run now:** YES.

---

## 009_d_02 — Current-status/navigation reconciliation

**Responsibility:** Make repository orientation describe the accepted current state instead of old Prompt-004/006 preconditions.

**Dependency:** d_01 accepted, because status must describe the reconciled source rather than guess what the branch integration will retain.

**Primary surfaces:**

- `README.md` current-readiness section;
- `sidecar/PLANNING.md`;
- `sidecar/prompts/README.md`;
- `planning/week-17-finals.md` and any other planning shell whose TODO language is contradicted by durable integrated source;
- sidecar links to Initiative 009 evidence.

**Desired topology:**

- root README = course/durable orientation;
- sidecar PLANNING = single current “what remains to launch?” board;
- prompt README = dispatch index only.

**Allowed authority:** Architecture repo-only prose/status repair and cross-linking.

**Forbidden:** curriculum redesign; shared repo edits; marking unexecuted launch gates GREEN; deleting historical prompt/report evidence.

**Acceptance proof:** a cold reader can determine in under one path what is done, what remains, and the next READY unit without encountering contradictory queue claims.

**Evidence:** `sidecar/reports/009_d_02_reconcile_current_status.md`.

**Repair route:** correct stale/ambiguous status in the same unit.

**Can run now:** after d_01.

---

## 009_d_03 — Current-main source/compiler validation

**Responsibility:** Prove the reconciled current `main` is a complete full-semester source for the existing Architecture compiler.

**Dependency:** d_01 and d_02 accepted.

**Execution needs:** a local seat with checkouts of Architecture + required sibling/shared repositories + Course Foundry. It does not require a production Canvas token.

**Primary checks:**

- exact branch/HEADs and dirt recorded;
- `scripts/validate_savnac_launch_source.py` or its reconciled equivalent against current main;
- current `architecture_desired_course.py` full-semester build;
- targeted Architecture Course Foundry tests;
- module/object/group counts;
- 100% weights/drop rules;
- due/dead-day exceptions;
- A6/A7/evaluation inclusion;
- source/file existence;
- undeclared omissions = none;
- no unresolved link tokens;
- repository-native validators/diff checks.

**Allowed authority:** read shared repos; execute tests/builds; write Architecture-local evidence. No shared source edit.

**Forbidden:** changing Course Foundry/Harbor/shared curriculum; Savnac/production writes.

**Acceptance proof:** one exact current source set compiles cleanly to a complete desired course with no source gap. If a shared defect prevents that, the report must provide an exact reproduction and affected launch gate rather than patch it.

**Evidence:** `sidecar/reports/009_d_03_validate_current_main_compiler.md` plus useful run receipt.

**Repair route:**

- Architecture-local source defect → next unused Architecture repair `d_NN` authored by Foreman;
- real shared defect → next unused separately owned shared-repair `d_NN` after collision review;
- environment-only issue → rerun on a capable seat, not a Jeremy policy question.

**Can run now:** technically read-only, but do not commandeer Brandy from Cleo. Use another capable seat or wait for that ownership window to clear.

---

## 009_d_04 — Savnac re-baseline / inheritance decision

**Responsibility:** Determine whether Prompt 006's Savnac fixed-point evidence remains materially valid for the reconciled current-main desired state.

**Dependency:** d_03 GREEN.

**Mode:** read-only against Savnac.

**Primary actions:**

- record current source/compiler SHAs;
- compile current desired state;
- inventory/read current Savnac course 8;
- run guarded dry-run/diff only;
- compare current delta against Prompt-006 fixed-point/object contract;
- classify delta as `ZERO`, `EXPECTED_MATERIAL`, or `UNEXPLAINED`.

**Allowed authority:** reads/dry run; Architecture-local report.

**Forbidden:** live Savnac push, production read/write beyond what this unit needs, shared repo mutation.

**Acceptance proof:** Foreman can decide whether old Savnac evidence may be inherited or a fresh reconcile is required.

**Evidence:** `sidecar/reports/009_d_04_rebaseline_savnac.md`.

**Branches:**

- `ZERO` / proven equivalent → d_05 SKIPPED and proceed to d_06;
- `EXPECTED_MATERIAL` → execute d_05;
- `UNEXPLAINED` → stop and author repair/investigation unit.

**Can run now:** wait for a collision-free local/Savnac execution seat if Brandy ownership would conflict.

---

## 009_d_05 — Guarded Savnac reconcile and fixed-point proof (CONDITIONAL)

**Responsibility:** Bring Savnac course 8 to the reconciled current-main desired state only when d_04 proves a meaningful expected delta exists.

**Dependency:** d_04 verdict `EXPECTED_MATERIAL` and explicit Foreman acceptance of the intended non-production write boundary.

**Allowed authority:** Savnac course 8 only, using existing Course Foundry/Imprint machinery; no production Canvas.

**Forbidden:** production writes; compiler repair during the write; unexplained prune/delete; other Savnac courses; shared repo mutation.

**Acceptance proof:**

- pre-write inventory/freshness;
- intended diff understood;
- guarded reconcile;
- full read-back;
- second dry run reaches zero create/update/delete;
- no duplicates/orphans/unresolved links;
- counts/groups/dates coherent.

**Evidence:** `sidecar/reports/009_d_05_reconcile_savnac_fixed_point.md`.

**Repair route:** any discovered source/compiler defect gets its own next unused d_NN and d_05 is rerun. Do not patch shared code opportunistically mid-write.

**Can run now:** CONDITIONAL and should not contend with Cleo's active shared/Brandy lane.

---

## 009_d_06 — Production target lock and semantic diff

**Responsibility:** Architecture equivalent of CS1 Prompt 102: establish exact production target and current desired-vs-live delta with **zero production mutation**.

**Dependency:** d_03 GREEN and d_04 accepted; if d_05 was required, d_05 GREEN.

**Execution needs:** production Canvas read credentials and current source/shared checkouts. Shared repositories remain read-only.

**Target-lock evidence:**

- exact course id;
- course name/code/SIS id/term;
- section `COMSC-3013-1438` convergence;
- Jeremy active teacher role;
- workflow/publish state;
- enrollment/write-risk facts;
- explicit rejection of plausible wrong candidates.

**Desired-state evidence:**

- exact source/compiler/shared SHAs;
- current full compile;
- object/module/group counts and sentinel-week rules.

**Semantic diff:**

- modules/objects/assets;
- groups/weights/drop rules;
- due/availability dates;
- publish state;
- Week-1 shared content;
- duplicates/orphans;
- stale/unrepresented Canvas objects;
- links/files;
- destructive prune/delete scope;
- any live student/instructor data that affects write safety.

**Allowed authority:** production reads only; Architecture-local evidence report.

**Forbidden:** any production mutation, shared repair commit, guessing target id.

**Acceptance proof:** verdict `GREEN TO WRITE` or `RED` with exact blocker. Green requires one exact target and understood bounded delta.

**Evidence:** `sidecar/reports/009_d_06_production_recon_and_target_lock.md`.

**Repair route:**

- repo-local source/status defect → next unused d_NN;
- shared defect → evidence-specific separately owned d_NN when collision-free;
- target ambiguity → genuine question only if live/repo evidence cannot resolve it.

**Can run now:** read-only, but best after Cleo's shared-infra production lane is not creating confusing moving-target evidence.

---

## 009_d_07 — Production reconcile

**Responsibility:** Apply the exact accepted d_06 desired state to the exact locked production course.

**Dependency:** d_06 `GREEN TO WRITE`; no unresolved repair unit; shared-infra ownership collision cleared; **explicit Jeremy/authorized human production-write approval at execution time**.

**Pre-write freshness gate:** re-assert target identity, source SHAs, enrollment/submission/live-object state, and expected diff immediately before mutation. Unexpected drift stops the run.

**Allowed authority:** bounded production reconcile against one exact course using established machinery, only after explicit authorization.

**Forbidden:** course creation if reconcile target exists; cross-course writes; speculative cleanup; shared code repair mid-run; publish-state changes not explicitly in the accepted contract; proceeding through unexpected destructive scope.

**Acceptance proof:** guarded write receipt plus API read-back with exact create/update/unchanged/delete results and no unexplained drift.

**Evidence:** `sidecar/reports/009_d_07_reconcile_production_canvas.md`.

**Important:** d_07 completion means `PRODUCTION-RECONCILED`, not `LAUNCH-CLOSED`.

**Can run now:** NO. Explicit write gate required and intentionally not granted by this plan.

---

## 009_d_08 — Independent launch closeout

**Responsibility:** Verify the production course as a professor/student delivery surface after d_07.

**Dependency:** d_07 accepted.

**Checks:**

- course availability/publish posture against launch intent;
- module order and weekly navigation;
- Week-1 transition into Week 2;
- representative technical-core transitions;
- Week 14 → Week 15 wind-down;
- Week 16 dead-days/ungraded boundary;
- Week 17 reflection/evaluation closure;
- assignment groups/weights/drop rules;
- due dates/holiday exceptions;
- links/files/assets;
- duplicate/orphan/unrepresented objects;
- representative student-view accessibility;
- professor-view sanity;
- any enrollment/submission constraints that cannot be exercised named explicitly rather than faked.

**Allowed authority:** reads and only tiny corrective production mutation if a separately explicit correction gate is granted; default is validation-only.

**Forbidden:** trusting d_07 write receipt as proof; curriculum redesign; broad production cleanup.

**Acceptance proof:** `LAUNCH-CLOSED` evidence or exact defect that returns to the next unused d_NN.

**Evidence:** `sidecar/reports/009_d_08_production_launch_closeout.md`.

**Can run now:** NO, only after production reconcile.

---

# Conditional evidence-discovered repair units

Do not pre-number speculative repairs now.

If d_03, d_04, d_05, d_06, d_07, or d_08 exposes a concrete defect, Foreman assigns the next unused `009_d_NN` with:

- one exact owning repository;
- reproduction evidence;
- bounded mutation authority;
- acceptance test;
- return point into the original failed unit.

This preserves evidence-gated decomposition and avoids freezing imagined repairs into the queue.

---

# Concurrency / execution classification

| Unit | Architecture mutable | Shared repos mutable | Brandy required | LMS mutation | Status now |
|---|---|---|---|---|---|
| d_01 | yes | no | no | none | READY |
| d_02 | yes | no | no | none | WAITING ON d_01 |
| d_03 | evidence/report only after source | no | not inherently; capable local seat needed | none | WAITING ON d_01/d_02 |
| d_04 | report only | no | likely Canvas-capable seat | Savnac read/dry-run only | WAITING |
| d_05 | report + no course source edits | no | likely | Savnac write, conditional | CONDITIONAL |
| d_06 | report only | no | Canvas-capable seat | production read-only | WAITING |
| d_07 | report only unless repair spawned | no | Canvas-capable seat | **production write** | HUMAN GATE |
| d_08 | report only | no | not necessarily | production read validation | WAITING ON d_07 |

---

# 009e final validation contract

After all required d_NN units, Foreman authors/executes `009_e_validate_architecture_launch_readiness.md` and independently proves:

## Source truth

- current main contains all required course-local launch source;
- launch branch is not a hidden dependency;
- status/navigation matches accepted state;
- source/shared SHAs are explicit.

## Build/deployment truth

- current desired state compiles;
- group/dead-day/due/checkpoint contracts pass;
- Savnac evidence is fresh or inherited through a documented equivalence proof;
- no unresolved shared-infrastructure launch blocker exists.

## Production truth

At minimum:

- exact target lock and semantic diff are accepted.

If production write was not authorized, valid final state is:

`GREEN TO WRITE`.

If production write was authorized/executed:

- d_07 production reconcile receipt accepted;
- d_08 independent launch closeout accepted;
- valid final state is `GREEN — production course correctly deployed and launch-closed` or a bounded YELLOW only for explicitly non-launch-blocking limitations.

## Final ownership

Workers/sessions may execute checks, but Foreman owns the final verdict and any promotion of current status documents.

---

# Human questions

No new Jeremy curriculum/policy decision is required by this plan.

The only deliberate human gate already known is the eventual **production Canvas write authorization for d_07**. That gate is intentionally deferred until d_06 proves one exact target and a bounded semantic diff.

Runtime access to Canvas/Savnac/Brandy is an execution-capability matter, not a preference question.

**009c verdict: ACCEPTED. Author the bounded d_NN prompts and 009e. First safe unit: 009_d_01.**
