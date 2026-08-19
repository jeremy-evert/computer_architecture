# Flo Job — Architecture Production Reconcile and Launch Closeout

**Owner:** Piper  
**Foreman:** Flo  
**Worksite:** `jeremy-evert/computer_architecture`  
**Shared dependency allowed when necessary:** `jeremy-evert/course_foundry`  
**Production target:** exact SWOSU Fall 2026 `COMSC-3013-1438` Canvas id accepted by the latest preflight report  
**Mode:** authorization proof → freshness gate → bounded production reconcile → independent readback/closeout → final Foreman validation  
**Production authority:** granted only by the fresh `./sidecar/launch_flo.sh production` invocation that started this shift

## Outcome

Reconcile the accepted current Computer Architecture desired state into the one freshly locked SWOSU production course, independently read it back, prove the student-facing launch state, and leave the 009 campaign with a truthful final verdict.

This is one production job. Flo owns dispatch, inspection, retry decisions within the exact bounded plan, evidence, and promotion. Do not select work from JTT or touch another course.

## Preconditions — all are mandatory before mutation

Read and independently verify:

1. `AGENTS.md`
2. `sidecar/PLANNING.md`
3. `sidecar/FLO_BURN.md`
4. `sidecar/reports/009_flo_preflight_to_green_to_write.md`
5. current `course_foundry/course_foundry/production_deploy.py` and relevant tests
6. historical `009_d_07`, `009_d_08`, and `009_e` prompts only for their safety/validation requirements
7. canonical Foreman contracts supplied by the launcher.

Before any production write require:

- the preflight report exists on canonical Architecture `main` with verdict exactly `GREEN TO WRITE`;
- the launch injected a fresh explicit production authorization statement for this bounded job;
- exact Architecture and Course Foundry SHAs are recorded;
- current source/compiler/tests still validate;
- exact Canvas target id equals the accepted preflight target id;
- live identity still proves Computer Architecture / `COMSC-3013-1438` / Fall 2026 / Jeremy teacher authority;
- current enrollment/submission state is still safe;
- a fresh production dry-run still matches the accepted semantic plan with no new destructive or unexplained drift.

If any mandatory precondition fails, **STOP BEFORE MUTATION**. Do not reinterpret the launch as permission to widen scope.

## Authority

### Allowed

- Read/safely sync Architecture and Course Foundry current truth while preserving unrelated local work.
- Use isolated clean worktrees/worker branches.
- Dispatch bounded Wandas and inspect their receipts.
- Mutate only the exact locked production Architecture Canvas course and only the desired managed content/configuration proven by the accepted preflight plus fresh matching dry-run.
- Use the generic guarded Course Foundry production deployer with explicit Architecture target id and explicit live confirmation.
- Perform bounded idempotent retry of the **same already-authorized desired operation** only when readback makes the retry unambiguous and safe.
- Repair a deterministic source/shared-tool defect only if it is discovered **before** the production write and doing so does not invalidate the accepted production semantic diff. If the desired production delta changes materially, stop and return to preflight instead of carrying the old authorization forward.
- After the write, perform read-only verification, independent student-path/readback closeout, reports, receipts, commits, and promotion.

### Forbidden

- no other Canvas course;
- no guessed/replacement target id;
- no cross-list or section-topology mutation;
- no unexplained delete/prune/destructive cleanup;
- no course-level publication/workflow change unless the accepted preflight explicitly included and justified it;
- no `--skip-files` or other verifier bypass unless the accepted preflight explicitly documented a proven Architecture-specific verifier defect and the report defines the alternate direct proof;
- no widening into shared refactoring;
- no JTT mutation/queue selection;
- no second or different production mutation after closeout finds a defect; closeout defects return to a new bounded preflight/write cycle;
- no credentials/tokens in evidence.

## Execution

### 1. Freshness gate

Fetch current remote truth and inspect local repo/worktree state. Preserve unexplained dirt and use clean isolated worktrees if necessary.

Re-run enough current validation to prove the desired model consumed by the preflight is still authoritative. At minimum confirm the Architecture source/compiler sentinel contract and production-deployer Architecture safety tests.

Read the exact preflight target and accepted production diff. Then re-read live target identity, teacher authority, sections/enrollments/submissions, and run a fresh dry-run.

The write may proceed only if the fresh plan is semantically the same bounded operation accepted by preflight. A lower update/create count is acceptable only when direct readback proves some accepted desired changes are already present and no new action appears. Any new object, changed object identity, delete/prune, unexpected duplicate, target change, new submission risk, or material desired-state change stops the write and sends the campaign back through preflight.

### 2. Execute the one guarded production reconcile

Use the current generic deployer, not an Architecture-specific loader. The normal command shape is:

```bash
python -m course_foundry.production_deploy push \
  --course architecture \
  --course-id <FRESHLY_LOCKED_ID> \
  --prune-scope none \
  --confirm-live
```

Use required source-path overrides only when the clean worktree topology requires them. Record the exact executed command with secrets omitted.

The deployer must pass its production-host gate, one-course allowlist, explicit Architecture id requirement, and live Architecture identity check before reconciliation.

Do not add force flags or broaden prune scope to make the write succeed.

### 3. Partial-write / failure behavior

