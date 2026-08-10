# Computer Architecture

Course repo for **COMSC-3013 — Computer Architecture**, Dr. Jeremy P. Evert's
Fall 2026 section (`COMSC-3013-1438`). This is a new, dedicated course
repository — the fourth in Jeremy's Fall 2026 teaching load alongside
`computer_science_1`, `computer_science_2`, and
`discrete_structures_and_critical_thinking` — created by `course_foundry`
prompt 044 (2026-08-09) to onboard Computer Architecture into the same
Course Foundry / Savnac ecosystem as the other three courses.

Git is the source of truth; Canvas/Savnac is the checkpoint the tracked
source pushes to, never the other way around.

## Repository map

| Path | Purpose |
| --- | --- |
| [`course_metadata.yaml`](course_metadata.yaml) | The durable, git-tracked source of truth for this course's official catalog/section facts, Jeremy's MWF 2:00 PM working cadence, and the primary zyBook/textbook. Everything Canvas-facing (e.g. the Course Information page) is generated from this file. |
| [`planning/fall-2026-spine.md`](planning/fall-2026-spine.md) | The 17-week Fall 2026 planning spine — a first-pass semester distribution across the six-chapter textbook backbone, honestly marked `planned`/`placeholder` where daily content isn't authored yet. |
| `docs/` | Reserved for durable course documentation (grading model, ethos, etc.) once authored — empty as of this repo's creation. |
| `prompts/` | Curriculum-development prompts for this course, following the same `prompts/NNN_slug.md` ↔ `reports/NNN_slug.md` contract used in `computer_science_1`. |
| `reports/` | Completed-work reports for this course's own development, distinct from `course_foundry/reports/` (which owns onboarding/infrastructure reports like the one that created this repo). |

## Official vs. working cadence — read this before editing anything schedule-related

The Fall 2026 section is officially **online/asynchronous** (no Banner
meeting time). Jeremy designs and manages it as if it were a **Monday /
Wednesday / Friday 2:00 PM** course for planning discipline. Both facts are
real and both are tracked separately in `course_metadata.yaml`
(`official` vs. `instructional_working_cadence`) — never merge them, and
never let a generator present the working cadence as an official Banner
meeting time.

## Textbook

*Computer Organization and Design (6e) — Interactive Version (MIPS)*,
Patterson & Hennessy, zyBook `EvertCOD(MIPS)Jul2021`. Six main chapters are
interactive in the zyBook; see `course_metadata.yaml`'s `textbook` block for
the full chapter list and appendices.

## What this repo does not yet contain

No assignments, labs, quizzes, or a grading model exist here yet — this
repo was created to establish the course correctly (real metadata, a real
Savnac course, a real 17-week spine) before Prompt 045 builds the shared
four-course landing-page system on top of it. See
`course_foundry/reports/2026-08-09_computer_architecture_fall_2026_onboarding.md`
for the full onboarding report and known gaps.
