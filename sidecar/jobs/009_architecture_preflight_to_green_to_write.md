# Flo Job — Architecture Preflight to GREEN TO WRITE

**Owner:** Piper  
**Foreman:** Flo  
**Worksite:** `jeremy-evert/computer_architecture`  
**Shared dependencies allowed when necessary:** `jeremy-evert/course_foundry`, `jeremy-evert/harbor`, `jeremy-evert/foreman_interface`  
**Savnac target:** existing Computer Architecture course `8` only  
**Production target:** SWOSU Canvas Fall 2026 `COMSC-3013-1438`, exact Canvas course id must be freshly discovered  
**Production write authority:** **NOT GRANTED**

## Outcome

Leave Computer Architecture at a truthful, evidence-backed **GREEN TO WRITE** boundary where the only remaining human action is fresh authorization for the already-bounded SWOSU production reconcile.

This is one job. Flo owns decomposition, worker dispatch, inspection, repair/retry, promotion, and continuation. Do not select work from JTT and do not take work from CS1, CS2, DSCT, or another campaign. Jeremy is not the message bus.

## Read first

1. `AGENTS.md`
2. `sidecar/PLANNING.md`
3. `sidecar/FLO_BURN.md`
4. `sidecar/reports/009_d_03_foreman_acceptance.md`
5. `sidecar/reports/009_d_04_foreman_acceptance.md`
6. `sidecar/reports/009_d_04_rebaseline_savnac.md`
7. `sidecar/runs/009_d_04_savnac_rebaseline_receipt.md`
8. historical `009_d_05` and `009_d_06` prompts only as useful prior constraints
9. current Architecture builder/deployer/tests in `course_foundry`
10. canonical Foreman contracts supplied by the launcher.

Inspect prior stopped branch `golem/009-d05-savnac-fixed-point` if it still exists. Its report is evidence that an earlier d05 attempt stopped before external writes because its shared Course Foundry checkout was advanced/dirty. Treat it as a historical stop receipt, not a stale dependency pin.

## Prior evidence to re-prove

Accepted d03/d04 previously established:

- 21 modules covering Weeks 1–17;
- 229 objects: 81 pages, 32 files, 116 assignments;
- 11 desired grading groups totaling 100%;
- exactly five recurring groups with `drop_lowest=1`;
- Machine Dossier checkpoints only Weeks 6, 9, and 14;
- Week 16 shared Farkle/Machine Learning, with no Week 16 checkpoint;
- A6, A7, and course evaluation present;
- zero undeclared omissions and zero unresolved link tokens;
- Savnac course 8 matched desired structural counts;
- Savnac dry-run was `0 create / 7 update / 233 unchanged / 0 delete`;
- those seven updates were only Week 02/03/04 Week-at-a-Glance, A6 Week 14/15, Week 16 Week-at-a-Glance, and Week 16 Explain/Defend;
- no accepted create/delete/group/kind/prune mutation existed;
- no submitted student work existed in Savnac.

Piper subsequently proved Architecture student-facing source did not change after accepted d03 and promoted Course Foundry production support that requires an explicit fresh Architecture target id plus live identity verification before reconcile.

These are leads, not current proof.

## Authority

### Computer Architecture

Flo may read, safely sync, validate, repair, commit, push, and promote Architecture source, tests, validators, reports, receipts, and Sidecar state when evidence proves a repair is necessary. Use isolated worker branches/worktrees and inspect before promotion.

### Course Foundry / Harbor

Flo may read/sync current truth, use isolated clean worktrees, run Architecture compiler/deployer tests, and make a bounded shared repair only if evidence proves the shared layer owns a real blocker. Test, review, promote, and return immediately to Architecture. No broad cleanup/refactor.

### Savnac

Flo may read existing Architecture course `8`. A write is allowed only with `prune=none`, zero creates, zero deletes, no group/kind/topology changes, and updates limited to a subset of the seven bodies accepted by d04. Zero updates is valid if live already equals desired.

### SWOSU production Canvas

**READ ONLY.** Discover the exact Fall 2026 target, inventory it, and produce a semantic dry-run/diff. Do not mutate production in this job.

## Forbidden

- no SWOSU production mutation;
- no guessed/historical production course id;
- no Savnac create/delete/prune/destructive cleanup or write outside course `8`;
- no unexplained Savnac update outside the seven d04-accepted bodies;
- no other course work;
- no JTT mutation/queue selection;
- no stash/reset/clean/overwrite of unexplained shared-worktree dirt;
- no weakening host guards, allowlists, identity checks, submission protections, or reconciliation semantics;
- no secrets/tokens in evidence.

## Execution

### 1. Lock clean current Git truth

Fetch current remote truth for Architecture and required dependencies. Record exact SHAs consumed, inspect repo/worktree state, preserve unexplained local work, and use isolated clean worktrees when shared checkouts are dirty or occupied.

Prove whether Architecture student-facing source changed since accepted d03. Inspect Course Foundry changes since the accepted d04 compiler SHA and classify whether any affect Architecture compilation, Savnac reconciliation, Imprint semantics, Harbor reads, or production deployment.

