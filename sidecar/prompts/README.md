# Computer Architecture Sidecar Prompts

Project-local work orders for getting COMSC-3013 ready for Fall 2026 deployment.

## Contract

- Open work orders live in this directory.
- Each prompt writes its evidence/report to `sidecar/reports/NNN_<slug>.md`.
- A worker does not self-certify completion; the current helm/Foreman reviews the result against the prompt contract.
- Course truth belongs outside `sidecar/`; process notes, execution evidence, and unresolved work belong inside it.
- Git is authoritative. Savnac is the inspection/dogfood surface. Production SWOSU Canvas writes require explicit authorization.
- Required course work must not depend on commercial textbooks, zyBooks, paid AI subscriptions, premium AI CLI tools, or specialized GPU hardware.
- Weeks 5-14 are the entire Architecture technical runway. Week 14 is the technical finale. Week 16 is not an Architecture capstone.

## Queue status

1. **COMPLETE** - `001_reconcile_course_source_chassis.md`
   - receipt: `../reports/001_reconcile_course_source_chassis.md`
2. **ACTIVE** - `002_build_open_source_architecture_canon.md`
3. **UNBLOCKED / PARALLEL** - `003_build_reproducible_architecture_lab.md`
4. **WAITING ON 002 + 003** - `004_author_weeks_05_14_architecture_core.md`
5. **LATER** - `005_build_farkle_ml_architecture_capstone.md`
   - historical filename retained; current mission is the shared Week 16 Farkle + ML experience, **not** an Architecture capstone
6. **LATER** - `006_imprint_architecture_to_savnac_and_read_back.md`

Read `../PLANNING.md`, `../../planning/block-map.md`, `../../planning/machine-dossier.md`, and `../../docs/grading-model.md` before dispatching work.
