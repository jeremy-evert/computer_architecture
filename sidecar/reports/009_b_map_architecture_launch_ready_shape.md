# Report 009b — Map the Computer Architecture launch-ready shape

**Status:** ACCEPTED MAP  
**Date:** 2026-08-17  
**Initiative:** 009  
**Accepted input:** `sidecar/reports/009_a_report_architecture_launch_readiness.md`  
**Mode:** desired-shape map only; no implementation or LMS writes

## Executive map

The desired launch-ready shape is intentionally simple:

```text
                         durable shared curriculum
              kickoff / AI Fluency / Professional Minds
                                  |
                                  v
current computer_architecture main  <---- durable course doctrine/source
            |                         (the only Architecture launch authority)
            |
            v
Course Foundry full-semester desired-state compiler
            |
            +----> local/source validation
            |
            +----> Savnac dogfood / convergence evidence
            |
            +----> read-only production target lock + semantic diff
                              |
                              v
                       GREEN TO WRITE
                              |
                   explicit human write gate
                              |
                              v
                    production reconcile
                              |
                              v
              independent read-back / student-view closeout
                              |
                              v
                         LAUNCH GREEN
```

The old `savnac/architecture-launch-readiness` branch is **provenance and recovery source**, not a permanent second curriculum authority. Its surviving launch artifacts must be reconciled into current `main` against newer main truth. After acceptance, it may remain as historical provenance until a later explicit cleanup, but no compiler or worker should require it as the active course source.

---

## 1. Canonical source topology

### `computer_architecture/main`

**Authority:** Architecture course truth.

Owns:

- course-specific week packages;
- Architecture assignments and rubrics;
- Machine Dossier doctrine/source;
- grading and professional-pathway doctrine;
- open/free material policy;
- lab contracts and required-path support claims;
- course metadata;
- project-local sidecar orchestration/evidence.

Launch evidence is invalid if it requires a hidden alternate Architecture worktree that contains required student source absent from main.

### `savnac/architecture-launch-readiness`

**Authority after reconciliation:** historical/provenance only.

Current role:

- recovery source for launch artifacts that never returned to main;
- evidence of the exact source shape used by accepted Prompt 006.

Desired role:

- no required runtime dependency;
- no newer authoritative course truth;
- optional retained branch until later explicit cleanup/archival decision.

A blind merge is not the desired topology because the branch is behind current main. Reconciliation must preserve newer main doctrine and transplant only still-valid launch source/evidence.

### Shared curriculum repositories

**Authority:** their own curriculum strands.

- `semester_kickoff_week` owns universal Week 1;
- `ai_fluency` owns the AI Fluency strand;
- `professional_minds` owns the shared Professional Minds strand;
- shared Farkle source remains owned by its canonical repository.

Architecture references/composes these sources. It does not fork copies merely to make deployment easier.

### Course Foundry

**Authority:** composition/deployment mechanics, never Architecture curriculum truth.

It may encode:

- source-path contracts;
- module/object composition;
- calendar/due-date mechanics derived from accepted policy;
- grading-group mechanics;
- dry-run/reconcile behavior;
- validation against source expectations.

If Course Foundry and Architecture course doctrine disagree, the disagreement is a defect to reconcile, not permission for the deployer to silently redefine the course.

### Savnac

**Authority:** dogfood/proving surface only.

Useful for:

- real Canvas-behavior testing;
- convergence/idempotency;
- link/file/render validation;
- destructive-scope rehearsal;
- navigation inspection.

Savnac state never becomes the curriculum source of truth.

### Production SWOSU Canvas

**Authority:** live delivery state, not authored curriculum truth.

It must be reconciled from proven Git desired state and then independently read back. Existing live content must be treated as real user-facing state, never as an empty disposable target unless evidence proves that boundary.

---

## 2. Launch-source completeness contract

Current `main` is launch-source complete only when all of the following are true.

### Course-local semester source

Required course-local source includes or deliberately references:

