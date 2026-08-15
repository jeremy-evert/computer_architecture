# Computer Architecture — Fall 2026 17-Week Planning Spine

**Status: planning spine, not finished curriculum.** This document exists so
`course_foundry` prompt 045 (the shared landing-page/Week-at-a-Glance
system) has real semester structure to build against. Where daily content
has not been authored yet, that is marked `TBD` honestly — nothing below is
a stand-in for real lecture/lab/assignment content.

Calendar convention matches the one already used by CS1/CS2/DSCT
(`computer_science_1/planning/block-map.md`): real Fall 2026 dates,
Aug 17 – Dec 11, with the same holiday facts baked in — **Labor Day Mon
Sep 7** (no Monday, week 4), **Fall Break begins Wed Oct 14, 10 PM** (no
Friday, week 9), **Thanksgiving begins Tue Nov 24, 10 PM** (Monday only,
week 15), **Finals Dec 7–11** (week 17).

Working cadence for this course is Jeremy's planning MWF 2:00 PM rhythm
(`course_metadata.yaml`'s `instructional_working_cadence`) — the official
Banner record is online/asynchronous with no meeting time; see that file's
`official` block. Week dates below are Monday-of-week dates, matching the
CS1/CS2/DSCT convention, not literal MWF meeting instances.

Six-chapter backbone (`course_metadata.yaml`'s `textbook.main_chapters`),
Patterson/Hennessy *Computer Organization and Design (6e)*, MIPS interactive
zyBook (`EvertCOD(MIPS)Jul2021`):

1. Computer Abstractions and Technology
2. Instructions: Language of the Computer
3. Arithmetic for Computers
4. The Processor
5. Large and Fast: Exploiting Memory Hierarchy
6. Parallel Processors from Client to Cloud

## First-pass semester distribution

Chosen to give conceptual breathing room rather than race through six dense
chapters in six weeks — Ch. 2 (the ISA) and Ch. 4 (datapath/pipelining) are
each given three weeks as the heaviest material; a mid-semester review week
absorbs Fall Break's short Friday; Ch. 6 runs into Thanksgiving's short
week, which fits since parallelism/modern-architecture survey content
tolerates a lighter week better than core datapath design would.

| Week | Dates (Mon–Fri) | Theme / chapter | Status | Notes |
|---|---|---|---|---|
| 1 | Aug 17–21 | Orientation & kickoff — course rhythm, tools, hardware/software interface framing, zyBook setup | planned | Universal Week 1 pattern shared with CS1/CS2/DSCT (course logistics + "getting the most out of this class"); no chapter content yet. |
| 2 | Aug 24–28 | Ch. 1: Computer Abstractions and Technology (layers of abstraction, performance, energy efficiency) | placeholder | Daily content TBD. |
| 3 | Aug 31–Sep 4 | Ch. 1 continued (performance measurement, technology trends, the power wall) | placeholder | Daily content TBD. |
| 4 | Sep 8–11 (no Mon — Labor Day Sep 7) | Ch. 2: Instructions — introduction, MIPS operands, arithmetic operations | placeholder | Short week; content TBD. |
| 5 | Sep 14–18 | Ch. 2 continued — instruction representation, logical/branching operations | placeholder | Daily content TBD. |
| 6 | Sep 21–25 | Ch. 2 continued — procedures, addressing, MIPS instruction summary | placeholder | Daily content TBD. |
| 7 | Sep 28–Oct 2 | Ch. 3: Arithmetic for Computers — integer addition/subtraction/multiplication/division | placeholder | Daily content TBD. |
| 8 | Oct 5–9 | Ch. 3 continued — floating point, subword parallelism, arithmetic performance | placeholder | Daily content TBD. |
| 9 | Oct 12–14 (no Fri — Fall Break begins Wed 10 PM) | Review & integration: Ch. 1–3 checkpoint, hardware/software-interface through-line | placeholder | Short week; review/integration content TBD. |
| 10 | Oct 19–23 | Ch. 4: The Processor — datapath basics, single-cycle implementation | placeholder | Daily content TBD. |
| 11 | Oct 26–30 | Ch. 4 continued — control implementation, pipelining introduction | placeholder | Daily content TBD. |
| 12 | Nov 2–6 | Ch. 4 continued — pipelined datapath/control, hazards | placeholder | Daily content TBD. |
| 13 | Nov 9–13 | Ch. 5: Memory Hierarchy — memory technologies, cache basics | placeholder | Daily content TBD. |
| 14 | Nov 16–20 | Ch. 5 continued — cache performance, virtual memory | placeholder | Daily content TBD. |
| 15 | Nov 23 only (Thanksgiving begins Tue 10 PM) | Ch. 6: Parallel Processors — introduction, hardware multithreading | placeholder | Very short week (Monday only); light-touch survey content fits here. TBD. |
| 16 | Nov 30–Dec 4 | Ch. 6 continued — multicore, GPUs, clusters/warehouse-scale computers | placeholder | Daily content TBD. |
| 17 | Dec 7–11 | Review, integration, and finals | planned | Finals week; assignments/projects/labs structure not yet built — see gaps below. |

## Reasoning Odyssey continuity (doctrine note, not authored content)

Per `jeremy_task_tracking/prompts/126_cross_course_reasoning_odyssey_fabric.md`,
the Reasoning Odyssey is fabric, not a bolt-on: when weekly assignments/labs
are later authored for this course, they should give students the option to
carry a chosen persistent World Bible (a system, machine, project, or problem
space) through architecture work where it is pedagogically natural — e.g.
tracing instructions, datapath decisions, or memory-hierarchy tradeoffs for a
machine/system the student is already building continuity around — rather
than being decorative or forced every week. This does not create a second
assignment track or grade category; it shapes how the real disciplinary work
(ISA analysis, datapath/pipeline design, cache/memory reasoning, parallelism)
gets framed. No grading weight is implied here — the grading model is not yet
built (see below) — and no Week 1-17 assignment content is authored by this
note. This is a placeholder for whoever later authors this course's weekly
activities/rubrics, so continuity isn't retrofitted after the fact the way it
had to be for DSCT.

## Explicitly not yet decided (flag, don't fabricate)

- **Assignments/labs/projects:** no assignment, lab, or project structure
  has been authored for this course yet. `docs/` and `assignments/`
  directories are intentionally not created in this pass — Prompt 045 and
  later content-authoring prompts own that, per prompts/044's own scope
  boundary ("do not manufacture completed lectures/assignments simply to
  make the map green").
- **zyBook subsection granularity:** only the six top-level chapter titles
  from the supplied zyBook table of contents are used above. No subsection
  names are inferred — prompts/044 explicitly forbids guessing them without
  a legitimately readable source.
- **Grading model:** not built. CS1's `docs/grading-model.md` is the sibling
  pattern to follow later; nothing here should be read as implying weights
  or point values.
