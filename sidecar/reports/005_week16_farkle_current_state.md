# Computer Architecture Week 16 Farkle + ML current-state report

**Date:** 2026-08-16  
**Status:** READY TO BUILD FROM CANONICAL SHARED CORE

## Current state

Computer Architecture Week 16 is intentionally planning-first. The course has a pinned Week 16 identity and a deliberately bounded Prompt 005, but no course-specific Farkle computational implementation or validation surface currently exists.

The live Week 16 question is:

> **What does it cost a machine to make a better Farkle decision, and when is that extra cost actually worth paying?**

The former heavy Architecture-capstone framing is retired. Week 14 remains the technical finale, Week 15 is asynchronous wind-down, Week 16 is a joyful shared application, and Week 17 is reflection.

## What already exists and should be preserved

- `planning/week-16.md` pins the cost-versus-effectiveness framing.
- `sidecar/prompts/005_build_farkle_ml_architecture_capstone.md` remains a useful bounded work order despite its historical filename.
- The course already has a week-folder authoring pattern under `weeks/`.
- The canonical shared Farkle computational machine now exists in `jeremy-evert/Farkle_and_Machine_Learning` and is already validated by DSCT, CS1, and CS2 consumers.

## What does not exist yet

- no `weeks/week-16/` student package;
- no Architecture-specific Farkle runner;
- no generated canonical `farkle_ml` snapshot in this repository;
- no Architecture Week 16 tests;
- no one-command Architecture Week 16 validator;
- no real runtime receipt.

Because there is no legacy Architecture Farkle implementation, this is a **consumer build**, not a migration. There is no old computational behavior to preserve and no course-local Farkle engine to retire.

## Correct ownership boundary

```text
jeremy-evert/Farkle_and_Machine_Learning
        canonical computational truth
                  |
                  v
     generated provenance-pinned snapshot
                  |
                  v
      Architecture Week 16 measurement lens
                  |
                  v
 effectiveness / preparation / operation / host context
                  |
                  v
       short architectural judgment
```

The shared repository owns rules, strategies, learning, simulation, and common experiment evidence. Computer Architecture owns only the disciplinary interpretation of computational cost and execution context.

## Required student path

A normal student should be able to complete Week 16 on an ordinary CPU with free/open tooling. The required path should ask the student to:

1. choose two fixed strategy/effort configurations;
2. make a light prediction;
3. run a bounded benchmark on one accessible execution lane;
4. inspect effectiveness and cost evidence;
5. make one short architectural judgment.

Optional instructor-controlled hardware lanes may enrich the comparison, but hardware wealth must not change the grading ceiling.

## Explicit scope fence

Do not build:

- a second Farkle engine;
- a new Architecture checkpoint;
- Machine Dossier expansion;
- a required GPU path;
- a Kubernetes tournament platform;
- a persistent leaderboard service;
- a profiling-heavy capstone;
- a new ML theory unit.

## Recommended next build

1. create an isolated Week 16 branch/worktree from current `main`;
2. synchronize the canonical `farkle_ml` package into a dedicated generated path;
3. build a thin Architecture runner that records host/execution context alongside the shared experiment evidence;
4. preserve separate cost currencies instead of inventing one universal score;
5. build a standard-library validation suite and one-command receipt generator;
6. author the Week 16 student/instructor surfaces around the validated runner;
7. validate on Brandy CPU first;
8. treat any later multi-hardware comparison as optional enrichment rather than a release blocker.

## Release criterion

Week 16 becomes GREEN when a real checkout proves:

- shared provenance/hashes are valid;
- the Architecture runner uses the canonical package;
- the fixed bounded benchmark completes on CPU;
- result receipts preserve effectiveness and cost evidence plus execution context;
- tests/validator pass;
- the student path remains small and hardware-equitable.
