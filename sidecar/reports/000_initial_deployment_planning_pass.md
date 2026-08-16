# Sidecar Report 000 — Initial Computer Architecture deployment planning pass

**Date:** 2026-08-16  
**Status:** COMPLETE  
**Actor:** ChatGPT direct planning pass with Jeremy-authorized GitHub writes  
**Target:** `jeremy-evert/computer_architecture` `main`

## Mission completed

Inspect the young Computer Architecture repository, recover relevant prior course-development decisions, benchmark the architecture core against strong external curricula/references, and establish a concrete deployment plan with bounded Foreman work and genuine Jeremy questions separated cleanly.

## Starting state

The repository already had useful foundations:

- official course metadata and online/asynchronous vs M/W/F working-cadence distinction;
- current Fall 2026 MIPS zyBooks operational metadata;
- a 17-week planning spine;
- a course-design document;
- a sidecar workbench convention;
- a newly opened question about whether Architecture should keep zyBooks.

The main weakness was that the semester was still organized largely as a six-chapter textbook distribution, while the student laboratory, Week 1–4 onboarding, capstone, grading contract, and deployment path were not yet sufficiently shaped.

## Prior decisions recovered and applied

Relevant earlier Architecture work established:

- Jeremy wants Computer Architecture to **stay with zyBooks**;
- MIPS itself is not important enough to preserve merely for continuity;
- newer ARM/RISC-V Patterson/Hennessy/zyBooks paths had been explored, with RISC-V emerging as the leading pedagogical direction rather than an adopted vendor fact;
- Week 1 should follow Jeremy's universal cross-course human orientation rather than start technical Architecture content.

The old binary keep/drop-zyBooks question was therefore resolved rather than making Jeremy answer it again.

## External curriculum evidence used

The planning pass consulted current/open architecture teaching and primary-reference material including:

- UC Berkeley CS61C, Spring/Summer 2026;
- Cornell CS3410, Spring 2026;
- MIT 6.004 Computation Structures;
- Nand2Tetris;
- University of Cambridge Introduction to Computer Architecture;
- RISC-V International ratified specifications.

These sources independently converge on a useful backbone around representation/logic, ISA, processor implementation, pipelines, memory hierarchy/VM, OS-facing mechanisms, parallelism, and modern accelerators. The course plan uses that convergence as evidence without cloning any one institution's course.

## Durable course changes

### `planning/fall-2026-spine.md`

Rebuilt the 17-week map around Jeremy's pinned semester shape:

1. Week 1 — Success Foundations
2. Week 2 — AI Lab Training
3. Week 3 — Containers & Repeatability
4. Week 4 — Linux Command Line as a Machine Telescope
5. Week 5 — Representation, Logic, Arithmetic
6. Week 6 — ISA + planning-leading RISC-V
7. Week 7 — Datapath + Control
8. Week 8 — Pipelining, Hazards, Performance
9. Week 9 — Source-to-CPU integration checkpoint
10. Week 10 — Memory Hierarchy + Caches
11. Week 11 — Virtual Memory, Protection, I/O, OS Support
12. Week 12 — Multicore, Coherence, Synchronization
13. Week 13 — Vectors, GPUs, ML Accelerators
14. Week 14 — Real-world Architecture Tradeoffs + Capstone Launch
15. Week 15 — asynchronous Thanksgiving/travel capstone preflight
16. Week 16 — Farkle + Machine Learning Architecture capstone
17. Week 17 — reflection + evidence-backed demonstration of understanding

The new spine is explicitly curriculum-first rather than textbook-chapter-first.

### `planning/fall-2026-course-design.md`

Reframed the course around a connected machine stack and evidence-driven outcomes. Added:

- ten end-of-course capability goals;
- four-part semester arc;
- M/W/F Frame → Inspect/Build/Measure → Explain/Defend rhythm;
- AI investigation notebook doctrine;
- reproducible lab capsule doctrine;
- CPU-only completion requirement;
- worldwide curriculum benchmark set;
- Week 16 capstone design intent;
- readiness definition stronger than "a title exists."

### `README.md`

Updated the repository front door to describe the accepted semester, current readiness, sidecar plan, current-vs-planning zyBooks distinction, and CPU-only laboratory requirement.

### `course_metadata.yaml`

**Intentionally left unchanged.** It currently records a real operational MIPS 6e Fall 2026 zyBook. A planning preference is not sufficient evidence to mutate generator-facing operational metadata.

## Sidecar planning and decisions

### Created `sidecar/PLANNING.md`

The active deployment board now records:

