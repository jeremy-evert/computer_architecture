# Question 001 — Does Computer Architecture keep its zyBook?

**Status:** OPEN
**Blocks:** weekly chassis finalization (Monday technical content format),
grading-model authoring, and Week 2+ content authoring.

## Context

CS1, CS2, and DSCT each received an explicit "drop ZyBooks, no required
textbook" pass this cycle (`computer_science_1` prompt, `computer_science_2`
sidecar Prompt 006, `discrete_structures_and_critical_thinking` prompt 012).
Each reframed its zyBook identifier/URL as historical/optional provenance
rather than a live requirement, and none currently treats zyBook content as
required student work.

Computer Architecture was explicitly excluded from that pass. Jeremy's own
words (live chat, this session, 2026-08-15): "we are not going to use
zybooks for cs 1, cs 2, or dcst" — Architecture named as the one exception,
"still his open decision."

`course_metadata.yaml`'s `textbook` block currently lists the MIPS
interactive zyBook (`SWOSUCOMSC3013EvertFall2026`) as the live, current
identifier — not historical — the only one of the four Fall 2026 courses
still in this state.

## Why this matters for sequencing

Architecture's weekly chassis, Monday technical-content shape, and grading
model cannot be finalized honestly without knowing:

- whether zyBook readings/interactive activities are required, graded
  student work (and therefore need a weekly-cadence slot and a grading
  category), or
- whether Architecture follows the other three courses and drops the
  requirement, with technical content authored directly the way CS1/CS2/
  DSCT's weekly material is (open-source-backed, source-controlled in this
  repo).

This is plausibly different from the other three courses on its merits —
a hardware-architecture course's interactive MIPS simulators/exercises may
carry real pedagogical value the other three courses' zyBooks didn't — so
this should not be defaulted to "drop it" merely for four-course
consistency. It is a genuine open decision, not a mechanical parity gap.

## What Foreman needs to proceed

A yes/no (plus, if yes, how required/graded) on: does COMSC-3013 keep its
zyBook as required course material for Fall 2026?

Work that does NOT depend on this answer (already queued, in progress,
or safe to start now): the weekly chassis/spine's non-content-source
structure (day pattern, Reasoning Odyssey continuity framing, the added
"Linux command line for profiling" early week Jeremy specified this
session), Savnac course-identity/deployment plumbing groundwork.

Work that DOES depend on this answer: Monday technical-content authoring
format, the grading-model's category list (a zyBook-graded category may or
may not exist), and `course_metadata.yaml`'s textbook block's final framing.
