# Computer Architecture — Flo Burn

This is the active executable burn list for Initiative 009.

Old `009_d_05` through `009_e` prompts remain durable design/provenance. They are **not** five separate human dispatches anymore. Piper collapsed their remaining runtime intent into the two jobs below.

## 1. PRE-FLIGHT — current burn

**Launch:**

```bash
./sidecar/launch_flo.sh
```

**Job:** `sidecar/jobs/009_architecture_preflight_to_green_to_write.md`

**Outcome:** current Git/compiler tests green; Savnac course 8 reconciled to a two-run fixed point; exact SWOSU Fall 2026 `COMSC-3013-1438` Canvas id freshly locked; production semantic diff freshly proved and bounded; Foreman verdict `GREEN TO WRITE`.

**Worksite:** `computer_architecture`, with `course_foundry`, `harbor`, and `foreman_interface` only when Architecture genuinely depends on them.

**Authority:** Architecture/source/test/report repair; bounded shared-tool repair when proven; Savnac course 8 updates only inside the accepted d04 body-update envelope; SWOSU Canvas read-only.

**Forbidden:** any SWOSU mutation; guessed production id; Savnac create/delete/prune/group/kind/topology changes; other courses; JTT; broad shared cleanup.

**Preconditions:** current source/dependency truth must be re-established in clean/isolated worktrees; accepted d03/d04 are evidence, not blind pins.

**Validation:** current desired model and tests; Savnac readback plus two consecutive no-op dry-runs; fresh production identity + read-only semantic diff; Architecture production deployer's explicit-id/live-identity guards.

**Evidence:** `sidecar/reports/009_flo_preflight_to_green_to_write.md` and `sidecar/runs/009_flo_preflight/<UTC_TIMESTAMP>/`.

**Stop:** ambiguous production target; unsafe enrollments/submissions; Savnac delta outside bounded envelope; destructive/unexplained production plan; unresolved source/policy conflict; unavailable credentials/network position.

## 2. PRODUCTION — waiting on explicit human gate

**Launch after accepted GREEN TO WRITE:**

```bash
./sidecar/launch_flo.sh production
```

**Job:** `sidecar/jobs/009_architecture_production_closeout.md`

**Outcome:** fresh target/diff gate passes; exact accepted Architecture desired state is reconciled to the one locked SWOSU course; independent readback and independent student-path closeout pass; final verdict `GREEN — PRODUCTION DEPLOYED AND LAUNCH-CLOSED`.

**Worksite:** `computer_architecture`, with current `course_foundry` deployer as the bounded production mechanism.

**Authority:** only the exact production content/configuration write accepted by preflight and re-proved by the production freshness gate. The production launcher invocation is the fresh explicit human authorization for that bounded write.

**Forbidden:** other courses; target replacement/guessing; cross-list changes; unexplained delete/prune/destructive cleanup; broader production changes; JTT; a silent second corrective production write after independent closeout.

**Preconditions:** latest promoted preflight verdict is exactly `GREEN TO WRITE`; fresh `production` launcher authorization; same locked target; same bounded semantic plan; current source/tooling/tests and live enrollment/submission safety still hold.

**Validation:** guarded generic production deploy; independent API readback; no remaining semantic delta; independent d08-style student path; final cold 009e-style Foreman acceptance.

**Evidence:** `sidecar/reports/009_d_07_reconcile_production_canvas.md`, `sidecar/reports/009_d_08_production_launch_closeout.md`, `sidecar/reports/009_e_validate_architecture_launch_readiness.md`, and `sidecar/runs/009_flo_production/<UTC_TIMESTAMP>/`.

**Stop:** any freshness/material-delta change, ambiguous target, changed submission risk, partial-write ambiguity that cannot be safely reduced to the same idempotent operation, closeout defect requiring another write, or unavailable credentials/network position.

## Human surface

There is no human decision required to run preflight.

After preflight says `GREEN TO WRITE`, the only intended human gate is:

> Piper, production write authorized. Launch Flo.

Operationally that authorization is consumed by running:

```bash
./sidecar/launch_flo.sh production
```

The launcher records that this invocation authorizes only the bounded Architecture production job. It does not authorize another course or a wider mutation.