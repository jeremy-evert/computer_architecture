# Sidecar Report 000 — Open-source / zero-cost required-path doctrine update

**Date:** 2026-08-16  
**Status:** COMPLETE  
**Supersedes:** the zyBooks-required/product-selection direction recorded in `000_initial_deployment_planning_pass.md` and earlier planning commits

## Jeremy's current decision

Computer Architecture should be built so the entire required course can be completed **without zyBooks or another commercial textbook**.

Textbooks, Patterson/Hennessy, historical zyBooks material, and other commercial resources may still guide course authors and may be listed as optional references. They are not required student infrastructure.

Jeremy also clarified that he is **not ready to require paid AI with command-line support**.

The repository therefore now treats:

- paid AI subscriptions as optional;
- Codex, Claude Code, and other premium AI CLI agents as optional;
- free/accessible AI paths as sufficient for any required AI-supported activity;
- premium-tool ownership as having no effect on the attainable grading ceiling.

The course also retains the prior CPU-only completion requirement: specialized GPU access is optional enrichment.

## Durable doctrine now recorded

### Required student path

Required materials should target $0 beyond ordinary computer/university/course access.

The course must stand on:

- open/freely accessible readings and primary references;
- course-created explanations/scaffolding;
- open-source/free lab tooling;
- reproducible course environment;
- no-cost or otherwise course-accessible AI path where AI is expected.

### RISC-V

RISC-V remains the planning-leading teaching ISA, now explicitly independent of any zyBooks adoption. The rationale is the open specification, open tool ecosystem, and strong pedagogical fit.

### Commercial references

Historical MIPS zyBooks metadata is preserved under reference/provenance rather than deleted. It can help instructors understand prior course history and topic coverage without becoming a student requirement.

## Files changed

- `README.md`
  - added required-materials doctrine;
  - removed required zyBooks direction;
  - made paid AI/CLI optional only.
- `course_metadata.yaml`
  - added `required_materials_policy`;
  - records no commercial textbook/zyBooks requirement;
  - records no paid AI or paid AI CLI requirement;
  - moved old MIPS zyBook into historical/reference provenance;
  - records RISC-V as planning-leading ISA.
- `planning/fall-2026-course-design.md`
  - course now explicitly stands on its own without a textbook;
  - open-source/content-authoring doctrine added;
  - premium AI/CLI cannot affect grading ceiling.
- `planning/fall-2026-spine.md`
  - removed commercial-product dependency language;
  - Week 2 is provider-neutral and no-paid-requirement;
  - RISC-V rationale is open/pedagogical.
- `sidecar/PLANNING.md`
  - zero-cost required path is pinned;
  - commercial/premium resource questions are closed;
  - open-source canon is now a major workstream/gate.
- `sidecar/questions/001_zybooks_decision_for_architecture.md`
  - resolved: no required zyBooks/commercial textbook.
- `sidecar/questions/002_zybooks_isa_product_and_course_role.md`
  - closed/superseded: no zyBooks product selection needed for the core course.
- `sidecar/questions/003_assessment_and_grading_contract.md`
  - grading question remains open;
  - free-tool and premium-tool students must have the same grading ceiling.
- `sidecar/prompts/001_reconcile_course_source_chassis.md`
  - updated to enforce zero-cost/open-source doctrine.
- `sidecar/prompts/002_inventory_zybooks_architecture_options.md`
  - deleted as obsolete.
- `sidecar/prompts/002_build_open_source_architecture_canon.md`
  - created as replacement research job.
- `sidecar/prompts/004_author_weeks_05_14_architecture_core.md`
  - authors must build complete no-paywall student-facing weeks.
- `sidecar/prompts/005_build_farkle_ml_architecture_capstone.md`
  - paid AI/CLI explicitly optional; CPU/free path required.
- `sidecar/prompts/006_imprint_architecture_to_savnac_and_read_back.md`
  - rendered course acceptance includes no hidden paywall/premium-tool dependency.
- `sidecar/prompts/README.md`
  - queue now points Prompt 002 at the open-source canon rather than vendor shopping.

## New Prompt 002 mission

`sidecar/prompts/002_build_open_source_architecture_canon.md` now instructs Foreman to:

1. research strong open/freely accessible materials for every week;
2. check licensing/access/permanence;
3. classify coverage as GREEN / YELLOW / RED;
4. identify exactly what course-owned chapters/diagrams/examples/labs we need to create;
5. hand that canon to Week 5–14 authors.

This converts the old "which textbook should we buy?" problem into the more useful question:

> **What is the strongest open body of knowledge we can assemble, and where should our course itself become the missing textbook?**

## Policy boundary

Do not interpret "premium AI is optional" as hostility to premium tools.

The course may absolutely demonstrate and support advanced workflows using ChatGPT, Claude, Codex, Claude Code, or future tools. Students who already have them may use them where allowed.

The boundary is simpler:

> No student's ability to complete required work or earn the highest grade depends on purchasing them.

## Current next action

The Foreman queue remains:

1. Prompt 001 — source chassis reconciliation
2. Prompt 002 — open-source Architecture canon
3. Prompt 003 — reproducible lab platform
4. Prompt 004 — Weeks 5–14 authoring
5. Prompt 005 — Farkle/ML capstone
6. Prompt 006 — Savnac imprint/read-back

Prompts 002 and 003 can run in parallel once Prompt 001 has established the durable source chassis.