- Weeks 2–4 student-facing Architecture packages;
- Weeks 5–14 technical packages;
- Week 15 wind-down package;
- Week 16 Architecture consumer package;
- Week 17 reflection/closure package;
- A6 professional-pathway assignment source;
- A7 final-reflection source;
- course-evaluation source;
- grading model;
- professional-pathway doctrine;
- Machine Dossier/checkpoint source;
- course metadata;
- lab/support doctrine and validation contract.

Week 1 remains shared rather than copied locally.

### Shared-source availability

A source-valid launch checkout must resolve the exact expected sibling/shared sources for:

- kickoff;
- AI Fluency;
- Professional Minds;
- any generated/shared Farkle dependency required by the Week-16 validation contract.

The checkout may not silently substitute stale local exports for missing shared authority.

### Compiler contract

The current full-semester compiler must be able to consume current authoritative Architecture `main` plus the named shared sources and produce Weeks 1–17 with:

- no undeclared omissions;
- grading weights totaling 100%;
- accepted drop-lowest rules;
- Week-16 dead-days grading boundary;
- accepted due-time/calendar exceptions;
- exactly three Machine Dossier checkpoints;
- final reflection and evaluation objects;
- no unresolved internal link tokens or missing file sources.

### Evidence contract

Source completeness is **not** proven merely because files exist. The full source validator/compiler tests must execute against the reconciled current-main checkout and record the exact source SHAs used.

---

## 3. Navigation/status topology

The repository needs fewer competing status surfaces, not more.

### Root `README.md`

Role: **course identity and durable orientation**.

It answers:

- what is this course;
- how is it designed;
- where is durable course doctrine;
- where does a worker go for current launch/process status.

It should not carry a long volatile implementation queue that can age independently.

### `sidecar/README.md`

Role: **process topology and authority boundary**.

It explains what belongs in prompts/reports/questions/runs and that Git course source remains authoritative.

### `sidecar/PLANNING.md`

Role: **single current “what remains to launch?” board**.

This is the cold-start status authority. It should:

- summarize accepted current truth;
- name current lifecycle stage;
- link to the latest accepted report/map/plan;
- list only real remaining gates/units;
- avoid duplicating long prompt instructions.

### `sidecar/prompts/README.md`

Role: **dispatch index**, not a second readiness board.

It should tell a worker which prompt is READY / WAITING / COMPLETE and link to accepted receipts, deriving status from the accepted initiative evidence rather than preserving an old launch sequence forever.

### Prompt/report pairs

Role: **bounded work order + evidence receipt**.

A report may supersede the operational claim of its prompt while preserving the prompt as historical intent.

### `planning/` and `docs/`

Role: **durable course doctrine**, not process queue.

Planning files may explain the semester/week design, but resolved operational TODO prose should not remain framed as open if implementation has moved into durable source.

### Conflict precedence

For course design truth:

```text
accepted durable course source/doctrine > old planning TODO prose > sidecar historical prompt intent
```

For process/readiness truth:

```text
latest accepted initiative report/validation > sidecar/PLANNING summary > prompt queue index > historical prompt status text
```

---

## 4. Evidence promotion ladder

### AUTHORED

Meaning: required source exists in its owning repository.

Evidence:

- files/source contract;
- ownership is correct;
- no known placeholders represented as finished content.

Not implied:

- tests passed;
- compiler consumes it;
- LMS can render it.

### SOURCE-VALIDATED

Meaning: current source passes repository/source validation on the exact checkout intended for deployment.

Evidence:

- exact SHAs;
- source-validator/tests;
- required referenced paths exist;
- validation receipt.

Owner: course repo for course-local checks; shared repo only for its own mechanisms.

### COMPILED

Meaning: Course Foundry can build a complete desired course from the exact source set.

Evidence:

- full-semester dry build;
- object/module/group counts;
- no undeclared omissions;
- policy/calendar assertions;
- no missing file/source errors.

