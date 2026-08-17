# World Bible continuity across the CS sequence

**Status:** accepted continuity doctrine for planning; course-specific implementation remains owned by each course.

## Decision

The **World Bible should survive the curriculum sequence** because it gives students a stable personal context in which new technical ideas can accumulate meaning.

The World Bible is not one giant cross-course programming project and it must not become a prerequisite that disadvantages transfer students or students entering the sequence later.

The continuity rule is:

> **Keep the world. Change the lens.**

A student may carry forward the same Frontier Settlement, Investigation Bureau, Starship Log, Small Business, or another approved bounded world/context. Each course asks a different question of that world and owns its own graded technical evidence.

## Course-by-course role

| Course | World Bible question | Course-owned technical artifact |
|---|---|---|
| CS1 | **What is my world, and can I make a computer solve useful problems inside it?** | Reasoning Odyssey code + World Bible / Judgment Log |
| CS2 | **How should the software inside my world be designed so it remains trustworthy as it grows?** | CS2-native codebase, contracts/tests/design evidence + World Bible |
| DSCT | **What structures, assumptions, rules, and claims exist in my world, and what am I justified in concluding?** | reasoning artifacts / proofs / discrete-structure evidence; World Bible becomes a reasoning ledger |
| Computer Architecture | **What does my world ask the machine to do, and what machine constraints does that workload actually care about?** | Machine Dossier + Sensitivity Profile; World Bible supplies workload context |

## Computer Architecture boundary

Computer Architecture does **not** require students to continue the same CS1/CS2 codebase.

The prior world is useful because it supplies an authentic workload story:

- an Investigation Bureau may care about search, text, indexing, dependent lookups, and persistence;
- a Frontier Settlement may care about simulation updates, collections of entities, event processing, and responsiveness;
- a Starship Log may care about telemetry, streaming data, visualization, reliability, and event handling;
- a Small Business may care about transactions, inventory, reporting, storage, and latency.

The Architecture question is not "how do I add another feature to my old project?"

It is:

> **Given a workload I understand and care about, what machine resources matter, how do I measure them, and what tradeoffs would I choose?**

The existing Machine Dossier remains the canonical Architecture longitudinal artifact. Do not create a second parallel semester notebook merely to preserve the World Bible name.

Recommended Architecture use:

1. Week 5: name or choose a workload/world context when creating Dossier v0.
2. Weeks 8/10/12/13: when appropriate, translate measured machine behavior back into that workload context.
3. Week 14: defend the rebuilt machine for the declared workload, including which earlier assumptions about the workload survived or changed.
4. Week 17: reflection may connect the World Bible lineage to the frozen Machine Dossier as evidence of changing judgment across the curriculum.

## Equity / entry rule

Prior participation in CS1/CS2 is never required to understand the Architecture course.

A student who arrives without an existing World Bible may:

- choose one of the familiar bounded worlds;
- use a course-provided workload scenario; or
- declare another small workload context with instructor approval.

No student receives extra grading ceiling for having a richer inherited world or codebase.

## Why preserve the idea

The World Bible gives personalization without turning every week into an unrelated themed worksheet.

Across the sequence, the student can watch the same context become:

**problem -> program -> software design -> reasoning model -> workload -> machine decision**

That continuity lets later courses ask deeper questions without requiring students to abandon the intellectual world they have already invested in.
