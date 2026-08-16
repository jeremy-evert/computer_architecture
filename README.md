# Computer Architecture

Course repository for **COMSC-3013 — Computer Architecture**, Dr. Jeremy P. Evert's Fall 2026 section (`COMSC-3013-1438`).

The course is officially **online/asynchronous**. Jeremy designs and manages it on a **Monday / Wednesday / Friday 2:00 PM working rhythm** for planning discipline; that rhythm is not a Banner meeting time.

**Git is the source of truth.** Course Foundry / Imprint may compile this repository into Savnac or Canvas-facing objects, but the rendered LMS copy does not become the authoritative course source.

## Fall 2026 course shape

The accepted semester design is curriculum-first rather than textbook-chapter-first:

1. **Week 1 — Success Foundations:** survive the semester, thrive in the degree, enjoy the career.
2. **Week 2 — AI Lab Training.**
3. **Week 3 — Containers & Repeatability.**
4. **Week 4 — Linux Command Line as a Machine Telescope.**
5. **Weeks 5–14 — Computer Architecture core:** representation/logic/arithmetic, ISA, processor/datapath, pipelining, memory hierarchy, OS-facing mechanisms, multicore/coherence, GPUs/accelerators, and real-world architecture tradeoffs.
6. **Week 15 — asynchronous Thanksgiving/travel capstone preflight.**
7. **Week 16 — Farkle + Machine Learning Architecture capstone.**
8. **Week 17 — reflection plus an evidence-backed demonstration of Computer Architecture understanding.**

See [`planning/fall-2026-spine.md`](planning/fall-2026-spine.md) for the durable semester map and [`planning/fall-2026-course-design.md`](planning/fall-2026-course-design.md) for the design rationale and learning outcomes.

## Repository map

| Path | Purpose |
| --- | --- |
| [`course_metadata.yaml`](course_metadata.yaml) | Durable source of truth for official catalog/section facts, the official-vs-working-cadence distinction, and the currently operational zyBooks adoption. |
| [`planning/fall-2026-spine.md`](planning/fall-2026-spine.md) | Accepted 17-week semester map. |
| [`planning/fall-2026-course-design.md`](planning/fall-2026-course-design.md) | Course promise, learning outcomes, weekly learning chassis, laboratory doctrine, and curriculum-source strategy. |
| [`sidecar/PLANNING.md`](sidecar/PLANNING.md) | Active deployment workbench and readiness plan for Jeremy, ChatGPT, Foreman, and workers. |
| [`sidecar/questions/`](sidecar/questions/) | Genuine unresolved decisions that need Jeremy rather than agent invention. |
| [`sidecar/prompts/`](sidecar/prompts/) | Bounded Foreman work orders for source reconciliation, vendor reconnaissance, lab infrastructure, curriculum authoring, capstone construction, and Savnac imprint/read-back. |
| `sidecar/reports/` | Execution evidence and accepted results from sidecar work orders as they land. |
| `docs/` | Durable student/course policy documentation once authored. |
| `prompts/` / `reports/` | Older course-local prompt/report locations that predate the sidecar convention. New deployment orchestration belongs in `sidecar/`. |

## zyBooks and the teaching ISA

Computer Architecture **keeps zyBooks** as part of its course-resource strategy.

`course_metadata.yaml` currently records the real Fall 2026 operational course as Patterson & Hennessy, *Computer Organization and Design (6e) — Interactive Version (MIPS)*, zyBook `SWOSUCOMSC3013EvertFall2026`. That remains factual operational metadata until an actual replacement is adopted.

The accepted planning direction does **not** treat MIPS as pedagogically sacred. A modern ISA/product comparison remains open, with **RISC-V currently the leading curriculum direction** because it fits the accepted course spine and modern architecture teaching well. The exact zyBooks product/edition and its grading role must be resolved with current vendor evidence before operational metadata changes. See [`sidecar/questions/002_zybooks_isa_product_and_course_role.md`](sidecar/questions/002_zybooks_isa_product_and_course_role.md).

## Laboratory philosophy

By Week 5, students should already know how to:

- use AI as an investigation partner while independently verifying claims;
- run work in a reproducible environment;
- use Linux/system tools to observe the machine;
- record evidence rather than merely repeat an explanation.

Technical weeks then follow a recurring move:

**frame a machine question → inspect/build/measure → explain/defend with evidence.**

The online course must always have a **CPU-only completion path**. GPU or accelerator access may enrich later work, especially Weeks 13 and 16, but specialized hardware is not a course prerequisite.

## Current readiness

The semester spine and course-design doctrine are now established, but the course is **not yet deployment-complete**. In particular:

- weekly student-facing labs/materials for the Architecture core still need bounded authoring and validation;
- the reproducible lab capsule/toolchain must be built and smoke-tested;
- the exact zyBooks product/ISA and course role remain open;
- the grading/assessment contract remains open;
- the Week 16 capstone must be implemented and tested;
- Savnac should be used as the inspection/dogfood surface before any production Canvas deployment.

Active work is organized in [`sidecar/PLANNING.md`](sidecar/PLANNING.md) and [`sidecar/prompts/`](sidecar/prompts/).
