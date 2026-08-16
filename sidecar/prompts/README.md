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
2. **COMPLETE** - `002_build_open_source_architecture_canon.md`
   - receipt: `../reports/002_build_open_source_architecture_canon.md`
3. **COMPLETE WITH PLATFORM YELLOWS** - `003_build_reproducible_architecture_lab.md`
   - implementation: `../../lab/`
   - receipt: `../reports/003_build_reproducible_architecture_lab.md`
   - executed Linux substrate is green; WSL2/container-image/macOS claims remain evidence-gated
4. **ACTIVE CAMPAIGN** - `004_author_weeks_05_14_architecture_core.md`
   - parent remains the doctrine/acceptance constitution
   - `004_a` shared workbench is complete
   - `004_b` Week 5 is complete with named platform/showcase YELLOWs
   - `004_c` Week 6 + Checkpoint 1 is the next ready work order
5. **LATER** - `005_build_farkle_ml_architecture_capstone.md`
   - historical filename retained; current mission is the shared Week 16 Farkle + ML experience, **not** an Architecture capstone
6. **LATER** - `006_imprint_architecture_to_savnac_and_read_back.md`

## Prompt 004 campaign

The technical authoring campaign is deliberately split so each piece can be discussed, executed, reviewed, and committed without losing semester-level continuity.

| Prompt | Mission | Dependency posture |
|---|---|---|
| `004_a_build_shared_authoring_kit.md` | common week/deck/lab/receipt/dossier/showcase/validation grammar | **COMPLETE** - receipt `../reports/004_a_build_shared_authoring_kit.md` |
| `004_b_author_week_05_build_the_machine.md` | Week 5: machine/workload/dossier v0 | **COMPLETE WITH NAMED YELLOWS** - implementation `../../weeks/week-05/`; receipt `../reports/004_b_author_week_05_build_the_machine.md` |
| `004_c_author_week_06_bits_become_instructions.md` | Week 6 + Checkpoint 1 | **READY - NEXT** |
| `004_d_author_week_07_crack_open_the_cpu.md` | Week 7 datapath/control | after 004_c |
| `004_e_author_week_08_make_it_fast_without_breaking_it.md` | Week 8 performance/dependency | after 004_d |
| `004_f_author_week_09_follow_the_program_down.md` | Week 9 integration + Checkpoint 2 | after 004_b-e |
| `004_g_author_week_10_make_the_memory_hierarchy_hurt.md` | Week 10 memory sensory lab | after shared kit/core continuity |
| `004_h_author_week_11_the_useful_lie_of_memory.md` | Week 11 VM/OS abstraction | after 004_g |
| `004_i_author_week_12_more_cores_more_problems.md` | Week 12 scaling/communication | after shared kit |
| `004_j_author_week_13_different_machines_for_different_work.md` | Week 13 specialization/workload fit | after 004_i |
| `004_k_author_week_14_sit_in_architects_chair.md` | Week 14 final dossier + Checkpoint 3 | after Week 5-13 core |
| `004_l_cross_week_continuity_editorial_audit.md` | read Weeks 5-14 as one course and repair seams | after 004_b-k |
| `004_m_execute_validate_student_release_readiness.md` | run authored course on real target surfaces; burn down platform yellow paint | after authored paths exist; some checks may run earlier |
| `004_n_integrate_report_and_handoff.md` | helm-level final acceptance + parent report/status | last |

The intended authoring rhythm is **004_a -> b/c -> d/e/f -> g/h -> i/j -> k -> l -> m -> n**, with hardware/platform checks from 004_m allowed to run opportunistically when real machines are available.

Read `../PLANNING.md`, the parent Prompt 004, `../../weeks/README.md`, `../../planning/block-map.md`, `../../planning/machine-dossier.md`, `../../planning/open-source-resource-canon.md`, `../../lab/CONTRACT.md`, and `../../docs/grading-model.md` before dispatching work.