Not implied: Canvas state matches it.

### SAVNAC-PROVEN

Meaning: the desired course has survived real Canvas behavior on Savnac and converges.

Evidence:

- guarded reconcile/read-back;
- idempotent second dry run;
- no unexpected orphans/duplicates;
- rendered links/files and group behavior checked.

Prompt 006 proves this for its historical launch-source snapshot.

### PRODUCTION-TARGET-LOCKED

Meaning: exact production course identity is proven live and current desired-vs-live delta is understood.

Evidence:

- live read-only Canvas metadata;
- repo identity convergence;
- exact target course id;
- current desired-state compile at recorded SHAs;
- semantic diff;
- destructive-scope classification.

Owner: Architecture launch recon session. Acceptance: Foreman.

### GREEN TO WRITE

Meaning: all source/target/diff/machinery gates are green, but no production mutation is implied.

Additional conditions:

- no shared mutable collision;
- no unexplained destructive action;
- production-write prompt is bounded to one exact target;
- explicit write authorization remains separate.

### PRODUCTION-RECONCILED

Meaning: the explicitly authorized production write completed and read-back shows the intended API-level state.

Not implied: a student can successfully navigate/use the course.

### LAUNCH-CLOSED

Meaning: independent post-write review proves student/professor-facing launch quality.

Evidence includes:

- module navigation/order;
- publish/availability state;
- assignment groups/rules;
- due dates and dead-days behavior;
- links/files/assets;
- duplicate/orphan detection;
- representative student-view journey;
- any required enrollment/submission constraints explicitly checked or named.

Final acceptance: Foreman.

---

## 5. Savnac inheritance boundary

Prompt 006 remains strong **mechanism evidence** after source reconciliation:

We may inherit confidence that:

- generic Imprint can reconcile Architecture course 8;
- the full-semester object model can converge in Canvas;
- module-title duplicate hazards were understood/repaired;
- known trailing-slash/link-token non-convergence defects were repaired;
- 100% group structure and 21-module course shape were once read back successfully.

We must re-prove after current-main reconciliation:

- current source validates;
- current compiler output succeeds against current source SHAs;
- object counts/diffs produced by the newer source are coherent;
- Savnac still reaches a no-op fixed point if the source materially changed;
- newly integrated professional-pathway/current-main changes render correctly.

A full live Savnac rewrite is not automatically required if a read-only dry run and source-identical evidence prove no material delta. The 009c plan should choose the smallest falsifiable proof.

---

## 6. Production reconnaissance map

Architecture needs a dedicated **read-only** launch reconnaissance stage analogous to CS1 102.

It must produce one report containing:

### Target lock

- live production Canvas identity;
- exact course id;
- section/SIS/course-code/term/instructor evidence;
- workflow/publish state;
- enrollment summary needed for write-risk judgment;
- explicit rejection of any plausible wrong candidate.

### Source lock

- exact `computer_architecture` SHA;
- exact `course_foundry` SHA;
- exact shared-source SHAs;
- worktree/dirt handling where the execution seat can see it.

### Current desired-state build

- module/object/group counts;
- sentinel week behavior;
- group weights/rules;
- due/dead-day checks;
- source-path/file checks;
- warnings/omissions.

### Semantic production diff

At minimum classify:

- missing/stale/extra modules;
- pages/assignments/files;
- assignment groups/weights/drop rules;
- due/availability dates;
- publish state;
- links/assets;
- duplicates/orphans;
- Week-1 shared ownership;
- destructive delete/prune scope;
- objects not represented by Git;
- anything that would overwrite live instructor/student work.

### Verdict

- `GREEN TO WRITE`, or
- `RED` with exact blocker.

No production mutation belongs in this stage.

---

## 7. Production write and closeout separation

### Production reconcile unit

Responsibility: apply one pre-understood desired-state reconcile to one exact production course after explicit authorization.

Must:

