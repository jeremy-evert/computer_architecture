# Initiative 009 d04 — Foreman acceptance

**Status:** ACCEPTED / PROMOTED

## Accepted package

- Worker branch: `golem/009-d04-savnac-rebaseline`
- Worker commit: `1ce99a00fc777dcd857a05761fea8d5e9f7bf2ab`
- Worker report: `sidecar/reports/009_d_04_rebaseline_savnac.md`
- Run receipt: `sidecar/runs/009_d_04_savnac_rebaseline_receipt.md`
- Source validation receipt: `sidecar/runs/architecture_savnac_source_validation_20260818T143157Z.md`

The worker branch was one commit ahead of `main`, zero behind, and changed only the three bounded d04 evidence files. The package was promoted to `main` by fast-forward after independent review.

## Accepted verdict

`EXPECTED_MATERIAL_DELTA`

Current Savnac course 8 is structurally aligned with current authoritative Architecture source, but seven understood student-facing body updates remain:

1. Week 02 — Week at a Glance;
2. Week 03 — Week at a Glance;
3. Week 04 — Week at a Glance;
4. A6 — Professional Pathway (Week 14 Update);
5. A6 — Professional Pathway (Week 15 Submission);
6. Week 16 — Week at a Glance;
7. Week 16 — Explain / Defend.

The accepted guarded dry-run is exactly:

```text
0 create / 7 update / 233 unchanged / 0 delete
```

No assignment-group changes, creates, deletes, kind changes, duplicate collisions, prune actions, or unsafe scope were proposed.

## Independent review

The live inventory and desired contract agree on:

- 21 modules in canonical order;
- 229 module items / desired objects;
- 81 pages, 32 files, 116 assignments;
- 11 desired weighted assignment groups totaling 100%;
- exactly five recurring groups with `drop_lowest=1`;
- A6/A7/course evaluation presence;
- Week 16 no graded recurring work/checkpoint;
- no module-local duplicate titles;
- no submitted assignment state in Savnac course 8;
- only the expected Test Student and Jeremy teacher enrollments.

The twelfth live assignment group is the unused zero-weight default `Assignments` group and is historical Canvas/Savnac structure, not a current desired grading category.

Targeted Course Foundry tests passed `16/16`; `git diff --check` passed. The dirty Course Foundry checkout was preserved read-only.

## Boundary decision

d04 performed no Savnac write and no production Canvas access. Because the accepted verdict is `EXPECTED_MATERIAL_DELTA`, conditional unit `009_d_05_reconcile_savnac_fixed_point.md` is now required and may be released.

The d05 write authority remains bounded to non-production Savnac course 8 and only the accepted delta after a freshness recheck. Production Canvas remains separately gated at d07 by fresh Jeremy authorization.
