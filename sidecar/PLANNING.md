# Computer Architecture - Deployment Planning Board

**Course:** COMSC-3013 Computer Architecture, Fall 2026
**Repository:** `jeremy-evert/computer_architecture`
**Source of truth:** Git
**Current initiative:** 009 - Architecture launch readiness
**Current stage:** d01-d04 accepted/promoted; d05 released
**Next execution gate:** `sidecar/prompts/009_d_05_reconcile_savnac_fixed_point.md`
**Recommended execution seat:** Architecture-local Luna via `sidecar/scripts/009_d_05_launch_savnac_reconcile_luna.sh`

## Mission

Build and launch an online Computer Architecture course where students understand a computer as a connected, measurable system rather than a vocabulary list.

**build the investigator -> build the machine -> open the machine -> stress the machine -> make the architecture decision -> wind down and reflect**

## Accepted current truth

The Fall 2026 Architecture-local source is consolidated on canonical `main` and current Course Foundry compiler validation is accepted.

- Week 1 is consumed from shared semester-kickoff source.
- Weeks 2-4 are authored Architecture-local source.
- Weeks 5-14 are the authored technical Architecture runway.
- Week 15 is asynchronous wind-down/professional pathway.
- Week 16 is shared Farkle + Machine Learning and is not Checkpoint 4.
- Week 17 is reflection/closure.
- Machine Dossier checkpoints exist only Weeks 6, 9, and 14.
- A6, A7, course evaluation, grading doctrine, and launch-source validator are present.

Accepted d03 proves the current desired course:

- 21 modules covering Weeks 1-17;
- 229 objects: 81 pages, 32 files, 116 assignments;
- 11 desired assignment groups totaling 100%;
- exactly five recurring groups with `drop_lowest=1`;
- no graded recurring Week 16 work and no Week 16 checkpoint;
- zero undeclared omissions;
- zero unresolved `{{link:...}}` tokens;
- Architecture tests 8/8 and deployment tests 8/8 passed.

The current 11-group count is authoritative. Savnac also contains one unused zero-weight default `Assignments` group, yielding 12 live groups without changing the desired grading contract.

## Accepted d04 Savnac re-baseline

Read-only Savnac course-8 inventory and guarded dry-run were accepted with verdict:

`EXPECTED_MATERIAL_DELTA`

Live/desired structure agrees on:

- course 8 identity: `Computer Architecture (COMSC-3013)`;
- 21 modules in canonical order;
- 229 module items: 81 pages, 32 files, 116 assignments;
- all 116 assignments with no submitted submissions;
- no module-local duplicate titles;
- 11 desired weighted groups at 100% with correct drop rules;
- only Test Student and Jeremy teacher enrollments.

The accepted dry-run is exactly:

```text
0 create / 7 update / 233 unchanged / 0 delete
```

The seven updates are:

1. Week 02 - Week at a Glance;
2. Week 03 - Week at a Glance;
3. Week 04 - Week at a Glance;
4. A6 - Professional Pathway (Week 14 Update);
5. A6 - Professional Pathway (Week 15 Submission);
6. Week 16 - Week at a Glance;
7. Week 16 - Explain / Defend.

No create, delete, assignment-group change, kind change, duplicate collision, or prune action belongs to the accepted delta.

See:

- `sidecar/reports/009_d_04_rebaseline_savnac.md`
- `sidecar/reports/009_d_04_foreman_acceptance.md`
- `sidecar/runs/009_d_04_savnac_rebaseline_receipt.md`

## Initiative 009 launch path

| Unit | Status | Purpose |
|---|---|---|
| 009_a | ACCEPTED | report current launch truth |
| 009_b | ACCEPTED | map launch-ready end state |
| 009_c | ACCEPTED | plan bounded route |
| 009_d_01 | ACCEPTED / PROMOTED | restore canonical launch source |
| 009_d_02 | ACCEPTED / PROMOTED | reconcile current status/navigation |
| 009_d_03 | ACCEPTED / PROMOTED | validate current-main source + compiler |
| 009_d_04 | ACCEPTED / PROMOTED | read-only Savnac re-baseline; material delta proven |
| 009_d_05 | READY TO EXECUTE | reconcile exactly seven Savnac body updates and prove fixed point |
| 009_d_06 | WAITING ON d05 | read-only production target lock + semantic diff |
| 009_d_07 | HUMAN GATE | production write only after GREEN TO WRITE + fresh Jeremy authorization |
| 009_d_08 | WAITING | independent production closeout |
| 009_e | WAITING | final Foreman launch-readiness validation |

## d05 write boundary

d05 is a guarded **non-production** Savnac write, not the production human gate.

Before write, Luna must reproduce the accepted `0 / 7 / 233 / 0` dry-run with no drift. She may then update only existing Savnac course 8 and only the seven accepted bodies. Creates, deletes, prune, group changes, unexpected enrollment/submission state, or source/compiler drift stop the run before write.

After write, d05 must read back course 8 and produce two consecutive guarded no-op dry-runs.

## Remaining launch gates

### Gate 1 - Savnac current fixed point
Run d05. Accept only if current Savnac reaches zero create/update/delete on two consecutive post-write dry-runs.

### Gate 2 - Production target lock and semantic diff
Run d06 read-only. Resolve the exact Fall 2026 `COMSC-3013-1438` production Canvas ID from live evidence. Never guess or reuse Savnac course id 8.

### Gate 3 - Production write
Run d07 only after d06 returns `GREEN TO WRITE` and Jeremy gives fresh execution-time authorization.

### Gate 4 - Independent closeout
Run d08 read-only, then `009_e` final Foreman validation.

## Named non-blocking yellows

Brandy lacks some optional/full laboratory capabilities; the committed required/fallback path is validated. Course Foundry has substantial pre-existing dirt and remains read-only during Architecture validation/write gates.

## Dispatch rule

Use this board for current launch state and `sidecar/prompts/README.md` for bounded dispatch. Historical prompts/reports remain provenance, not the active queue.

**The next executable Architecture unit is `009_d_05_reconcile_savnac_fixed_point.md`.**
