# Computer Architecture - Deployment Planning Board

**Course:** COMSC-3013 Computer Architecture, Fall 2026  
**Repository:** `jeremy-evert/computer_architecture`  
**Status:** active build; Prompts 001-004 implemented; Prompt 004 complete with named physical/release YELLOWs  
**Source of truth:** Git. Savnac is the inspection/dogfood surface; production Canvas requires explicit authorization.

## Mission

Build an online Computer Architecture course where students understand a computer as a connected, measurable system rather than a vocabulary list.

**build the investigator -> build the machine -> open the machine -> stress the machine -> make the architecture decision -> wind down and reflect**

## Pinned decisions

- online/asynchronous; M/W/F is production/release rhythm, not attendance;
- Monday model/AI Fluency, Wednesday investigation/Professional Minds, Friday Explain/Defend + optional Stack Showcase;
- Weeks 5-14 are the complete technical Architecture runway;
- Machine Dossier begins Week 5 and freezes Week 14;
- Checkpoints only Weeks 6, 9, 14;
- evidence grammar: **predict -> perturb -> run -> measure -> visualize -> explain -> revise**;
- RISC-V planning-leading teaching ISA;
- common Observatory + Experimental Chamber laboratory;
- matplotlib for evidence plots; LaTeX/PDF for the Dossier;
- CPU-only, zero-cost required path; no required paid AI, premium agent, GPU, private infrastructure, or commercial textbook;
- Week 15 wind-down, Week 16 shared Farkle + ML not Architecture capstone, Week 17 reflection only;
- production Canvas writes remain unauthorized.

## Current durable technical-core truth

- `weeks/README.md`
- `weeks/week-05/` through `weeks/week-14/`
- `planning/technical-core-continuity.md`
- `planning/machine-dossier.md`
- `planning/open-source-resource-canon.md`
- `docs/grading-model.md`
- `lab/README.md`
- `lab/CONTRACT.md`
- `lab/MEASUREMENT.md`
- `lab/PLATFORM_SUPPORT.md`
- `lab/PLATFORM_VALIDATION_RUNBOOK.md`
- `lab/validation/2026-08-16-authored-weeks-05-14-linux.json`
- `sidecar/reports/004_author_weeks_05_14_architecture_core.md`

`planning/week-06.md` through `planning/week-14.md` are now concise indexes. Authored teaching truth lives in `weeks/`.

## Workstreams

### A. Reconcile source chassis - IMPLEMENTED / COMPLETE
Prompt 001 receipt: `sidecar/reports/001_reconcile_course_source_chassis.md`.

### B. Open-source Architecture canon - IMPLEMENTED / COMPLETE
Prompt 002 receipt: `sidecar/reports/002_build_open_source_architecture_canon.md`.

### C. Student laboratory - IMPLEMENTED WITH PHYSICAL PLATFORM YELLOWS
Core laboratory, sensory experiments, plots, Dossier builder, and fallbacks exist. Linux authored path is freshly GREEN. WSL2, macOS, and Containerfile runtime remain evidence-gated YELLOWs. See `lab/PLATFORM_SUPPORT.md`.

### D. Weeks 1-4 - OUTSTANDING
- Week 1 shared Success Foundations;
- Week 2 AI Laboratory Training;
- Week 3 Containers & Repeatability;
- Week 4 Linux as Machine Telescope.

These are outside Prompt 004 and still require source-ready authoring before complete-course deployment.

### E. Weeks 5-14 - IMPLEMENTED / PROMPT 004 COMPLETE WITH NAMED YELLOWS
All ten technical weeks have student/instructor packages, deck sources, evidence paths, Dossier handoffs, references, validations, and reports.

Continuity audit: PASS.  
Fresh authored Linux execution: PASS.  
Parent receipt: `sidecar/reports/004_author_weeks_05_14_architecture_core.md`.

### F. Weeks 15-17 - OUTSTANDING
- Week 15 asynchronous wind-down/professional pathway;
- Week 16 shared Farkle + ML experience (Prompt 005 when started);
- Week 17 frozen-evidence reflection.

### G. Grading operational mechanics - OUTSTANDING
The accepted weights/categories remain in `docs/grading-model.md`. Still decide/test due/late/drop/revision mechanics, Canvas assignment groups, and official calendar/dead-days constraints. Prompt 004 did not invent these.

### H. Savnac / deployment - WAITING
Use Course Foundry/Imprint only after the relevant course source is ready. Savnac dogfood precedes any production Canvas authorization.

## Gates

### Gate 0 - Truth - PASS
One current doctrine; stale technical week planning status has been reconciled into `weeks/` + concise planning indexes.

### Gate 1 - Open content sufficiency - PASS AT AUTHORING-CANON LEVEL
No required commercial textbook/paywall path.

### Gate 2 - Lab works - PASS ON EXECUTED LINUX / PHYSICAL PLATFORM YELLOWS TRACKED
Prompt 003 and Prompt 004_m prove the substrate and final authored workloads on Linux.

### Gate 3 - Weeks 5-14 are real - PASS WITH RELEASE YELLOWS
Lecture/digest/deck, investigation, evidence, references, fallback, Dossier handoff, and validation exist for the technical core. Cross-week continuity audit passed.

### Gate 4 - Complete-course Savnac dogfood - WAITING
Blocked by source-ready Weeks 1-4, 15-17 and grading/deployment mechanics, not by Prompt 004 technical authoring.

### Gate 5 - Production readiness - WAITING / EXPLICIT AUTHORIZATION REQUIRED
Also requires physical support claims appropriate to the final student environment.

## Next numbered prompt

**Prompt 005** is the next numbered build workstream when deliberately started. It builds the shared Week 16 Farkle + ML experience, not another Architecture capstone.

Separately, physical Windows/Mac/container checks can be run opportunistically from `lab/PLATFORM_VALIDATION_RUNBOOK.md` and update support rows without reopening Prompt 004.

## Planning principle

**Build the scientist. Build the machine. Make the machine argue with the model. Plot the argument. Explain the smoke. Then make the architecture decision.**