Historical SHA inequality alone is not a blocker. **Unexplained semantic drift is.**

### 2. Rebuild and validate desired state

Using current canonical source/tooling:

- run the Architecture source validator;
- compile the full desired course;
- run focused Architecture Course Foundry tests and production-deployer tests;
- run broader tests needed to trust changed shared code;
- verify module/object counts, grading groups/weights/drop rules, A6/A7/evaluation, Machine Dossier checkpoints, Week 15 async behavior, Week 16 behavior, Week 17 reflection, links, and omissions.

If a real source/compiler defect appears, repair it at the owning layer, test/commit it, then restart affected validation. Do not carry a known launch-relevant yellow forward.

### 3. Reconcile Savnac course 8 to fixed point

Before write, verify live identity, enrollments, submissions, inventory, duplicates, groups, and current desired diff.

A Savnac write may proceed only if:

- course `8` is still the intended Architecture target;
- no real-student/submission risk exists;
- creates=`0`, deletes=`0`, prune=`none`;
- no group/kind/topology/duplicate-cleanup mutation is proposed;
- every proposed update is one of the seven d04-accepted body objects and resolves to current desired content;
- no other unexplained delta exists.

If current diff is a subset of the seven old updates, apply only that subset. If zero, write nothing. If a new delta appears, classify it and repair source/tooling only when clearly correct; otherwise stop.

After any Savnac write, read back changed objects/invariants and require **two consecutive** guarded dry-runs of `0 create / 0 update / 0 delete`.

### 4. Fresh production target lock, read only

Resolve the exact SWOSU Fall 2026 target for `COMSC-3013-1438` from live evidence. Never infer it from Savnac id `8`, history, another course, or memory.

Prove/reject candidate identity using course id, Computer Architecture name, course/SIS code including `COMSC-3013-1438`, Fall 2026 context, workflow/dates, Jeremy teacher authority, sections/enrollments, and submission state. Ambiguity stops the run read-only.

### 5. Fresh production semantic diff, read only

Compile current desired state for the locked id and compare with live production. Classify modules/order/publication, pages/files/assignments/wiring, grading groups/weights/drop rules, points/submission types/dates, duplicates/orphans, sentinel weeks, links/files, identity/enrollments/submissions, and every create/update/delete/prune action.

Run the generic production dry-run with the locked Architecture `--course-id`. Confirm the deployer refuses Architecture without an explicit id and that its live identity guard passes before reconcile.

**GREEN TO WRITE requires:** exact fresh target identity, green source/compiler/tests, Savnac fixed point, completely understood production diff, no unexpected/destructive delete/prune behavior, desired creates proven nonduplicate, safe enrollment/submission state, no launch-relevant unresolved yellow, and an exact production command using the locked id.

If production already equals desired, record that and continue read-only launch validation. Do not mutate for ceremony.

### 6. Foreman acceptance

Flo independently inspects Wanda evidence before promotion. Write:

`sidecar/reports/009_flo_preflight_to_green_to_write.md`

Include Architecture/dependency SHAs, source/compiler/test results, Savnac before/write/readback/two fixed-point runs, exact production target identity, semantic diff counts/classification, enrollment/submission safety, exact future production command, partial-write stop behavior, commits, yellows, and verdict.

Allowed verdicts:

- `GREEN TO WRITE`
- `NOT GREEN TO WRITE — <precise blocker>`

Update `sidecar/FLO_BURN.md`, `sidecar/PLANNING.md`, and active Sidecar navigation to current truth. Promote accepted Architecture evidence to `main` yourself. Do not ask Jeremy to merge.

## Evidence

Use `sidecar/runs/009_flo_preflight/<UTC_TIMESTAMP>/` for compact receipts: SHAs/drift classification, validator/compiler/tests, Savnac identity/diff/write/readback/fixed-point, production target discovery, production inventory/dry-run diff, and worker handoff/acceptance evidence. Never store credentials.

## Stop conditions

Stop rather than widen scope for: ambiguous production identity; unavailable required credentials/network position; unsafe production student/submission state; Savnac create/delete/prune/group/kind/unrecognized update; unresolved source/policy conflict; destructive/unbounded production delta; or repo state that cannot be isolated safely.

Reduce any human need to one precise gate. Routine Git work, worker dispatch, tests, bounded Savnac reconcile, and production read-only inspection are not human gates.

## DONE

Success requires green current source/compiler/tests, Savnac two-run fixed point, fresh production target lock, bounded current production diff, target-id/identity safety checks, `GREEN TO WRITE`, promoted evidence/status on Architecture `main`, and `sidecar/FLO_BURN.md` showing production as the only remaining burn.

A safe blocked closeout requires zero unauthorized production writes plus durable evidence of the smallest exact blocker and next action.

Flo must **not** execute production during this launch. Production requires a separate fresh `./sidecar/launch_flo.sh production` invocation after Jeremy's explicit authorization.