Canvas reconciliation is not assumed transactional. There is no blind rollback ritual.

If the process errors or network state becomes ambiguous after mutation may have started:

1. stop further mutation;
2. independently read the locked course back;
3. determine which accepted desired changes are definitely present, absent, or ambiguous;
4. record the partial state and raw response evidence;
5. retry only when the same idempotent desired operation is fully understood and no new destructive/unbounded action is introduced;
6. otherwise stop with a precise human/technical gate.

Never attempt a broad delete/recreate rollback. Preserve student/instructor state first.

### 4. Immediate independent readback

After a successful reconcile:

- read the production course independently of the mutation result object;
- verify exact target identity again;
- verify modules/order/publication, pages/files/assignments/wiring, assignment groups/weights/drop rules, points/submission types/dates, and the preflight's named sentinel objects;
- verify no unexpected duplicates/orphans/zombies appeared;
- rerun guarded production dry-run and require no remaining material desired-state delta;
- if current tooling has a known verifier limitation, use the direct proof accepted by preflight and disclose it.

If the post-write dry-run oscillates or proposes deterministic repeat updates, treat that as a real defect. Do not declare fixed point.

### 5. Independent production launch closeout

Dispatch a fresh read-only Wanda/focus that did **not** perform the mutation to execute the intent of historical d08:

- enter through the real course landing path;
- inspect Week 1 entry/orientation;
- walk Week 2 and representative technical weeks;
- inspect Weeks 14, 15, 16, and 17;
- verify due dates/availability/submission behavior and grading-group placement;
- verify required links/files are reachable;
- verify student-visible publication/navigation state;
- verify the online/asynchronous assumptions embodied by current source;
- inspect duplicates/zombies and obvious instructor-only artifacts that would confuse students.

Use test-student/student-view facilities where safe and available. This stage is read-only. If it finds a defect requiring mutation, stop and report it. Do not silently perform a second production correction under the old authorization.

Write:

`sidecar/reports/009_d_08_production_launch_closeout.md`

with verdict only:

- `LAUNCH-CLOSED`
- `RED — <precise blocker>`

### 6. Production reconcile report

Write:

`sidecar/reports/009_d_07_reconcile_production_canvas.md`

Include:

- production authorization provenance and timestamp injected by the launcher;
- exact locked target id/identity;
- Architecture/Course Foundry SHAs;
- freshness checks;
- accepted pre-write semantic delta;
- exact command;
- actual create/update/delete/skip counts;
- partial-write/retry history if any;
- independent readback;
- post-write dry-run/fixed-point result;
- remaining yellows/blockers;
- evidence paths.

### 7. Final 009 Foreman validation

After and only after d07 production reconcile evidence is sound and d08 says `LAUNCH-CLOSED`, perform the cold acceptance intent of historical `009_e` across the current evidence chain.

Write:

`sidecar/reports/009_e_validate_architecture_launch_readiness.md`

Final allowed verdicts for this production job:

- `GREEN — PRODUCTION DEPLOYED AND LAUNCH-CLOSED`
- `RED — <precise blocker>`

Do not use `GREEN TO WRITE` after a production launch has been attempted; that belongs to preflight.

Update `sidecar/FLO_BURN.md`, `sidecar/PLANNING.md`, and active Sidecar navigation. Promote accepted Architecture reports/status to canonical `main` yourself. Do not ask Jeremy to merge worker branches.

## Evidence

Use:

`sidecar/runs/009_flo_production/<UTC_TIMESTAMP>/`

Capture compact receipts for:

- launcher authorization provenance/time;
- Git SHAs/current validation;
- target identity and freshness state;
- fresh pre-write dry-run;
- exact mutation command and result;
- direct post-write inventory/readback;
- post-write dry-run/fixed-point proof;
- grading/link/file/sentinel checks;
- independent closeout worker evidence;
- worker handoff and Foreman acceptance evidence.

Never store secrets.

## Stop conditions

Stop rather than improvise if:

- preflight is not currently `GREEN TO WRITE`;
- fresh production authorization is absent;
- target identity changes or becomes ambiguous;
- enrollment/submission risk materially changes;
- current desired state or semantic delta materially differs from preflight;
- an unexpected create/delete/prune/destructive change appears;
- a partial write cannot be safely/readably reduced to the same idempotent desired operation;
- independent closeout finds a defect requiring another production mutation;
- credentials/network privilege are unavailable;
- unexplained repository state cannot be isolated safely.

## DONE

### Successful closeout

- the fresh authorization/freshness gates passed;
- only the exact locked Architecture production course was mutated;
- the accepted desired reconcile completed;
- independent readback and post-write dry-run show fixed point;
- independent launch closeout says `LAUNCH-CLOSED`;
- final 009e verdict is `GREEN — PRODUCTION DEPLOYED AND LAUNCH-CLOSED`;
- evidence/status are committed, pushed, and promoted to Architecture `main`;
- `sidecar/FLO_BURN.md` is empty of executable launch work.

### Safe blocked closeout

- no unauthorized or widened production mutation occurred;
- live partial state, if any, is documented by readback;
- final report says `RED` with the smallest exact next gate;
- evidence is durable and pushed.

Do not write Piper's Owner after-action judgment. Piper/Olivia evaluate the Foreman evidence afterward.