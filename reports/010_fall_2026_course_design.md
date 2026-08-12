# Report 010 — Fall 2026 Computer Architecture design pass

## Evidence and result

This derived design reconciles `course_metadata.yaml`, the existing
`planning/fall-2026-spine.md`, and the durable manifest
`SWOSUCOMSC3013EvertFall2026/course_manifest.json` (160 entries; 11 chapters,
including RISC-V labs and appendices). It preserves the six-chapter, 17-week
sequence, online official modality, holiday handling, and systems-thinking
identity; it does not manufacture assignments, grades, dates, or policy.

`planning/zybooks-section-decisions.csv` has 160 data rows: **52 KEEP, 50
OPTIONAL, 58 UNUSED**. Required content is **32.5%** of the harvested menu.
Validation parsed the CSV, confirmed one unique row per manifest section,
confirmed only the three permitted labels, and recomputed these totals.

## Configuration and coverage findings

The core required path is selected chapter 1–6 material. Architecture-specific
examples, advanced implementation, historical/further-reading, self-study,
and exercises are generally optional; RISC-V labs and appendices are
optional/reference or unused pending local-tool decisions. A leaner vendor
configuration could therefore omit or make optional chapters 7–11 and the
advanced/reference tails of chapters 1–6. Ask ZyBooks: “What is the student
subscription price for a Fall 2026 configuration containing only the proposed
required core, with chapters 7–11 and advanced/reference sections optional or
removed, compared with the current configuration?” No savings are asserted.

ZyBooks alone does not teach the recurring Linux/WSL, filesystem/process,
vi/vim, Git, compiler/binary, GDB, container, or evidence-validation practice
this course needs. Those require instructor-created, runnable activities.

## Unresolved and validation

Open decisions are the supported environment/simulator, cumulative assessment
form, grading/due-date policy, accessibility of tools, and authored weekly
activities/rubrics. CSV validation was performed with a standard-library
reader against the durable manifest inventory; no licensed page body or
capture asset is committed.
