# Initiative 009 d04 — Savnac re-baseline

**Verdict: `EXPECTED_MATERIAL_DELTA`**

## Outcome

Current authoritative Architecture main is structurally aligned with Savnac course 8, but the guarded dry-run identifies seven understood student-facing body updates from current main. The delta is bounded, has zero creates and deletes, and is attributable to accepted current-doctrine source changes. A fresh bounded Savnac reconcile is therefore required before inheriting a fixed-point claim; d05 is **READY** conditional on Foreman acceptance.

## Evidence

The execution branch was created at Architecture main `7ce6cd6b591aa29fc05d114b0afb1c224f4f2222`. Exact shared-source SHAs and dirt states, compiler counts, read-back inventory, and the complete guarded dry-run receipt are in [the d04 run receipt](../runs/009_d_04_savnac_rebaseline_receipt.md).

Savnac course 8 read-back is `Computer Architecture (COMSC-3013)`, available, with 21 canonical modules and 229 live module items: 81 pages, 32 files, and 116 assignments. The desired compiler contract is the same 21 modules and 229 objects with those same type counts; the 11 desired assignment groups total 100% and match live named groups. The live zero-weight `Assignments` group is the known unused historical default group, not a desired student-facing category. There are no module-local duplicate titles, and all 116 live assignments report no submitted submissions. Only the active test-student view and teacher enrollments are present.

The dry-run returned exactly:

```text
0 create / 7 update / 233 unchanged / 0 delete
```

The seven updates are Week 02/03/04 Week-at-a-Glance pages, Week 16 Week-at-a-Glance, Week 16 Explain/Defend, and A6 Week 14/Week 15 objects. No group update, create, delete, kind change, orphan-prune action, or unsafe scope was proposed. The changes are explained by the current-main source delta from the Prompt-006 source (`git diff 36c339f..HEAD` touches the corresponding six source files), while Prompt 006’s historical 12-group count is not treated as current doctrine.

## Semantic checks

- Modules/order: 21 live positions match the current desired order.
- Object counts/types: live `81/32/116` page/file/assignment counts and 229 total items match the desired type contract.
- A6/A7/evaluation: A6 Week 14 and Week 15 updates, A7 final reflection, and course evaluation are present; only A6 bodies differ.
- Groups/weights/drop rules: 11 desired groups at 100%; exactly five desired recurring groups have `drop_lowest=1`; extra live default `Assignments` is zero-weight and unused.
- Due/dead-day behavior: desired calendar contract remains validated by d03; Week 9 checkpoint/due behavior is before Fall Break, Week 15 wind-down is before Thanksgiving, and Week 16 has no graded recurring work/checkpoint.
- Week 1: all five shared Week 1 modules and their live items are preserved and skipped unchanged.
- Duplicates/orphans: no module-local duplicate titles; no delete/prune proposed. The zero-weight default group is recorded as a known historical unused group.
- Files/links: all 32 live files are skipped unchanged; desired unresolved link-token count is zero; no file create/delete or link collision appears in dry-run.
- Delete/prune scope: `prune_scope=none`; dry-run delete count is zero.
- Student/submission/enrollment safety: all assignments report no submitted submissions; only the two expected active non-production enrollments are present; no student state was touched.

## Boundary and handoff

This is execution evidence, not acceptance or promotion. No live Savnac write or production Canvas operation occurred. The external Foreman owns review, verdict acceptance, promotion, and the decision to release d05. d05/d06 were not executed.

## Validation and repository record

- Source validator: completed; bounded receipt under `sidecar/runs/`.
- Targeted compiler/deployer tests: `16 passed` in the Course Foundry Python 3.11 virtual environment.
- `git diff --check`: pass.
- `make task-check`: unavailable (`No rule to make target 'task-check'`).
- `make check`: unavailable (`No rule to make target 'check'`).
- Changes in scope: this report and the bounded d04 receipts under `sidecar/`.
- Next recommended prompt: external Foreman review of d04; if accepted, release conditional d05 for the seven expected updates.
