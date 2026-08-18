# 009 d01 - Reconcile canonical Architecture launch source

**Status:** WORKER COMPLETE - AWAITING FOREMAN ACCEPTANCE
**Scope:** `jeremy-evert/computer_architecture` only
**Job branch:** `golem/009-d01-canonical-launch-source`

## Starting Git truth

- current `origin/main`: `f48e944c1a002e77a0c0c34db740480682d384f9`
- launch source `origin/savnac/architecture-launch-readiness`: `36c339feee3fdd8ebb077b55489289b6c28d136e`
- merge base: `adc9e81ac150427544875d43c0bd8366f967c205`
- divergence at resume: main-only **46**, launch-only **8**
- prior failed branch base: `c02ece22cfde7fd0e337c2451b6ed99f34dfec67`
- reconciliation source commit: `07d8634284b605fd15d4c475592c9063655138f2`

## Full launch-branch artifact classification

| Class | Path | Reason |
|---|---|---|
| RECONCILE | `assignments/A6-professional-pathway-artifacts.md` | required source reconciled to newer main professional-pathway doctrine |
| INTEGRATE | `assignments/A7-final-reflection.md` | launch-required course-local source/validator |
| INTEGRATE | `docs/course-evaluation.md` | launch-required course-local source/validator |
| SUPERSEDED | `planning/week-17.md` | newer main planning lineage owns status; d02 follows |
| INTEGRATE | `scripts/validate_savnac_launch_source.py` | launch-required course-local source/validator |
| HISTORICAL_ONLY | `sidecar/reports/006_savnac_ship_readiness.md` | receipt/orchestration provenance, not active compiler source |
| HISTORICAL_ONLY | `sidecar/runs/architecture_savnac_source_validation_20260817T011634Z.md` | receipt/orchestration provenance, not active compiler source |
| HISTORICAL_ONLY | `sidecar/runs/architecture_savnac_source_validation_20260817T013525Z.md` | receipt/orchestration provenance, not active compiler source |
| HISTORICAL_ONLY | `sidecar/runs/architecture_savnac_source_validation_20260817T013532Z.md` | receipt/orchestration provenance, not active compiler source |
| HISTORICAL_ONLY | `sidecar/runs/architecture_savnac_source_validation_20260817T024432Z.md` | receipt/orchestration provenance, not active compiler source |
| INTEGRATE | `weeks/week-02/README.md` | launch-required student-facing week source |
| INTEGRATE | `weeks/week-02/_instructor.md` | launch-required student-facing week source |
| INTEGRATE | `weeks/week-02/_validation.md` | launch-required student-facing week source |
| INTEGRATE | `weeks/week-02/friday.md` | launch-required student-facing week source |
| INTEGRATE | `weeks/week-02/monday.md` | launch-required student-facing week source |
| INTEGRATE | `weeks/week-02/monday.tex` | launch-required student-facing week source |
| INTEGRATE | `weeks/week-02/references.md` | launch-required student-facing week source |
| INTEGRATE | `weeks/week-02/wednesday.md` | launch-required student-facing week source |
| INTEGRATE | `weeks/week-03/README.md` | launch-required student-facing week source |
| INTEGRATE | `weeks/week-03/_instructor.md` | launch-required student-facing week source |
| INTEGRATE | `weeks/week-03/_validation.md` | launch-required student-facing week source |
| INTEGRATE | `weeks/week-03/friday.md` | launch-required student-facing week source |
| INTEGRATE | `weeks/week-03/monday.md` | launch-required student-facing week source |
| INTEGRATE | `weeks/week-03/monday.tex` | launch-required student-facing week source |
| INTEGRATE | `weeks/week-03/references.md` | launch-required student-facing week source |
| INTEGRATE | `weeks/week-03/wednesday.md` | launch-required student-facing week source |
| INTEGRATE | `weeks/week-04/README.md` | launch-required student-facing week source |
| INTEGRATE | `weeks/week-04/_instructor.md` | launch-required student-facing week source |
| INTEGRATE | `weeks/week-04/_validation.md` | launch-required student-facing week source |
| INTEGRATE | `weeks/week-04/friday.md` | launch-required student-facing week source |
| INTEGRATE | `weeks/week-04/monday.md` | launch-required student-facing week source |
| INTEGRATE | `weeks/week-04/references.md` | launch-required student-facing week source |
| INTEGRATE | `weeks/week-04/wednesday.md` | launch-required student-facing week source |
| SUPERSEDED | `weeks/week-07/references.md` | identical content already exists on current main |
| SUPERSEDED | `weeks/week-08/references.md` | identical content already exists on current main |
| SUPERSEDED | `weeks/week-10/references.md` | identical content already exists on current main |
| SUPERSEDED | `weeks/week-11/references.md` | identical content already exists on current main |
| INTEGRATE | `weeks/week-15/README.md` | launch-required student-facing week source |
| INTEGRATE | `weeks/week-15/_instructor.md` | launch-required student-facing week source |
| INTEGRATE | `weeks/week-15/_validation.md` | launch-required student-facing week source |
| INTEGRATE | `weeks/week-15/friday.md` | launch-required student-facing week source |
| INTEGRATE | `weeks/week-15/monday.md` | launch-required student-facing week source |
| INTEGRATE | `weeks/week-15/references.md` | launch-required student-facing week source |
| INTEGRATE | `weeks/week-15/wednesday.md` | launch-required student-facing week source |
| INTEGRATE | `weeks/week-17/README.md` | launch-required student-facing week source |
| INTEGRATE | `weeks/week-17/_instructor.md` | launch-required student-facing week source |
| INTEGRATE | `weeks/week-17/_validation.md` | launch-required student-facing week source |
| INTEGRATE | `weeks/week-17/references.md` | launch-required student-facing week source |

