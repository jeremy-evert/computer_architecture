# COMSC-3013 Fall 2026 grading model

**Status:** grading structure accepted; Week 16 dead-days posture resolved; remaining due/late/drop/revision mechanics require the operational Canvas pass.

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

## Drop-lowest / revision direction

Architecture should preserve the **spirit** of CS1's humane recurring-work policy.

The operational Canvas pass must decide the exact mechanically supported form for:

- drop-lowest behavior on recurring weekly categories;
- resubmission/revision windows;
- due dates/times where owning source does not already specify them;
- late-work handling.

Those mechanics are not silently invented in this document.

The bounded recommendation and decision surface live in `sidecar/questions/003_assessment_and_grading_contract.md`.

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
- drop/due/late/revision mechanics are explicit, source/decision-backed, and tested.
