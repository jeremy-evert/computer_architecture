# Computer Architecture Sidecar Prompts

Project-local work orders and design provenance for COMSC-3013 Fall 2026 deployment.

## Active dispatch rule

**Do not manually walk the old 009 prompt chain.** Piper has collapsed the remaining executable work into the current Flo burn:

- `../FLO_BURN.md`
- `../jobs/009_architecture_preflight_to_green_to_write.md`
- `../jobs/009_architecture_production_closeout.md`
- launcher: `../launch_flo.sh`

Current command:

```bash
./sidecar/launch_flo.sh
```

Production remains a separate fresh human gate after accepted `GREEN TO WRITE`:

```bash
./sidecar/launch_flo.sh production
```

## Initiative 009 provenance chain

The historical design chain remains:

`009_a -> 009_b -> 009_c -> 009_d_01 -> 009_d_02 -> 009_d_03 -> 009_d_04 -> 009_d_05 -> 009_d_06 -> 009_d_07 -> 009_d_08 -> 009_e`

| Prompt | Durable status | Purpose now |
|---|---|---|
| `009_a_report_architecture_launch_readiness.md` | ACCEPTED | historical current-truth report |
| `009_b_map_architecture_launch_ready_shape.md` | ACCEPTED | launch-ready end-state design |
| `009_c_plan_architecture_launch_readiness.md` | ACCEPTED | original decomposition |
| `009_d_01_reconcile_canonical_launch_source.md` | ACCEPTED / PROMOTED | canonical source repair provenance |
| `009_d_02_reconcile_current_status.md` | ACCEPTED / PROMOTED | status/navigation repair provenance |
| `009_d_03_validate_current_main_compiler.md` | ACCEPTED / PROMOTED | accepted desired-source/compiler baseline |
| `009_d_04_rebaseline_savnac.md` | ACCEPTED / PROMOTED | accepted read-only Savnac baseline |
| `009_d_05_reconcile_savnac_fixed_point.md` | SUPERSEDED AS DISPATCH | safety requirements consumed by Flo preflight |
| `009_d_06_production_recon_and_target_lock.md` | SUPERSEDED AS DISPATCH | read-only target-lock/diff consumed by Flo preflight |
| `009_d_07_reconcile_production_canvas.md` | SUPERSEDED AS DISPATCH | production reconcile requirements consumed by production Flo job |
| `009_d_08_production_launch_closeout.md` | SUPERSEDED AS DISPATCH | independent closeout requirements consumed by production Flo job |
| `009_e_validate_architecture_launch_readiness.md` | SUPERSEDED AS DISPATCH | final acceptance requirements consumed by production Flo job |

`SUPERSEDED AS DISPATCH` does **not** mean the prompt was wrong or deleted. It means its useful constraints are now carried by one of the two current jobs so Jeremy does not have to relay five separate runs.

## Accepted d03 source/compiler baseline

Accepted d03 proved:

- 21 modules covering Weeks 1–17;
- 229 objects: 81 pages, 32 files, 116 assignments;
- 11 desired assignment groups totaling 100%;
- exactly five recurring groups with `drop_lowest=1`;
- no graded recurring Week 16 work and no Week 16 checkpoint;
- Machine Dossier checkpoints only Weeks 6, 9, 14;
- A6, A7, and course evaluation present;
- zero undeclared omissions;
- zero unresolved link tokens.

Piper later proved no student-facing Architecture source changed between accepted d03 and the pre-capsule current main. Flo preflight still reruns current validation before live-system claims.

## Accepted d04 Savnac baseline

Savnac course 8 was structurally aligned with desired state and had accepted dry-run:

```text
0 create / 7 update / 233 unchanged / 0 delete
```

The seven accepted updates were only:

- Week 02 — Week at a Glance;
- Week 03 — Week at a Glance;
- Week 04 — Week at a Glance;
- A6 — Professional Pathway (Week 14 Update);
- A6 — Professional Pathway (Week 15 Submission);
- Week 16 — Week at a Glance;
- Week 16 — Explain / Defend.

No creates, deletes, group changes, kind changes, topology changes, duplicate cleanup, or prune action belonged to d04.

A later worker branch `golem/009-d05-savnac-fixed-point` records a safe **zero-write STOP** caused by dirty/advanced shared Course Foundry state. It was not an accepted d05 fixed point. Flo preflight now consumes current semantic truth instead of requiring stale shared-SHA equality.

## Current human decision surface

There is no Jeremy policy decision blocking preflight.

The only intended production human gate occurs after canonical preflight evidence contains exactly:

```text
**Verdict:** `GREEN TO WRITE`
```

At that point the separate `production` launcher invocation is fresh authorization only for the bounded Architecture write described by the production job.

## Historical foundation

Prompts 001–008 remain historical provenance and are not the active launch queue.

| Prompt family | Historical status | Durable result |
|---|---|---|
| 001 | IMPLEMENTED / COMPLETE | reconciled source chassis |
| 002 | IMPLEMENTED / COMPLETE | open-source Architecture canon |
| 003 | IMPLEMENTED WITH PLATFORM YELLOWS | reproducible Architecture laboratory |
| 004 | IMPLEMENTED / COMPLETE WITH NAMED YELLOWS | Weeks 5–14 technical core |
| 005 | IMPLEMENTED / VALIDATED | Week 16 shared Farkle + ML |
| 006 | ACCEPTED HISTORICAL SAVNAC FIXED POINT | full Savnac reconcile/read-back using older launch source |
| 007 | CONSUMED BY 006 | validator repair evidence |
| 008 | CONSUMED BY 006 | compiler/policy repair evidence |

For current work, start at `../FLO_BURN.md`, not here.