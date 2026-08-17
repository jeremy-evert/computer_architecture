# Question 003 - What is the Fall 2026 assessment and grading contract?

**Status:** RESOLVED 2026-08-16  
**Owner:** Jeremy  
**Durable source:** `docs/grading-model.md`

## Jeremy decision

Computer Architecture inherits the grading family from CS1 rather than inventing an unrelated assessment system.

Because Architecture is online/asynchronous, it does not fabricate live pair-programming, show-and-tell, peer-feedback, or attendance categories. That weight is redirected toward the work this course actually asks students to do: investigate, measure, reproduce, visualize, explain, and defend.

## Resolved grading weights

See `docs/grading-model.md` for the full contract.

- Semester kickoff: 5%
- AI Fluency: 5%
- Professional Minds Wednesday: 5%
- Professional Minds Friday: 5%
- Weekly Architecture/investigation work: 30%
- Weekly Explain/Defend evidence receipt: 10%
- Machine Dossier checkpoints: 20%
- Final reflection: 8%
- Professional pathway Week 14: 5%
- Professional pathway Week 15: 5%
- Course evaluation: 2%

Total: 100%.

## Resolved checkpoint cadence

- Week 6 - Checkpoint 1, light first synthesis;
- Week 9 - Checkpoint 2, source-to-CPU integration;
- Week 14 - Checkpoint 3, final Machine Dossier + evidence-backed redesign;
- **no Week 16 Architecture checkpoint**.

Week 14 is the technical finale. Week 15 winds down asynchronously. Week 16 is shared Farkle + ML application/fun. Week 17 is reflection.

## Resolved assessment philosophy

The course rewards:

- inspect;
- measure;
- reproduce;
- visualize;
- explain;
- verify;
- revise;
- defend.

Raw tool output is not sufficient evidence of understanding.

Premium tools/hardware may never increase the attainable grading ceiling.

## Resolved Week 16 compliance boundary

The course-family grading work already verified the SWOSU Fall 2026 dead-days constraint: the three class days immediately before finals are Mon Nov. 30, Wed Dec. 2, and Fri Dec. 4.

For this M/W/F course, that is all of Week 16.

Therefore:

- Farkle + ML content remains available as the shared application/fun experience;
- Week 16 has no Machine Dossier checkpoint;
- recurring graded assignments may not be scheduled on those three dead days;
- any Week 16 participation/evidence surface is ungraded or otherwise institutionally compliant.

## Resolved drop-lowest policy

Jeremy's decision: **drop the lowest 1 in each genuinely recurring graded category**.

Apply `drop_lowest=1` to:

- AI Fluency;
- Professional Minds Wednesday;
- Professional Minds Friday;
- Weekly Architecture / investigation work;
- Weekly Explain / Defend evidence receipt.

Do not drop:

- Semester kickoff;
- Machine Dossier checkpoints;
- Final reflection;
- Professional pathway Week 14;
- Professional pathway Week 15;
- Course evaluation.

This is the Architecture adoption of the humane CS1-family recurring-work rule.

## Resolved due-time convention

Jeremy's decision: when owning source names a due **day** but not a clock time, the student gets the whole named day.

Operational default:

> **11:59 PM America/Chicago on the named due day.**

Precedence remains:

1. owning source with an explicit clock time wins;
2. institutional-calendar/dead-days constraints win;
3. otherwise a source-backed named due day closes at 11:59 PM Central.

Example: a Professional Minds reading that explicitly says Wednesday 8:00 AM remains due at 8:00 AM. A source that says "the following Monday" with no clock closes at 11:59 PM Monday.

## Resolved late-work policy ownership

Jeremy's decision: **late penalties are already documented and owned by Marker**.

Architecture must not invent a second late-penalty schedule in Course Foundry or Canvas configuration.

Implementation rule:

- resolve and use the authoritative Marker late-policy implementation/documentation from source;
- preserve the due/submission timestamps Marker needs to apply that policy;
- do not duplicate penalty arithmetic in the Architecture compiler;
- if deployment plumbing cannot carry the needed timestamps/policy context, that is a shared pipeline defect to repair, not a new course-policy question.

## Resolved resubmission policy

Jeremy's decision: **resubmission is always allowed, and the highest score is retained**.

Operational interpretation:

- do not create an Architecture-specific resubmission cutoff merely because an LMS field permits one;
- later attempts may be graded through the normal Marker/pipeline path;
- a later attempt must not reduce the student's recorded best score;
- writeback/reconciliation should preserve the maximum accepted score across attempts while still retaining attempt/feedback history.

If the existing shared grading pipeline does not already enforce highest-score retention, that is a shared-mechanism repair for the owning repository, not permission for Course Foundry to invent a separate implementation.

## Done condition

This question is closed. Course Foundry / Imprint / grading-pipeline implementation may now encode and test the decisions above. Workers should escalate only if source inspection reveals a genuine conflict with the existing Marker late-policy or highest-score machinery, not merely because mechanical work remains.
