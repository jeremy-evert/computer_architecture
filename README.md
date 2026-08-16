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

## Required-materials doctrine

**The required course path should cost students $0 beyond ordinary access to a computer and university/course infrastructure.**

Computer Architecture will be built so students can complete every required learning activity using:

- openly available course readings and references;
- open-source or freely available development/simulation tools;
- the course's reproducible lab environment;
- a no-cost/accessible AI path for any activity where AI use is expected.

Commercial textbooks, zyBooks, paid AI subscriptions, Codex, Claude Code, and other premium tools may be excellent **optional accelerators or references**, but they are not prerequisites for completing the course or earning a strong grade.

Students may use the AI provider and interface they prefer. Premium command-line agents can be demonstrated and supported as an advanced workflow, but no required assignment may depend on a student purchasing them.

## Repository map

| Path | Purpose |
| --- | --- |
| [`course_metadata.yaml`](course_metadata.yaml) | Durable source of truth for official catalog/section facts, the official-vs-working-cadence distinction, and historical/reference resource provenance. |
| [`planning/fall-2026-spine.md`](planning/fall-2026-spine.md) | Accepted 17-week semester map. |
| [`planning/fall-2026-course-design.md`](planning/fall-2026-course-design.md) | Course promise, learning outcomes, weekly learning chassis, laboratory doctrine, and curriculum-source strategy. |
| [`sidecar/PLANNING.md`](sidecar/PLANNING.md) | Active deployment workbench and readiness plan for Jeremy, ChatGPT, Foreman, and workers. |
| [`sidecar/questions/`](sidecar/questions/) | Genuine unresolved decisions that need Jeremy rather than agent invention. |
| [`sidecar/prompts/`](sidecar/prompts/) | Bounded Foreman work orders for source reconciliation, open-source curriculum research, lab infrastructure, curriculum authoring, capstone construction, and Savnac imprint/read-back. |
| `sidecar/reports/` | Execution evidence and accepted results from sidecar work orders as they land. |
| `docs/` | Durable student/course policy documentation once authored. |
| `prompts/` / `reports/` | Older course-local prompt/report locations that predate the sidecar convention. New deployment orchestration belongs in `sidecar/`. |

## Textbooks, zyBooks, and the teaching ISA

**No commercial textbook or zyBook is required for Fall 2026.**

Patterson/Hennessy, historical zyBooks material, and other excellent texts can still guide course design and may be recommended as optional references. The repository preserves that provenance because good books remain useful research material, not because students must purchase them.

The course itself must contain or link to sufficient openly accessible material to teach the required curriculum without a paywall.

**RISC-V remains the planning-leading teaching ISA** because it fits the accepted course spine, has an open specification, and is widely used in strong contemporary architecture courses. That choice should stand on pedagogical and tooling merit rather than on whichever commercial textbook happens to be available.

## Laboratory philosophy

By Week 5, students should already know how to:

- use AI as an investigation partner while independently verifying claims;
- run work in a reproducible environment;
- use Linux/system tools to observe the machine;
- record evidence rather than merely repeat an explanation.

Technical weeks then follow a recurring move:

**frame a machine question → inspect/build/measure → explain/defend with evidence.**

The online course must always have a **CPU-only completion path**. GPU or accelerator access may enrich later work, especially Weeks 13 and 16, but specialized hardware is not a course prerequisite.

Likewise, premium AI or agentic CLI tools may enrich the experience but are never required for the core path.

## Current readiness

The semester spine and course-design doctrine are now established, but the course is **not yet deployment-complete**. In particular:

- weekly student-facing labs/materials for the Architecture core still need bounded authoring and validation;
- the reproducible lab capsule/toolchain must be built and smoke-tested;
- the open-source/reference canon for each week must be assembled and validated;
- the grading/assessment contract remains open;
- the Week 16 capstone must be implemented and tested;
- Savnac should be used as the inspection/dogfood surface before any production Canvas deployment.

Active work is organized in [`sidecar/PLANNING.md`](sidecar/PLANNING.md) and [`sidecar/prompts/`](sidecar/prompts/).
