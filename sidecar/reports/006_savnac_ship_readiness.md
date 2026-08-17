# Computer Architecture Savnac ship-readiness report

**Date:** 2026-08-16  
**Status:** YELLOW - course core is substantially authored; deployment compiler and five lightweight semester shells remain

## Executive judgment

Computer Architecture is much closer to student release than the current Course Foundry Architecture compiler suggests.

The current `course_foundry/architecture_desired_course.py` is intentionally limited to the universal Week 1 package and authored Week 5. It explicitly omits the rest of the semester. That compiler state is now stale relative to this repository.

Current course-source reality:

- Week 1 is owned by the shared `semester_kickoff_week` package.
- Weeks 5-14 are authored student-facing week packages with executed validation and named, bounded platform/showcase YELLOWs rather than missing lesson content.
- Week 16 is a fully validated canonical Farkle + ML consumer on `main` with real Brandy CPU evidence and a compiled Monday deck.
- Weeks 2-4 have pinned learning contracts and already-built laboratory capability, but still need student-facing week shells.
- Week 15 is intentionally light/asynchronous and needs only a small curation/pathway shell.
- Week 17 is reflection/closure and needs a small evidence-backed final-reflection shell.
- The accepted grading model already maps to a 100% Canvas assignment-group structure.

## Deployment blocker classification

### Real blockers before a full-semester Savnac dry run

1. Author student-facing Architecture shells for Weeks 2-4.
2. Author the deliberately small Week 15 wind-down shell.
3. Author Week 17 final reflection/closure.
4. Add the Architecture-local professional-pathway Week 14/15 source wrapper.
5. Add the gradebook-only 2% course-evaluation source.
6. Expand the Course Foundry desired-state compiler from Week 1 + Week 5 to the real semester source.
7. Validate source existence, assignment groups, rubric/point mapping, holiday exceptions, and due-date mechanics.
8. Run a real Savnac **dry run** and inspect the diff before any live write.

### Named YELLOWs that do not block authoring into Savnac

The Week 5-14 validation receipts intentionally retain platform/showcase qualifications such as broader WSL/macOS proof, STF showcase inventory, optional GPU experiments, and complete authored-dossier release proof. These do not make the student-facing source placeholder and should not be confused with missing course content.

### Explicit non-blockers

- no required paid AI;
- no required GPU;
- no required private host;
- no Week 16 Checkpoint 4;
- no post-Week-14 technical dossier layer;
- optional hardware-zoo / accelerator experiments;
- optional instructor Stack Showcase enrichment.

## Source ownership target

The full deployment should compose four repositories rather than copying shared work into Architecture:

- `computer_architecture`: Architecture week pages, investigations, Explain/Defend receipts, checkpoints, pathway wrapper, final reflection, evaluation source;
- `semester_kickoff_week`: universal Week 1;
- `ai_fluency`: Monday Moment / AI Fluency assignments;
- `professional_minds`: Wednesday/Friday shared strand assignments and rubrics.

Course Foundry owns deployment composition. It does not become a second curriculum source.

## Launch sequence

1. Close the five Architecture-local source gaps on `savnac/architecture-launch-readiness`.
2. Build/validate decks and required lab commands for the newly authored early weeks where appropriate.
3. Create a dedicated Course Foundry branch from current `main`.
4. Expand the Architecture `DesiredCourse` compiler from the real source tree.
5. Replace broad deferred-week tests with full-semester source/weight/object tests.
6. Run local compiler tests.
7. Run a real Savnac dry run against course id 8 and retain the diff receipt.
8. Reconcile any existing Savnac objects rather than assuming the August 9 zero-object snapshot is still current.
9. Only after Jeremy explicitly authorizes the live write, use the guarded production command.

## Release doctrine

A Savnac loader is not allowed to make the course look more complete than the source. Conversely, stale deployment code is not allowed to hide authored course material.

The goal of this pass is therefore:

> **make the deployer tell the truth about the course we actually built.**
