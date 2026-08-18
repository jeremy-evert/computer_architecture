# Prompt 009b — Map the Computer Architecture launch-ready shape

**Status:** READY TO EXECUTE  
**Initiative charter:** `sidecar/prompts/009_architecture_launch_readiness_lifecycle.md`  
**Accepted evidence:** `sidecar/reports/009_a_report_architecture_launch_readiness.md`  
**Mode:** evidence-informed desired-shape mapping; no implementation and no LMS writes  
**Worksite:** `computer_architecture`

## Mission

Use accepted Report 009a to define the minimum desired relationships and acceptance surfaces for a safely launchable Computer Architecture course.

This is a map stage. Do not reconcile branches, edit stale navigation, repair Course Foundry, discover/write production Canvas, or author implementation prompts yet.

The map must respond to the evidence rather than the original assumption. In particular, it must treat the diverged `savnac/architecture-launch-readiness` branch as a real source-provenance seam that must be reconciled into current authoritative truth before production reconnaissance can be meaningful.

## Read first

- `sidecar/prompts/009_architecture_launch_readiness_lifecycle.md`
- `sidecar/reports/009_a_report_architecture_launch_readiness.md`
- `sidecar/README.md`
- `AGENTS.md`
- current `README.md`, `sidecar/PLANNING.md`, and `sidecar/prompts/README.md`
- `course_metadata.yaml`
- `docs/grading-model.md`
- `docs/professional-pathway.md`
- accepted Prompt-006 report
- compare evidence for `main...savnac/architecture-launch-readiness`
- CS1 Prompt/Report 102 only as a family launch-control comparison.

## Required map

Write:

`sidecar/reports/009_b_map_architecture_launch_ready_shape.md`

The map must define:

### 1. Canonical source topology

Map the desired relationship among:

- current `main`;
- the diverged Savnac launch branch;
- durable course source;
- sidecar process evidence;
- shared repositories;
- Course Foundry desired-state composition;
- Savnac;
- production SWOSU Canvas.

State which surface is authoritative for which truth and what happens when they disagree.

### 2. Launch-source completeness contract

Define the minimum source artifacts current `main` must contain or reference for the full-semester compiler to be considered valid, including early/closing weeks, pathway/final reflection/evaluation source, grading doctrine, shared-source contracts, and validation receipts.

Do not require duplicate local copies of shared curriculum.

### 3. Navigation/status topology

Define one cold-start path for “what is this course?” and one for “what remains to launch?” without creating competing status ledgers.

Map roles for at least:

- root `README.md`;
- `sidecar/README.md`;
- `sidecar/PLANNING.md`;
- `sidecar/prompts/README.md`;
- prompt/report pairs;
- durable `planning/` and `docs/` course doctrine.

### 4. Evidence promotion ladder

Map the states:

```text
AUTHORED → SOURCE-VALIDATED → COMPILED → SAVNAC-PROVEN → PRODUCTION-TARGET-LOCKED
→ GREEN-TO-WRITE → PRODUCTION-RECONCILED → LAUNCH-CLOSED
```

For each transition state:

- required evidence;
- owning surface/repository;
- who may perform the work;
- who accepts the evidence;
- what must not be inferred from an earlier state.

### 5. Savnac inheritance boundary

Define what Prompt 006's fixed-point evidence remains useful for after main-source reconciliation and what must be rerun because source identity changed.

### 6. Production reconnaissance map

Define an Architecture equivalent of CS1's 102 responsibility without copying CS1-specific content.

The map must include:

- exact target lock;
- source/repo SHAs;
- current dry run;
- semantic diff dimensions;
- destructive-scope analysis;
- launch gate verdict;
- no production write.

### 7. Production write and closeout separation

Map separate responsibilities for:

- production reconcile;
- post-write read-back/student-view/launch closeout.

A successful API write must not self-certify launch completion.

### 8. Shared-infrastructure ownership boundary

Map how Architecture reports shared defects while `course_foundry`, `harbor`, Brandy, and sibling shared content may have another active owner.

No Architecture worker may silently fork or patch shared machinery merely to make its own gate green.

### 9. Platform/support boundary

Distinguish required-path launch blockers from named physical/optional yellows, including current Linux proof versus WSL2/macOS/container/optional accelerator evidence.

### 10. Final validation shape

Define what `009_e_validate_architecture_launch_readiness.md` must be able to prove cold, and the allowed final verdicts.

### 11. Exact plan questions

End with the precise units/decisions the 009c plan must order. Do not write those implementation prompts in this stage.

## Acceptance criterion

009b is acceptable only if a fresh Foreman could use it to plan a route that:

- restores one authoritative launch source;
- does not discard newer main truth;
- does not mistake Savnac for production;
- does not guess production target identity;
- separates write from closeout;
- avoids mutable collision with shared infrastructure;
- preserves honest platform yellows without manufacturing blockers.

## Stop condition

Stop after the map report is durable and reviewed. Do not author 009c or any `d_NN` prompt in this stage.