## Integrated

- `weeks/week-02/`
- `weeks/week-03/`
- `weeks/week-04/`
- `weeks/week-15/`
- `weeks/week-17/`
- `assignments/A7-final-reflection.md`
- `docs/course-evaluation.md`
- `scripts/validate_savnac_launch_source.py`

## Reconciled

`assignments/A6-professional-pathway-artifacts.md` was reconciled to current accepted `docs/professional-pathway.md`: Claim -> Evidence -> Gap -> Decision, explicit skill-gap/evidence-gap distinction, bring-work-forward doctrine, and the 5% + 5% Weeks 14-15 rhythm.

The first d01 attempt stopped safely at `git diff --check` on inherited trailing whitespace in three launch-branch Markdown lines. This resume preserved the bounded work, advanced the job branch to current main, normalized trailing blanks only inside d01-owned source, and reran the complete gate.

## Deliberately not integrated

- Current-main `docs/professional-pathway.md` and `docs/grading-model.md` remained unchanged.
- Week 07/08/10/11 reference files were verified equivalent between current main and launch source.
- Branch planning/status prose was not restored over newer main; d02 owns status reconciliation.
- Old prompts, reports, and raw runs remain historical provenance.
- Week 16 remained unchanged; no Checkpoint 4 or new graded Week 16 burden was introduced.
- No shared repository, Savnac course, or production Canvas course was mutated.

## Validation

- required local Week 02-17 directories: **present**
- A6 / A7 / course-evaluation / launch-source validator: **present**
- professional-pathway doctrine checks: **GREEN**
- Week 07/08/10/11 reference equivalence: **GREEN**
- current doctrine preservation: **GREEN**
- Week 16 preservation: **GREEN**
- `git diff --check`: **GREEN**
- `python3 scripts/validate_savnac_launch_source.py`: **- status: **GREEN WITH YELLOWS****
- validation receipt: `sidecar/runs/architecture_savnac_source_validation_20260818T053147Z.md`

## Remaining ambiguity

No known launch-required Architecture-local source remains stranded only on `savnac/architecture-launch-readiness`. Any compiler/shared-repository issue discovered later belongs to d03 and was intentionally not repaired here.

## Git note

The exact final branch HEAD cannot be embedded inside a report committed by that same HEAD. The runner prints the exact pushed HEAD; Foreman must verify the remote branch directly.

## Worker boundary

This worker does **not** self-certify or merge. Stop here for Foreman acceptance.
