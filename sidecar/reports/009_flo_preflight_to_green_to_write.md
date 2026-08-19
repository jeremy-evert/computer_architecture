# Initiative 009 — Flo preflight to GREEN TO WRITE

**Foreman:** Flo (fresh Sonnet shift, 2026-08-19)
**Job:** `sidecar/jobs/009_architecture_preflight_to_green_to_write.md`
**Mode:** `preflight` (production remains read-only in this job)
**Evidence:** `sidecar/runs/009_flo_preflight/20260819T115719Z/`

## Summary

Current Architecture/Course Foundry source and tests are green (one real,
narrow shared-layer compiler defect was found and repaired). Savnac course 8
was reconciled to a proven two-run fixed point, with Jeremy's explicit
authorization for the exact bounded write. The exact Fall 2026 SWOSU
production target (course id `75249`, `COMSC-3013-1438`) was freshly and
unambiguously locked from live evidence, and its full semantic diff against
current desired state is bounded, additive-only, and completely understood.
No SWOSU production write occurred.

## 1. Git/source truth

| checkout | SHA | state |
|---|---|---|
| computer_architecture | `c3f795f53e35763578ff4206d4a8dd3bbf4ad9d5` | clean, == origin/main |
| course_foundry | `50801ff…` → repaired → `969b50aa7f07dedb96049103f52b8bcc9fa0ac5c` | promoted to origin/main by Flo |
| imprint | `7745fe1c1819a2c39c1b3ef488cde450a3ba8cf0` | clean |
| semester_kickoff_week | `ca9d60f62da10d7789c68e398c41670a07a0e00d` | clean; drift vs d04 is Monday Beamer deck only, not consumed markdown source |
| ai_fluency | `022262cf207c28a9504425779a24247ddcf66884` | clean, same as d04 |
| professional_minds | `af54438aeb4bddbbceed4524bc10379b0b9d5a3c` | clean, same as d04 |
| harbor | local `5d69e3e…` / origin `91c1e40…` | pre-existing dirty/diverged; used read-only only |

Full table and drift classification: `00_sha_table.md`.

The shared `course_foundry` checkout at `/mnt/brandy_nvme/jevert/git/course_foundry`
was pre-existing dirty (uncommitted DSCT/submission-listener work, hundreds
of untracked report/receipt files) and diverged 2 ahead / 3 behind origin.
That dirt belongs to concurrent DSCT/CS1 work and was preserved untouched.
All Architecture compiler/test/deploy execution instead used an isolated
worktree, `course_foundry-flo009-preflight`, checked out at clean
`origin/main`.

Architecture student-facing source has not changed since accepted d03/d04;
`computer_architecture` main is unchanged from the last accepted state.

## 2. Source/compiler/test gate — GREEN

- Source validator: GREEN WITH NAMED YELLOWS (same host-capability yellows
  as d03/d04; Week 3 fallback covers them).