- recheck source/target freshness immediately before write;
- preserve live work outside intended scope;
- bound prune/destructive behavior;
- record create/update/unchanged/delete counts;
- read back API state;
- stop on unexplained drift.

It does not declare launch GREEN.

### Launch-closeout unit

Responsibility: independently inspect the post-write course as a professor/student delivery surface.

Must not merely trust the write receipt.

It verifies navigation, availability/publish state, grading mechanics, dates, links/assets, duplicates/orphans, representative week transitions, and the final reflection/Week-16/dead-day edges.

---

## 8. Shared-infrastructure ownership boundary

Architecture may **inspect and report** a shared defect at any stage.

Architecture may not mutate shared repositories merely because its own gate is red when another owner/session is actively using them.

The desired escalation shape is:

```text
Architecture evidence exposes shared defect
        ↓
Architecture records exact failing contract + reproduction + affected gate
        ↓
Foreman classifies blocker vs non-blocker
        ↓
If repair is required, assign a separately owned shared-repo unit when collision-free
        ↓
Return exact repair SHA to Architecture validation
```

No Architecture-local fork of Course Foundry/Harbor is acceptable as a hidden workaround.

---

## 9. Platform/support boundary

### Required-path blockers

A platform limitation blocks launch only if a normal enrolled student cannot complete required work through a documented supported path at no extra required cost.

### Honest yellows

The following may remain YELLOW without blocking launch when the required Linux/fallback path remains real:

- unexecuted WSL2 proof;
- unexecuted macOS proof;
- container-image proof where not required for the normal path;
- optional accelerator/GPU lanes;
- instructor hardware-zoo experiments;
- physical showcase inventory.

Student-facing support claims must match executed evidence. Do not claim broad platform support merely because a tool should theoretically work there.

---

## 10. Final 009e validation shape

A cold Foreman must be able to establish, from repository/evidence rather than chat memory:

1. all launch-required Architecture source lives on authoritative current main;
2. no required launch source remains stranded only on the Savnac branch;
3. current navigation/status files point forward rather than to completed blockers;
4. current exact source set validates and compiles;
5. current Savnac evidence is either fresh or inherited with an explicit source-equivalence argument;
6. exact production target is locked;
7. production semantic diff is known;
8. any shared-infrastructure blocker is either repaired by an owned unit or proven non-blocking;
9. production write is either intentionally not authorized (`GREEN TO WRITE`) or completed with a bounded receipt;
10. if written, independent launch closeout passed;
11. remaining platform yellows are accurate and non-blocking.

Allowed final verdicts remain those in the charter:

- `GREEN — production course correctly deployed and launch-closed`;
- `GREEN TO WRITE`;
- `YELLOW — usable with named non-launch-blocking limits`;
- `RED — concrete blocker`.

If validation reveals a fixable defect, return to the next unused `d_NN` unit and rerun 009e.

---

## 11. Exact questions for 009c planning

009c must turn this map into bounded ordered units answering:

1. What exact unit reconciles launch-branch source into current main without blind merge or loss of newer doctrine?
2. What exact unit repairs stale current-status/navigation after source reconciliation, and which file becomes the single “what remains” board?
3. What exact unit proves current-main source validation and full-semester compilation, and how does it avoid shared-repo mutation during Cleo's ownership window?
4. Does current-source change require a fresh Savnac fixed-point run, or can a smaller deterministic equivalence/dry-run gate prove inheritance from Prompt 006?
5. What exact read-only production reconnaissance prompt locks the target and semantic diff?
6. What defects, if any, discovered by that recon belong to repo-local repair versus a separately owned shared-infrastructure repair?
7. What exact production-write prompt can be pre-authored without granting write authority?
8. What exact launch-closeout prompt verifies the post-write student/professor surface?
9. What exact final 009e validation rechecks the chain cold?
10. Which units can proceed now entirely in `computer_architecture`, and which must wait until Cleo/shared infrastructure is collision-free?

**009b verdict: ACCEPTED. Proceed to 009c planning.**
