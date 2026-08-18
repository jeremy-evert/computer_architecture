# Prompt 009d07 — Reconcile Computer Architecture to production Canvas

**Status:** HUMAN GATE / WAITING ON 009_d_06 `GREEN TO WRITE`  
**Initiative:** 009  
**Mode:** bounded production write **only after explicit execution-time authorization**  
**Target:** exact production course locked by accepted d_06 report; do not hard-code or guess it here

## Mission

Apply the exact current desired state accepted by d_06 to the exact production Canvas course locked by d_06, using established Course Foundry / Imprint machinery and a pre-understood semantic delta.

This prompt being present in Git is **not** production-write authorization.

## Hard preconditions

Do not make any production mutation unless all are true at execution time:

1. d_06 is accepted with verdict `GREEN TO WRITE`;
2. the d_06 report names one exact target course id and bounded semantic diff;
3. no later repair unit remains unresolved;
4. shared deployment infrastructure ownership/collision is clear;
5. Jeremy or another explicit authorized human has approved this production write **after seeing the target/diff**;
6. the execution seat has legitimate production Canvas credentials;
7. no unexpected source/live drift appears in the immediate pre-write freshness check.

If any precondition fails, stop before mutation.

## Immediate freshness gate

Immediately before the write, re-read/reassert:

- target course identity/name/code/section/term;
- Jeremy's active teacher role;
- course workflow/publish state;
- enrollment/submission state relevant to safety;
- current live object/group inventory summary;
- exact Architecture/Course Foundry/shared source SHAs;
- current desired-state compile;
- create/update/delete/prune delta.

Compare to accepted d_06 evidence.

Any unexplained drift returns to read-only reconnaissance. Do not improvise through it.

## Write boundary

Use the existing, accepted generic deployment/reconcile path. Do not write a new Architecture-specific loader.

Allowed only after the hard gate:

- reconcile the accepted desired state to the one locked production course;
- perform only the understood create/update/delete operations;
- update accepted assignment-group rules/dates/content required by desired state;
- read back the course after the write.

Forbidden:

- creating a replacement course because target reconciliation is inconvenient;
- writing any other course;
- touching Savnac in the same focus;
- mutating Course Foundry/Harbor/shared curriculum during the production write;
- broad cleanup of live objects outside accepted ownership;
- unexplained prune/delete;
- forceful retry through API errors without first establishing resulting live state;
- changing course-level publish/availability state unless d_06/d_07 authorization explicitly includes it.

## In-flight safety

If a command/API call times out or partially fails:

1. stop new mutation;
2. inventory live production state read-only;
3. determine whether the reconcile mechanism is idempotent for the partial result;
4. resume only if the remaining delta is still the accepted desired delta and no duplicate/destructive ambiguity exists.

Never assume timeout means “nothing happened.”

## Required read-back

After the write, verify at API level:

- expected modules/objects exist;
- expected stale owned objects were updated/removed only where authorized;
- assignment groups/weights/drop rules match;
- due/dead-day mechanics match;
- no unexpected duplicate/orphan state was created;
- write counts and remaining dry-run/diff are recorded.

A no-op second diff is desirable evidence but d_08 remains responsible for independent student/professor-facing closeout.

## Required report

Write:

`sidecar/reports/009_d_07_reconcile_production_canvas.md`

Include:

- explicit authorization provenance/date for the production write;
- exact target id/identity;
- exact source SHAs;
- pre-write freshness result;
- accepted delta;
- command/path used;
- create/update/unchanged/delete results;
- timeout/retry events if any;
- API read-back results;
- any remaining delta;
- explicit statement that d_07 does **not** self-certify launch closeout.

Do not place tokens, student PII, or secrets in the report.

## Acceptance criterion

GREEN means the bounded production reconcile completed against the exact authorized target with no unexplained drift and API read-back matches the accepted desired state.

GREEN here means `PRODUCTION-RECONCILED`, not `LAUNCH-CLOSED`.

## Stop condition

Stop after the production write/read-back report. Do not perform d_08 student-view closeout in the same focus.