- Focused Architecture/Savnac/production-deploy tests: **46 passed** (45
  pre-existing + 1 new regression test added by this shift's repair).
- Broader Course Foundry suite (`tests/`): **761 passed, 5 failed** — the 5
  failures are pre-existing, CS1-only (submission-listener config drift and
  CS1 pilot-assignment monkeypatch), verified by grep to contain no
  Architecture/course-8 reference. Unchanged in count before/after repair.
- `git diff --check`: pass (both repos).

Full detail: `01_source_compiler_tests.md`.

### Shared-layer repair (authorized by Jeremy)

`course_foundry.architecture_desired_course.architecture_savnac_desired_course()`
hard-rejected any `course_id != 8`, but the production deployer's
`_build_architecture` calls this same function with a freshly locked
*production* id — making the job's required production dry-run impossible
to run at all. Repaired by dropping the stale guard (redundant for Savnac,
which already pins its id via its own registry) and adding
`test_architecture_builder_accepts_explicit_non_savnac_course_id`, which
exercises the real builder (not a monkeypatched stand-in) end-to-end.

- Branch `golem/009-flo-architecture-production-id-fix`, commit
  `969b50aa7f07dedb96049103f52b8bcc9fa0ac5c`.
- `origin/main` was fetched before promotion and found unchanged since the
  worktree's base (`50801ff`) — clean fast-forward, no drift, no force.
- Promoted to `jeremy-evert/course_foundry` `main`.

## 3. Savnac course 8 — fixed point proven

Pre-write dry-run matched the seven d04-accepted bodies exactly (verified
object-by-object, not just the summary tally). Jeremy explicitly authorized
this exact bounded write. Write applied:

```
0 create / 7 update / 233 unchanged / 0 delete
```

Independent readback (separate API calls) confirmed: 21 modules, 229 items
(81/32/116), 12 assignment groups totaling 100% with the correct 5
`drop_lowest=1` groups, 0 assignments with submissions, only the expected
Test-Student + Jeremy enrollments, and fresh `updated_at` timestamps on all
seven changed objects.

Two consecutive fixed-point dry-runs both returned:

```
0 create / 0 update / 240 unchanged / 0 delete
```

Full detail: `02_savnac_reconcile.md`.

## 4. Fresh production target lock — exact, unambiguous

Discovered via live read-only Canvas search (128 teacher courses), filtered
to Architecture-name/`3013`/`1438` candidates, and converged on the sole
Fall 2026 match:

**course id `75249`** — `Fall 2026 Computer Architecture (COMSC-3013-1438)`,
course_code `COMSC-3013-1438.2026FA`, term `Fall 2026`, `workflow_state`
`unpublished`, Jeremy holds `TeacherEnrollment`.

Eight historical decoys (2016–2021 sections) were evaluated and rejected by
term mismatch. The production deployer's own live-identity guard
independently confirmed the same target before building any plan, and still
refuses Architecture with no explicit `--course-id`.

Full candidate table: `03_production_target_lock_and_diff.md`.

## 5. Fresh production semantic diff — bounded and understood

```
Dry-run plan: course=75249 label='Computer Architecture'; 229 objects, 21 modules, 11 grading groups
Reconcile summary: create=225, update=6, skip=25, delete=0
```

- 225 creates are purely additive: 16 new modules (Week 02–17) and their
  209 objects. Zero title collisions with any live page/assignment
  course-wide (independently cross-checked).
- 6 updates are safe: 5 assignment-group `drop_lowest` additions (weight
  total remains 100%) and 1 page body refresh on the shared Week-1 page,
  the same class of drift already proven safe on Savnac course 8.
- 0 deletes/prunes proposed or evaluated.
- 6 real `StudentEnrollment` students are present (not test/view
  enrollments), with 0 submissions on any of the 27 live assignments. The
  proposed plan does not touch, orphan, or risk any of them.
- Course `workflow_state` remains `unpublished`, so neither existing nor
  newly-created item-level `published=true` content is visible to those
  students regardless of this diff.
- **Named yellow, not a blocker:** 7 leftover placeholder modules
  (`Week 2 and 3` … `Week 16`, zyBook-chapter-style content) predate the
  finalized 21-module curriculum and are outside the current desired plan.
  `prune_scope=none` leaves them completely untouched — no create, update,
  or delete references them. Per the job's own prune-provenance rule,
  "not in desired state" is not itself permission to delete; any future
  cleanup of that leftover content is a separate, explicitly authorized
  decision, not part of this preflight or its bounded production-write
  precondition.

Full classification (12-point diff table): `03_production_target_lock_and_diff.md`.

Exact future production command:

```bash
python -m course_foundry.production_deploy push \
  --course architecture --course-id 75249 \
  --prune-scope none --confirm-live
```

## 6. Promotion and Sidecar state

- Architecture repo: no source changes were needed; this report and its
  evidence directory are the only new paths, committed and pushed to
  `main` directly by Flo (fast-forward).
- Course Foundry: shared repair promoted to `main` as described in §2.
- `sidecar/FLO_BURN.md` and `sidecar/PLANNING.md` updated to reflect
  production as the only remaining burn (see those files).

## Remaining yellows (non-blocking)

1. Host `archlab doctor` capability gaps (same as d03/d04; Week 3 fallback
   covers them).
2. 5 pre-existing CS1-only test failures, unrelated to Architecture.
3. 7 leftover legacy placeholder modules in production course 75249,
   untouched by the bounded plan; cleanup is a future, separately
   authorized decision.

None of these are launch-relevant to Architecture's production write.

## Verdict

**Verdict:** `GREEN TO WRITE`
