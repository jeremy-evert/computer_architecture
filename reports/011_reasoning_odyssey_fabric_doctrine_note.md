# Report 011 — Reasoning Odyssey fabric doctrine note (Prompt 126 Computer Architecture slice)

## Why this is a doctrine note, not a reconciliation

CS1 (via `course_foundry` Prompt 015), CS2 (Prompt 005/008), and DSCT
(Prompt 013) each had an existing weekly-architecture chassis or live
content to reconcile the Reasoning Odyssey doctrine into. Computer
Architecture does not: `planning/fall-2026-spine.md` is explicitly a
placeholder spine ("Daily content TBD" on nearly every week), assignments/
labs/projects are explicitly not yet authored, and the grading model is
explicitly not built. There is no chassis document and no content to touch
without violating this repo's own "flag, don't fabricate" rule
(`planning/fall-2026-course-design.md`'s "Explicitly not yet decided"
section, `reports/010_fall_2026_course_design.md`'s "Unresolved" list).

## What changed

Added a short "Reasoning Odyssey continuity (doctrine note, not authored
content)" section to `planning/fall-2026-spine.md`, immediately before the
existing "Explicitly not yet decided" section. It:

- points at `jeremy_task_tracking/prompts/126_...md` as the source doctrine;
- states the World-Bible continuity pattern in architecture-specific terms
  (a system/machine/project a student traces ISA, datapath, memory, or
  parallelism decisions through);
- explicitly disclaims a second assignment track or grade category;
- explicitly disclaims any grading-weight implication, since the grading
  model does not exist yet;
- explicitly disclaims authoring any Week 1-17 content.

Nothing else in the repository was touched. No assignment, lab, project,
grading weight, or daily content was invented.

## Why now instead of waiting

Prompt 126 asks for all four Fall 2026 launch courses to carry this doctrine
into their authoritative planning source. Architecture is materially behind
CS1/CS2/DSCT, but the spine document already exists and already accepts
doctrine-level notes (see its own "Six-chapter backbone" and "First-pass
semester distribution" framing). Leaving the doctrine unstated here risked
the same problem DSCT had before Prompt 013: continuity being retrofitted
after content exists instead of shaping it from the start. A one-paragraph
doctrine pointer costs nothing and removes that risk; it authors no content.

## Explicitly not done

- No weekly-architecture chassis was invented (none exists; inventing one
  would be authoring course structure beyond this prompt's scope).
- No assignment/lab/project/grading content was authored.
- No ZyBooks/textbook decision was touched — Architecture's ZyBooks status
  remains Jeremy's separate open decision, untouched by this note.
- No other repository was modified.

## Verification

- Re-read `planning/fall-2026-spine.md` in full after editing to confirm the
  new section reads coherently and does not contradict the "Explicitly not
  yet decided" section immediately following it.
- Confirmed via `git diff` that only this one section was added; no other
  line in the file changed.
