# Prompt 009e — Validate Computer Architecture launch readiness

**Status:** WAITING ON REQUIRED 009_d_NN UNITS  
**Initiative:** 009  
**Owner:** Foreman  
**Mode:** cold independent validation and final initiative judgment

## Mission

Independently validate the entire Initiative-009 evidence chain from current repository/live truth rather than trusting the last worker's completion claim.

This is the final lifecycle stage. Foreman owns the verdict.

If a repairable defect is found, author the next unused `009_d_NN` unit, execute/accept that repair, and rerun 009e. Do not invent a later lifecycle letter.

## Read first

At minimum:

- `sidecar/prompts/009_architecture_launch_readiness_lifecycle.md`;
- accepted 009a report;
- accepted 009b map;
- accepted 009c plan;
- every executed d_NN report;
- current `README.md`, `sidecar/PLANNING.md`, `sidecar/prompts/README.md`;
- current `course_metadata.yaml`, grading/professional-pathway doctrine;
- current source-validator/compiler evidence;
- accepted production target/diff evidence;
- d_07/d_08 only if production write was authorized/executed.

Do not rely on chat memory for a missing receipt.

## Validation 1 — canonical source truth

Prove cold that:

- current main contains all required Architecture-local launch source;
- Weeks 2–4, 15, and 17 required packages are not stranded only on the old Savnac branch;
- A6/A7/course-evaluation source is present;
- newer professional-pathway/grading doctrine was preserved;
- the old launch branch is no longer an active runtime/source dependency;
- no hidden alternate checkout is required to compile the course.

## Validation 2 — repository navigation truth

Starting from root README, prove a cold worker can identify:

- what the course is;
- where current launch status lives;
- what is complete;
- what remains;
- which prompt is next/blocked/conditional;
- whether production has or has not been written.

Reject stale status that dispatches workers backward into accepted Prompts 005–008.

## Validation 3 — source/compiler truth

Recheck or independently inspect d_03 evidence sufficient to prove:

- exact current SHAs;
- full-semester compile from authoritative main;
- Weeks 1–17 represented;
- no undeclared omissions;
- 100% groups and accepted drop rules;
- dead-days behavior;
- exactly three Dossier checkpoints;
- final reflection/evaluation/pathway inclusion;
- source/file/link validity;
- no unresolved shared launch blocker.

## Validation 4 — Savnac evidence boundary

Confirm one of:

- d_04 proved `ZERO_OR_EQUIVALENT` and Prompt-006 fixed-point evidence is legitimately inherited; or
- d_05 produced a fresh accepted Savnac fixed point.

Do not claim current Savnac proof merely because Prompt 006 once passed on a different source branch.

## Validation 5 — production target/diff truth

Require accepted d_06 evidence proving:

- one exact Fall-2026 COMSC-3013 production Canvas target;
- target identity converges with section `COMSC-3013-1438` and live metadata;
- current desired-state source SHAs are locked;
- live inventory exists;
- semantic diff/destructive scope is understood;
- no unresolved source/shared defect blocks the write.

If this is true and no production write was authorized, a valid final initiative verdict is `GREEN TO WRITE`.

## Validation 6 — production reconcile truth, when applicable

If d_07 ran, independently verify its report contains:

- explicit production-write authorization provenance;
- fresh target/source preflight;
- bounded accepted delta;
- write counts;
- timeout/retry safety evidence if relevant;
- API read-back;
- no unexplained drift.

A missing explicit write gate is RED even if the resulting course happens to look correct.

## Validation 7 — launch closeout truth, when applicable

If d_07 ran, require d_08 `LAUNCH-CLOSED` evidence covering:

- course-level state;
- navigation/student-facing journey;
- grading/date mechanics;
- Week 14–17 boundary behavior;
- links/files/assets;
- duplicates/orphans/live ownership;
- student-view evidence or precisely bounded limitation.

A successful d_07 with missing d_08 is not final GREEN.

## Validation 8 — platform/support honesty

Confirm remaining platform yellows are accurately described and do not prevent the required no-extra-cost student path.

Do not require optional accelerator/hardware-zoo evidence for launch. Do not promote unexecuted WSL2/macOS/container claims to GREEN support merely for symmetry.

## Final verdicts

Return exactly one of the initiative-level verdicts:

### `GREEN — PRODUCTION DEPLOYED AND LAUNCH-CLOSED`

Requires accepted d_07 and d_08 plus all prior gates.

### `GREEN TO WRITE`

Source/current-main/compiler/Savnac/production-target/semantic-diff gates are all accepted, but the production write has intentionally not been authorized/executed.

### `YELLOW — LAUNCH USABLE WITH NAMED NON-BLOCKING LIMITS`

Only when required launch truth is otherwise complete and remaining limitations are truly non-blocking platform/evidence constraints. Never use YELLOW to hide target/source/write ambiguity.

### `RED — CONCRETE BLOCKER`

Name:

- exact failed contract;
- evidence;
- owning repository/surface;
- next unused `009_d_NN` responsibility or genuine human gate;
- which useful work remains unblocked.

## Final promotion

Only after the verdict is accepted should Foreman update current status/dispatch surfaces to the final Initiative-009 state.

Do not delete historical prompts/reports/launch branch as part of validation unless a separately bounded cleanup unit is justified and authorized.

## Required report

Write:

`sidecar/reports/009_e_validate_architecture_launch_readiness.md`

The report must be sufficient for a future cold-start session to know exactly what was proven, what was not, and whether Computer Architecture is deployed, merely ready to write, or blocked.

## Stop condition

Stop after the Foreman-owned final report and any bounded status promotion implied by the accepted verdict. Do not self-invent a new initiative to make the result look cleaner.
