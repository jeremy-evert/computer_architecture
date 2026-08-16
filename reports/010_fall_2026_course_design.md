# Report 010 — Fall 2026 Computer Architecture design pass

> **HISTORICAL / SUPERSEDED as of 2026-08-16.** This report records an earlier
> textbook/vendor-centered design pass and remains only as provenance. It is
> **not** current course doctrine. Do not use its zyBooks configuration or
> vendor-pricing recommendations to author Fall 2026 student work.
>
> Current source of truth: `README.md`, `course_metadata.yaml`,
> `planning/fall-2026-course-design.md`, `planning/fall-2026-spine.md`,
> `planning/block-map.md`, `planning/machine-dossier.md`, and
> `docs/grading-model.md`. The current course requires **no zyBooks or
> commercial textbook**, uses Weeks 5-14 as the complete Architecture technical
> runway, freezes the Machine Dossier in Week 14, and treats Week 16 as shared
> Farkle + ML application/fun rather than an Architecture capstone.

## Evidence and result

This derived design reconciled the then-current `course_metadata.yaml`, the
then-existing `planning/fall-2026-spine.md`, and the durable manifest
`SWOSUCOMSC3013EvertFall2026/course_manifest.json` (160 entries; 11 chapters,
including RISC-V labs and appendices). It preserved the six-chapter, 17-week
sequence, online official modality, holiday handling, and systems-thinking
identity; it did not manufacture assignments, grades, dates, or policy.

`planning/zybooks-section-decisions.csv` had 160 data rows: **52 KEEP, 50
OPTIONAL, 58 UNUSED**. Required content in that historical proposal was
**32.5%** of the harvested menu. Validation parsed the CSV, confirmed one
unique row per manifest section, confirmed only the three permitted labels,
and recomputed these totals.

## Historical configuration and coverage findings

At the time of this report, the proposed core path was selected chapter 1-6
material. Architecture-specific examples, advanced implementation,
historical/further-reading, self-study, and exercises were generally optional;
RISC-V labs and appendices were optional/reference or unused pending local-tool
decisions. The historical pass therefore suggested asking zyBooks for a leaner
vendor configuration and student price.

**That vendor recommendation is retired.** The current Fall 2026 course is
being authored as a complete open/free required path. Historical zyBooks and
Patterson/Hennessy material remain reference/provenance only.

One finding from this report remains useful: zyBooks alone did not teach the
recurring Linux/WSL, filesystem/process, vi/vim, Git, compiler/binary, GDB,
container, or evidence-validation practice this course needs. Current planning
has since turned that observation into the AI-lab/reproducibility/Linux runway,
Machine Dossier, sensory labs, and course-owned laboratory strategy.

## Historical unresolved state

At the time, open decisions included the supported environment/simulator,
cumulative assessment form, grading/due-date policy, accessibility of tools,
and authored weekly activities/rubrics.

Several of those have since been resolved structurally. See the current durable
sources rather than this report for present readiness and remaining YELLOWs.
