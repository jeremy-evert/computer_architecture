# Sidecar Report 001 - Reconcile and validate the Computer Architecture course source chassis

**Status:** COMPLETE  
**Executed by:** ChatGPT with Jeremy retaining design authority  
**Date:** 2026-08-16  
**Starting main:** `4552d5d92796ae48a29f5aa1d437638e1f81e8da`

## Result

The current Computer Architecture source chassis is coherent and ready for bounded canon/laboratory/week authoring.

The repo now tells one current story:

**build the investigator -> build the machine -> open the machine -> stress the machine -> make the architecture decision -> wind down and reflect**

The official course remains online/asynchronous. Monday/Wednesday/Friday are production/release anchors rather than attendance periods:

- **Monday - Think / Frame / Lecture:** AI Fluency + course-owned lecture/deck/recording.
- **Wednesday - Investigate / Break / Measure:** Professional Minds + hands-on laboratory.
- **Friday - Explain / Defend / Stack Showcase:** Professional Minds + individual evidence receipt + optional instructor real-stack demonstration.

## Sources inspected

### Computer Architecture

Inspected current root/source files including:

- `AGENTS.md`
- `README.md`
- `course_metadata.yaml`
- every durable master planning file under `planning/`
- all seventeen week planning shells (`week-01.md` through `week-17-finals.md`)
- `docs/grading-model.md`
- `sidecar/README.md`
- `sidecar/PLANNING.md`
- all sidecar questions
- sidecar prompts 001-006
- legacy root `prompts/` and `reports/`

### Sibling family patterns

Current sibling sources sampled/compared:

- CS1 `planning/block-map.md`, blob `cfb407f56992b9f48ab8a15a50aa706fa6b232a9`
- CS2 `planning/fall-2026-course-design.md`, blob `bf05d2348bd8b9fa0b5eb3a864ea7184371f1883`
- DSCT `planning/fall-2026-weekly-architecture.md`, blob `e09314c60f12b7780e51d01e42203edbe4fa094e`

The useful family resemblance is present without cloning classroom-specific mechanics:

- universal Week 1;
- shared AI Fluency progression;
- shared Professional Minds progression;
- persistent authentic artifact/context;
- repeated evidence/revision habit;
- checkpoint/synthesis rhythm;
- deliberate Week 15-17 wind-down.

Architecture appropriately replaces live pair-programming/show-and-tell with individual laboratories, Explain/Defend receipts, and instructor Stack Showcases.

## Durable planning consistency

The following all agree:

- `README.md`
- `planning/fall-2026-course-design.md`
- `planning/fall-2026-spine.md`
- `planning/architecture-arc-map.md`
- `planning/block-map.md`
- `planning/machine-dossier.md`
- week planning shells
- `docs/grading-model.md`
- `sidecar/PLANNING.md`

### Machine Dossier lifecycle confirmed

- Weeks 1-4: no dossier; build investigation/reproducibility/observation skills.
- Week 5: Machine Dossier v0 begins with student-designed + observable machine and Dollars-Per/hierarchy evidence.
- Weeks 6-13: dossier grows only when evidence improves the machine model.
- Week 14: Checkpoint 3; final redesign/defense; dossier freezes.
- Weeks 15-17: curate/reference/reflect only; no new Architecture layer.

### Checkpoint cadence confirmed

- Week 6 - Checkpoint 1
- Week 9 - Checkpoint 2
- Week 14 - Checkpoint 3
- no Week 16 Checkpoint 4

### Hard ending confirmed

Computer Architecture technical instruction ends in Week 14.

- Week 15 is Thanksgiving wind-down/catch-up.
- Week 16 is shared Farkle + ML application/fun.
- Week 17 is reflection and closure.

## Grading-model consistency

`docs/grading-model.md` and Question 003 agree on the accepted category weights and checkpoint cadence.

The technical center is intentionally dominant:

- weekly Architecture/investigation work: 30%
- weekly Explain/Defend receipt: 10%
- Machine Dossier checkpoints: 20%

The remaining grading uncertainty is operational only:

- due-day/time cadence;
- late-work mechanics;
- drop-lowest mechanics;
- revision/resubmission windows;
- Canvas group/object wiring;
- institutional calendar/dead-days verification.

No worker should reopen grading weights or invent those operational mechanics.

## Drift found and corrected

### 1. Legacy root reports were dangerous in present tense

`reports/010_fall_2026_course_design.md` still described zyBooks/vendor configuration as a current required-course direction.

`reports/011_reasoning_odyssey_fabric_doctrine_note.md` still said Architecture had no chassis, no grading model, and an open zyBooks decision.

They are retained as historical provenance but now carry explicit superseded warnings pointing readers to current durable source.

### 2. Prompt 002 lagged the accepted spine

The open-canon prompt still treated Week 5 primarily as representation/logic/arithmetic and described Weeks 15-17 through the old capstone tail.

Prompt 002 is reconciled to:

- Week 5 Build the Machine / PC economics / Machine Dossier start;
- Week 6 representation + RISC-V contract;
- sensory-lab/source needs;
- current Week 14 technical finale;
- Week 15-17 wind-down with no hidden Architecture capstone.

### 3. Prompt 006 lagged grading/source readiness

The Savnac prompt is updated to read the current block map, Machine Dossier, and grading model and to preserve accepted weights while leaving only due/late/drop mechanics unresolved.

Rendered read-back must also verify the Week 14 hard ending and absence of a Week 16 Architecture capstone/checkpoint.

## Honest readiness state

The chassis is green. The course itself is not falsely declared finished.

Still YELLOW / not yet implemented:

- open-source week-by-week canon;
- pricing/source strategy for current PC/component economics;
- reproducible lab capsule;
- `archprobe`/structured machine snapshot;
- common measurement/CSV/JSON receipts;
- Python/matplotlib plotting helpers;
- LaTeX/PDF dossier build;
- RISC-V toolchain/simulator choice and execution validation;
- Week 8/10/12 sensory harnesses;
- lecture digests/decks/recording plans;
- Week 5-14 student-facing content and validation;
- operational grading due/late/drop mechanics;
- Savnac compilation/read-back.

## Validation

Structural validation performed by read-back against the GitHub source tree:

- all durable master planning links/paths referenced in the current chassis exist;
- all 17 week planning files exist and use the accepted online M/W/F grammar;
- holiday exceptions agree across block map/spine/week files;
- Week 5 Machine Dossier start agrees across sources;
- Week 6/9/14 checkpoint cadence agrees across sources;
- Week 14 technical ending agrees across sources;
- Week 15-17 wind-down agrees across sources;
- no current durable source requires zyBooks/commercial text, paid AI/CLI, GPU, or Jeremy's private infrastructure.

The GitHub connector does not expose a local working tree on which to literally run `git diff --check`; changed Markdown was reviewed on write/read-back and the post-commit compare/read-back is the acceptance path for this connector-executed pass.

## Handoff

Prompt 001 is complete.

**Prompt 002 (open canon) and Prompt 003 (laboratory) may now proceed in parallel.** Prompt 004 should consume both accepted outputs rather than inventing its own source/tool contracts.
