# COMSC-3013 Fall 2026 grading model

**Status:** this file describes the grading structure **as currently live in production Canvas** (course 75249) and as it was originally designed. Operational due/drop/resubmission policy accepted; Week 16 dead-days posture resolved; late penalties inherit the existing Marker policy.

**Superseded target (2026-08-25):** Decision 029 (`swosu_cs_curriculum/decisions/029_fall_2026_optional_computing_commons_pivot.md`) and the binding owner amendment `sidecar/prompts/030a_architecture_three_part_grading_and_consolidation.md` replace the below with a three-part **15% Weekly Canvas Engagement / 75% Architecture Reasoning Odyssey / 10% End-of-semester Architecture Reflection** doctrine and an approximately-17-object course shape. See `sidecar/reports/030_architecture_to_optional_commons_end_first_migration.md` for the full target design, the source-truth reconciliation already applied to `planning/`, and why **live production Canvas has not yet been renormalized to this target** (Prompt 030A's own impact-preview safety gate, plus a sandbox tooling gap on the deletion/consolidation side — both explained in that report). Everything below this line remains an accurate description of the **live course today**, not the target.

Computer Architecture inherits the recognizable **CS1 grading family** while adapting it to an online/asynchronous laboratory course.

The course does not have live paired-programming, show-and-tell, peer-feedback, or attendance periods. The weight those face-to-face behaviors occupy in CS1 is redirected toward Architecture's actual evidence: reproducible investigations, explanation/defense, and Machine Dossier checkpoints.

## Final category weights

| Category | Weight | Cadence / role |
|---|---:|---|
| Semester kickoff week | 5% | Week 1 universal success-foundations work |
| AI Fluency / Monday Moment | 5% | recurring through Week 15 where scheduled; Week 16 dead-days content is ungraded |
| Professional Minds - Wednesday strand | 5% | recurring where scheduled; Week 16 dead-days content is ungraded |
| Professional Minds - Friday strand | 5% | recurring where scheduled; Week 16 dead-days content is ungraded |
| Weekly Architecture / investigation work | 30% | recurring evidence labs, traces, controlled experiments, and early investigation/reproducibility work; no graded Week 16 instance |
| Weekly Explain / Defend evidence receipt | 10% | short individual evidence-backed interpretation; not raw output; no graded Week 16 instance |
| Machine Dossier checkpoints | 20% | **Weeks 6, 9, and 14**; larger synthesis using a full evidence/build rubric |
| Final reflection | 8% | Week 17; uses prior evidence, no new technical material |
| Professional pathway - Week 14 update | 5% | professional/career artifact update |
| Professional pathway - Week 15 submission | 5% | asynchronous completion/next-steps artifact |
| Course evaluation | 2% | end of term |
| **Total** | **100%** | |

## Why the technical core is larger than CS1

CS1 devotes meaningful grade weight to live paired-programming, show-and-tell, peer-feedback, and attendance/participation structures that fit an in-person introductory course.

Architecture has no live classroom.

Rather than fabricate online equivalents, the freed weight is placed into the work this course actually values:

- inspect;
- measure;
- reproduce;
- visualize;
- explain;
- verify;
- revise;
- defend a design judgment.

Weekly investigation (30%) + Explain/Defend receipts (10%) + Dossier checkpoints (20%) = **60% of the course grade**.

## Weekly investigation grain

The recurring lab grade asks whether the student carried out the bounded investigation and captured usable evidence.

Typical evidence may include:

- commands and relevant output;
- a trace;
- measurement CSV;
- a plot;
- simulator state;
- a reproducibility receipt;
- machine snapshot;
- controlled before/after experiment;
- source/assembly/binary evidence.

The grade is not for owning impressive hardware or expensive tooling.

## Explain / Defend grain

A separate short weekly receipt protects the course from becoming "run this script and upload a screenshot."

The student should state:

1. the bounded claim/question;
2. the evidence that matters;
3. the architecture mechanism that explains it;
4. what they would revise/correct after seeing the evidence.

When AI helped, the student distinguishes the model/tool suggestion from independent verification evidence.

## Machine Dossier checkpoints

The checkpoint rhythm intentionally inherits the CS1 family cadence:

### Week 6 - Checkpoint 1

A light first checkpoint.

Follow one value/operation across several layers such as:

**software meaning -> representation -> RISC-V instruction -> machine-visible state**

The point is to rehearse the checkpoint mechanics.

### Week 9 - Checkpoint 2

Full integration checkpoint.

Follow one bounded program through the stack using evidence from Weeks 5-8.

### Week 14 - Checkpoint 3

Final Architecture synthesis.

Return to the Week 5 machine design, use the accumulated Machine Dossier/Sensitivity Profile, and defend changed or retained architecture choices.

**The Machine Dossier freezes here.**

There is **no Week 16 Architecture checkpoint**.

## Checkpoint rubric axes

Adapt the useful CS1 Full Build axes to Architecture:

| Axis | Architecture interpretation |
|---|---|
| **Functions / Runs** | Does the claimed experiment/trace/build actually run or follow coherently? |
| **Concept use** | Does the target architecture mechanism genuinely explain the evidence? |
| **Explanation** | Can the student explain what changed and why in their own words? |
| **Demonstrability / Reproducibility** | Could another person follow the receipt and inspect/reproduce the evidence? |

For design-comparison checkpoints, an additional expectation is that the student names a real tradeoff rather than simply praising the chosen option.

## Week 15-17 grading posture

- **Week 15:** wind-down/catch-up/professional-pathway submission. No new Architecture mechanism or dossier layer.
- **Week 16:** shared Farkle + ML experience during the Fall 2026 dead-days window. The lesson/content/experiment remain available, but recurring Week 16 AI Fluency, Professional Minds, Architecture Investigation, and Explain/Defend work is **ungraded**. There is no Checkpoint 4.
- **Week 17:** final reflection. The student uses existing dossier/lab evidence to explain what they understand now that they could not explain earlier.

## Paid tools and hardware

A student using only the required free/accessible path must be able to earn the same grade as a student using:

- ChatGPT Plus/Pro;
- Claude Pro/Max;
- Codex;
- Claude Code;
- Copilot;
- Gemini/Grok premium tiers;
- aider/OpenClaw with optional services;
- a personal GPU/accelerator;
- Jeremy's private systems.

Premium tools may improve convenience. They do not create additional grading ceiling.

## Drop-lowest policy - RESOLVED

Drop the lowest 1 in each genuinely recurring graded category:

- AI Fluency / Monday Moment;
- Professional Minds Wednesday;
- Professional Minds Friday;
- Weekly Architecture / investigation work;
- Weekly Explain / Defend evidence receipt.

Do **not** drop any of these one-time/milestone categories:

- Semester kickoff;
- Machine Dossier checkpoints;
- Final reflection;
- Professional pathway Week 14;
- Professional pathway Week 15;
- Course evaluation.

This is the Architecture form of the humane CS1-family recurring-work policy.

## Due-time convention - RESOLVED

When the owning source names a due **day** but not an exact clock time, students get the entire named day.

Default:

> **11:59 PM America/Chicago on the named due day.**

Precedence:

1. a source-explicit clock time wins;
2. institutional calendar/dead-days rules win;
3. otherwise a source-backed named due day closes at 11:59 PM Central.

A Professional Minds reading explicitly due at 8:00 AM stays due at 8:00 AM. A source saying "the following Monday" without a clock closes at 11:59 PM Monday.

## Late-work policy - RESOLVED OWNER

Late penalties are already documented and owned by **Marker**.

Architecture does not define a second late-penalty schedule in Course Foundry or Canvas configuration. The deployment/grading pipeline must preserve the due/submission timestamps and other context the existing Marker late-policy needs.

If the shared plumbing cannot carry or apply that existing policy correctly, fix the shared owner rather than inventing course-local penalty arithmetic.

## Resubmission policy - RESOLVED

Resubmission is **always allowed**, subject only to the system continuing to accept the submission, and the **highest accepted score is retained**.

A later attempt may generate new feedback and a new policy-adjusted score, but it must not lower the student's recorded best score. The grading/writeback pipeline should preserve attempt history while using the maximum accepted score for the gradebook.

Do not add an Architecture-specific resubmission cutoff merely because Canvas exposes an `available_until`-style mechanism.

## Week 16 dead-days/calendar decision - RESOLVED

The course-family grading closeout already verified the SWOSU Semester Exam Policies against the official Fall 2026 calendar: the three class days immediately before finals are **Mon Nov. 30, Wed Dec. 2, and Fri Dec. 4**.

For COMSC-3013's M/W/F grammar, those are the three Week 16 class days.

Therefore the deployment contract is:

- Week 16 Farkle + ML learning content remains available;
- no recurring graded AI Fluency, Professional Minds, Architecture Investigation, or Explain/Defend object is scheduled in Week 16;
- no Week 16 Machine Dossier checkpoint exists;
- optional Stack Showcase/hardware enrichment never creates points;
- Course Foundry must carry a regression test proving those constraints before Savnac release.

This is an institutional-calendar compliance decision, not a convenience preference.

## Done when operationalized

The implementation pass must map these categories to Canvas assignment groups and verify:

- weights sum to 100%;
- every graded object lands in the intended group;
- Week 1 work is not stranded in a 0% group;
- Week 17 final reflection has a real object/group mapping;
- no Week 16 checkpoint exists;
- no prohibited recurring graded Week 16 object exists;
- no premium-resource path changes attainable points;
- recurring group drops match the policy above;
- due times have explicit source/policy provenance;
- the shared Marker late policy is used rather than duplicated;
- resubmission remains open and highest-score retention is tested end to end.