- mission;
- pinned decisions;
- accepted 17-week curriculum;
- research benchmark set;
- lab doctrine;
- workstreams;
- deployment gates;
- Foreman execution sequence.

### Resolved Question 001

`sidecar/questions/001_zybooks_decision_for_architecture.md`

Resolved: **Architecture keeps zyBooks.**

### Created Question 002

`sidecar/questions/002_zybooks_isa_product_and_course_role.md`

Still needs Jeremy after current vendor evidence exists:

- exact ISA/product/edition;
- policy-level zyBooks role.

The Foreman has a read-only reconnaissance prompt to reduce this to a bounded choice.

### Created Question 003

`sidecar/questions/003_assessment_and_grading_contract.md`

Still needs Jeremy:

- grading philosophy/categories;
- zyBooks grading role;
- capstone role;
- Week 17 assessment form;
- due/late mechanics.

Workers may author unweighted evidence/rubric criteria without inventing policy.

## Foreman queue created

`sidecar/prompts/README.md` now orders six bounded work packages:

1. `001_reconcile_course_source_chassis.md`
   - establish durable week-file chassis and source explicitly shaped weeks.
2. `002_inventory_zybooks_architecture_options.md`
   - authorized read-only RISC-V/ARM/MIPS zyBooks comparison.
3. `003_build_reproducible_architecture_lab.md`
   - build/test the semester lab capsule and smoke test.
4. `004_author_weeks_05_14_architecture_core.md`
   - Foreman-dispatched bounded week authoring using strong sources and runnable evidence.
5. `005_build_farkle_ml_architecture_capstone.md`
   - prototype and validate a CPU-accessible Farkle/ML architecture synthesis workload.
6. `006_imprint_architecture_to_savnac_and_read_back.md`
   - reuse Course Foundry / Imprint, render source-backed course into the intended Savnac course, read it back, walk it, and prove re-run behavior.

## Important design boundaries established

- Week 1 contains no Architecture technical gate.
- GPU/specialized hardware may enrich the course but is never required for successful online completion.
- AI may generate hypotheses/explanations but cannot serve as evidence validating itself.
- Later labs should compound through one reproducible environment rather than reset setup every week.
- zyBooks supports the curriculum; it does not dictate the semester order.
- no worker invents grading weights, due rules, product adoption, or production configuration.
- Savnac is the dogfood/inspection surface before production Canvas.
- production SWOSU Canvas and zyBooks writes are outside the queued deployment prompts unless explicitly authorized later.

## Direct commits from this pass

- `791e6418fc8541dc49b0fdcde71785c569ada9a8` — Add Computer Architecture deployment planning board
- `d46752e05dbd7459a17de3f6a619fee6b8f148ee` — Rebuild Fall 2026 architecture spine around deployment plan
- `46387d80b7df6377ca30cb45be7f11cbcdf9705f` — Align architecture course design with new Fall 2026 spine
- `758ba5170f7c108491e1d00509d180ac64c90b71` — Resolve Architecture keeps zyBooks decision
- `c6596c6fdd6c6545cb760d516c908ac541cfc9fd` — Add Architecture zyBooks ISA and product decision
- `5a8a74e953dcc585984bf7b89fbff4ad9904baf3` — Add Architecture assessment and grading decision
- `af02c4bbcacf37dc38aff2a3fbf4b7b6fde22e66` — Initialize Architecture sidecar prompt queue
- `e93b19ccd3ddb3cfa39b8015636f156d0f001ed3` — Queue Architecture source chassis reconciliation
- `8c284b5bcfc9e46a46018a05f705528d07653983` — Queue Architecture zyBooks option inventory
- `cc5363f43972144932946857a6343ec4ff346b26` — Queue reproducible Architecture lab platform build
- `46e27a7b653a67efbd017e4abd5787cb22d5d9ac` — Queue Weeks 5-14 Architecture core authoring
- `a3b5614ca9f25980a26748b817d866c551ee51b5` — Queue Farkle ML Architecture capstone build
- `4da67977e26fe2fe7fd6433a9a5a476e85b92a65` — Queue Architecture Savnac imprint and read-back
- `ad077e4531725d10826e3edcc473cf5e77217285` — Refresh Architecture README for deployment plan
- `80071b4ea5fc6d92c828ce063f7458c5109bfd43` — Refresh Architecture sidecar workbench map

## Next recommended action

Launch the project Foreman against the sidecar queue. Prompt 001 is deliberately first because it gives the later lab/content workers a durable week-source chassis to write into. Prompts 002 and 003 can then run as bounded reconnaissance/platform tracks without forcing unresolved policy into the course.

The project is not deployment-ready yet, but it is now **ready to be built systematically** rather than improvised week by week.
