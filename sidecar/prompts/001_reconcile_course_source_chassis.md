# Sidecar Prompt 001 — Reconcile and validate the Computer Architecture course source chassis

**Status:** OPEN — review/validation pass  
**Owner:** Foreman  
**Mode:** inspect → compare → reconcile only where needed → validate → report

## Mission

Review the course-source chassis that now exists and make sure it is coherent, internally consistent, and recognizably aligned with the planning grammar used in CS1.

**Do not recreate the chassis.** ChatGPT and Jeremy have already established the current Architecture structure:

- `planning/fall-2026-course-design.md`
- `planning/fall-2026-spine.md`
- `planning/architecture-arc-map.md`
- `planning/block-map.md`
- `planning/week-01.md` through `planning/week-16.md`
- `planning/week-17-finals.md`

The job now is to catch drift, broken links, duplicated truth, stale doctrine, or structural inconsistencies before the open-canon/lab/week-authoring work deepens the tree.

## Read first

### This repository

- `AGENTS.md`
- `README.md`
- `course_metadata.yaml`
- all files under `planning/`
- `sidecar/PLANNING.md`
- all `sidecar/questions/*.md`
- `sidecar/README.md`

### CS1 family pattern

Inspect current `jeremy-evert/computer_science_1`, especially:

- `planning/fall-2026-course-design.md`
- `planning/coding-odyssey-arc-map.md`
- `planning/block-map.md`
- representative `planning/week-NN.md` files

The goal is **family resemblance, not cloning**.

Architecture should preserve the same useful zoom levels:

1. compact course design;
2. arc/relationship map;
3. production/block map;
4. predictable per-week files.

Architecture's asynchronous weekly grammar is intentionally:

**Status → Weekly Focus → Monday Frame → Wednesday Inspect / Build / Measure → Friday Explain / Defend → Evidence this week → Open authoring notes.**

Do not replace that with CS1's classroom-specific Monday Moments / Wacky Wednesday / Fun Friday strands.

## Pinned truths to preserve

- official section = online/asynchronous;
- M/W/F 2 PM = Jeremy's planning rhythm only;
- Week 1 = survive semester / thrive degree / enjoy career, no Architecture technical gate;
- Week 2 = provider-neutral AI Lab Training;
- Week 3 = Containers & Repeatability;
- Week 4 = Linux Command Line as Machine Telescope;
- Weeks 5+6 = sister pair: representation/meaning ↔ ISA/hardware-software contract;
- Weeks 7+8 = sister pair: single-instruction datapath/control ↔ pipeline/performance;
- Week 9 = source-to-CPU integration checkpoint, not filler;
- Weeks 10+11 = sister pair: memory hierarchy reality ↔ VM/OS-facing abstraction;
- Weeks 12+13 = sister pair: general multicore parallelism ↔ specialized vector/GPU/accelerator parallelism;
- Week 14 = architecture tradeoff synthesis + capstone launch;
- Week 15 = Thanksgiving/travel asynchronous lightweight preflight;
- Week 16 = Farkle + ML Architecture capstone;
- Week 17 = reflection + evidence-backed demonstration of understanding;
- no required commercial textbook or zyBooks purchase;
- no required paid AI subscription;
- no required paid AI CLI tool such as Codex or Claude Code;
- premium AI/CLI tools may be optional enrichment only;
- no specialized GPU hardware requirement;
- CPU-only required completion path;
- RISC-V is the planning-leading ISA independent of commercial-resource availability.

## Required work

### 1. Compare the four planning zoom levels

Verify that course design, arc map, block map, spine, and week files tell the same story without unnecessary duplication or contradiction.

In particular check:

- dates and holiday adjustments;
- week titles and central ideas;
- sister-week relationships;
- Week 9 integration role;
- Week 14→15→16 capstone progression;
- Week 17 no-new-technical-material ending.

### 2. Check CS1 family resemblance

Confirm that a contributor moving between CS1 and Architecture can recognize:

- the compact semester summary;
- an arc map explaining relationships/checkpoints;
- a production target map;
- predictable week files.

Do not force Architecture to inherit CS1 structures that only exist because CS1 is face-to-face.

### 3. Preserve honest readiness states

The Architecture week files are **planning shells**, not finished lessons.

Do not promote placeholders into fake-green student material. Make sure wording does not imply that open references, labs, rubrics, or validation exist when they have not actually landed.

### 4. Check shared-source opportunities

Week 1 should reuse/reference the universal shared kickoff source where possible rather than becoming a divergent copy.

Inspect whether any genuinely shared AI-lab, reproducibility, Linux, or Farkle assets belong in a shared curriculum repository. Report candidates; do not perform a giant cross-repository refactor in this prompt.

### 5. Validate structure

Run repository-native validation if it exists and `git diff --check`.

Check internal links/paths and naming consistency, including `week-17-finals.md`.

Do not mutate Savnac or production Canvas in this prompt.

## Explicit non-goals

- no new grading weights/points/late policy;
- no commercial textbook/vendor selection;
- no paid AI/CLI requirement design;
- no full student-facing Weeks 5–14 authoring;
- no container implementation;
- no Savnac/production Canvas writes;
- no giant sibling-repository refactor.

## Required report

Write:

`sidecar/reports/001_reconcile_course_source_chassis.md`

Include:

- source commits inspected;
- CS1 planning structures compared;
- any files corrected and why;
- confirmation of the Architecture weekly schema;
- confirmation that sister-week relationships are consistent across maps;
- shared-source opportunities identified;
- stale/duplicate doctrine removed, if any;
- remaining YELLOWs;
- validation results;
- worker commit SHA(s).

## Foreman acceptance

Foreman independently verifies that:

1. the accepted semester shape is discoverable and internally consistent;
2. the Architecture planning tree has recognizable CS1-family structure without inappropriate cloning;
3. all 17 weeks have honest planning shells;
4. Week 1 contains no Architecture-specific technical gate;
5. no commercial/premium resource is accidentally required;
6. unresolved grading mechanics were not invented;
7. later Prompt 002/003/004 workers can use the chassis without guessing where their work belongs.

## Done when

The current chassis has been reviewed rather than reinvented, structural drift has been corrected, validation is clean, and Prompt 002/003/004 can build content against one obvious planning pattern.
