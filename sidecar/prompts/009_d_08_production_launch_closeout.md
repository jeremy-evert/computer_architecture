# Prompt 009d08 — Close out Computer Architecture production launch

**Status:** WAITING ON 009_d_07 GREEN  
**Initiative:** 009  
**Mode:** independent post-write production validation; read-only by default

## Mission

Independently inspect the production Computer Architecture course after d_07 and determine whether the delivered student/professor experience is actually launch-ready.

Do not treat the d_07 API write receipt as proof that the course is usable. This prompt changes focus from **reconcile machinery** to **human-facing delivery surface**.

## Preflight

Read:

- accepted d_06 target/diff report;
- accepted d_07 production reconcile report;
- current authoritative Architecture source/doctrine;
- current course metadata/grading model;
- Week 1, Week 14–17 boundary doctrine.

Reconfirm the exact production target before inspection.

## Required closeout checks

### Course-level state

- exact course identity;
- intended availability/publish posture;
- term/dates;
- instructor role;
- no accidental changes to unrelated course settings.

### Navigation and module journey

Inspect a representative human journey, including:

1. course entry / first visible module;
2. Week 1 shared kickoff flow;
3. transition into Week 2 Architecture investigator runway;
4. one early technical week;
5. one mid/late technical week;
6. Week 14 technical finale / Dossier freeze;
7. Week 15 wind-down/professional pathway;
8. Week 16 shared Farkle + ML dead-days/ungraded posture;
9. Week 17 final reflection/evaluation closure.

Verify module ordering, page/item sequencing, titles, and obvious student-facing dead ends.

### Grading mechanics

Read back:

- assignment-group weights = 100%;
- drop-lowest rules only on accepted recurring groups;
- exactly three Machine Dossier checkpoints;
- A6 Week 14/15 roles;
- A7 final reflection;
- course evaluation;
- Week 16 recurring work not graded on dead days;
- representative due dates and holiday/finals exceptions.

### Links / files / rendering

Inspect representative rendered pages and all known-risk boundaries:

- no unresolved `{{link:...}}` tokens;
- no broken kickoff cross-reference residue;
- expected files/assets resolve;
- no obvious permanent-diff normalization artifact;
- no duplicate modules/items or orphaned content from prior partial loads.

### Student/professor view

Where Canvas capabilities and enrollment permit, inspect student view or an equivalent safe read-only perspective.

Do not fabricate a student submission if no safe synthetic/test enrollment path exists. Name the limitation precisely.

### Live-vs-Git ownership

Identify any remaining production object not represented by current desired/source truth and classify it as:

- intentional platform/default object;
- intentional instructor-owned live state;
- stale/unexpected object requiring a future repair;
- harmless historical artifact.

Do not delete it in this prompt without a separately explicit correction gate.

## Corrections boundary

Default authority is read-only validation.

If a tiny production correction is obvious, do not silently perform it. Record the defect and return it to Foreman, who may author the next unused `009_d_NN` correction prompt with exact authority, then rerun d_08.

## Required report

Write:

`sidecar/reports/009_d_08_production_launch_closeout.md`

Include:

- target identity;
- course-level state;
- navigation journey results;
- grading/date table;
- link/file/render checks;
- duplicate/orphan/live-ownership findings;
- student-view evidence or exact limitation;
- defects requiring repair;
- final closeout verdict.

No student PII, tokens, or credentials may enter evidence.

## Verdict

Return:

- `LAUNCH-CLOSED` — no launch-blocking defect found; or
- `RED` — exact defect and evidence required for the next repair unit.

Named platform/support yellows may remain if they do not prevent the required student path.

## Acceptance criterion

A fresh Foreman can rely on this report to judge the production course as a delivery experience rather than merely an API object graph.

## Stop condition

Stop after independent closeout evidence. Do not perform final Initiative-009 promotion yourself; 009e belongs to Foreman.
