# Question 003 - What is the Fall 2026 assessment and grading contract?

**Status:** STRUCTURE RESOLVED; ONE OPERATIONAL POLICY CLUSTER REMAINS BEFORE LIVE SAVNAC IMPRINT  
**Owner:** Jeremy  
**Durable source:** `docs/grading-model.md`

## Jeremy decision already made

Computer Architecture should **inherit the grading family from CS1** rather than inventing an unrelated assessment system.

Because Architecture is online/asynchronous, it does not fabricate live pair-programming, show-and-tell, peer-feedback, or attendance categories. That weight is redirected toward the work this course actually asks students to do: investigate, measure, reproduce, visualize, explain, and defend.

## Resolved grading weights

See `docs/grading-model.md` for the full contract.

Pinned high-level structure:

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
- any Week 16 participation/evidence surface must be ungraded or otherwise institutionally compliant.

This is no longer an open preference question for the deployment compiler.

## Resolved source-scheduling facts

Some deadlines come directly from owning shared source and may be compiled as written. Example: Professional Minds Wednesday reading assignments explicitly close Wednesday at 8:00 AM before the session.

Some sources specify a **day/date relationship without a clock**, such as Professional Minds slides assignments closing the following Monday. A compiler must not pretend the source itself said `23:59` unless an accepted operational convention supplies that clock time.

## The remaining Jeremy-level policy cluster

### 1. Drop-lowest policy

Architecture's grading model says to preserve the **spirit** of CS1's humane recurring-work policy but deliberately left the exact Canvas mechanics for this operational pass.

Accepted CS1 precedent is:

- drop lowest 1 in recurring weekly categories;
- do not drop one-time/milestone categories such as kickoff, checkpoints, professional pathway, final reflection, or course evaluation.

**Recommended Architecture adoption:**

Drop lowest 1 in each recurring graded category that has enough instances to make a drop meaningful:

- AI Fluency;
- Professional Minds Wednesday;
- Professional Minds Friday;
- Weekly Architecture / investigation work;
- Weekly Explain / Defend evidence receipt.

No drop for:

- Semester kickoff;
- Machine Dossier checkpoints;
- Final reflection;
- Professional pathway Week 14;
- Professional pathway Week 15;
- Course evaluation.

This recommendation is coherent with the stated "inherit the CS1 grading family" decision while avoiding an arbitrary partial inheritance.

### 2. Default due-time convention when source names the day but not the clock

Need one operational convention for assignments whose owning source says a due **day** but not a clock time.

**Recommended default:** end of that named day at **11:59 PM America/Chicago**, unless:

- the owning source specifies another time;
- institutional calendar policy requires an earlier close;
- the activity's pedagogy requires a pre-session deadline (for example the Professional Minds 8:00 AM reading close).

This makes `23:59` an explicit course-family operational convention rather than a compiler hallucination.

### 3. Late-work / revision window

Architecture's source currently has no accepted exact late/revision mechanics.

This can be resolved separately from the immediate Savnac dry run if the compiler leaves unsupported late/revision policy unset. It must be decided before production Canvas publication if Canvas needs mechanical enforcement.

A worker may not invent a late penalty or resubmission window merely to fill a setting.

## Recommended decision for Jeremy

Adopt now:

1. **Drop lowest 1** in the five recurring categories listed above; no drop in milestone/one-time categories.
2. **11:59 PM America/Chicago** as the default end-of-day due time only where source/policy names a due day but no clock, with explicit source/calendar exceptions taking precedence.
3. Keep late-work and revision/resubmission mechanics **unset for now** until a separate policy decision, rather than fabricating penalties/windows in Course Foundry.

If Jeremy accepts those three lines, Prompt 008 may encode them, add regression tests, and proceed to the no-write Savnac dry-run gate.

## Done condition

This question closes operationally when the remaining policy cluster above is decided and recorded, after which Course Foundry can implement/test it and Prompt 006 can verify the live Savnac gradebook behavior.
