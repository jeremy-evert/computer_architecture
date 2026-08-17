# Report 006 — Imprint Computer Architecture into Savnac and read it back

**Status:** ACCEPTED 2026-08-17
**Worksite:** `computer_architecture` + `course_foundry` (compiler) + live Savnac course 8
**Owner:** Foreman (Jeremy authorized each live-write step explicitly; no step ran without authorization)

## Source commits inspected/tested

- `computer_architecture` main: `b012e33` (Prompt 008 acceptance record + trailing-slash reference fix)
- `computer_architecture` (Savnac launch content root, `ARCHITECTURE_SOURCE_ROOT`): `computer_architecture_savnac` worktree on `savnac/architecture-launch-readiness` at `36c339f`
- `course_foundry` main: `11a2a2c` (Prompt 008 compiler repair + `--prune-scope` CLI + link-token convergence fix, all merged)

## Prompt 007 receipt

`computer_architecture_savnac/sidecar/runs/architecture_savnac_source_validation_20260817T024432Z.md` — GREEN WITH YELLOWS, real Brandy run on tip `3ab17ba5`, one honest platform-capability yellow, no machine mutation.

## Prompt 008 receipt

`course_foundry/reports/2026-08-16_prompt008_repair_full_semester_compiler_and_dry_run.md` plus two follow-on fixes found and repaired during this prompt's own live migration (see "Real defects found and repaired" below).

## Deployment paths reused

Existing unified `course_foundry.savnac_deploy` CLI (`dry-run`/`push`), Architecture's own `architecture_savnac_desired_course` builder, `imprint.reconcile.push_course`'s existing (previously unwired) `prune_scope` mechanism. No parallel LMS stack built.

## Pre-write partial-course inventory (not a blank slate)

6 modules (71–76), 33 module items, 20 assignments, 11 named assignment groups (weights already correct, 100%) plus 1 unused default group — an earlier partial imprint (shared Week 1 + an older draft of Week 5). Zero students enrolled, zero real submissions on any of the 20 assignments (independently verified per-assignment, not assumed) — confirmed twice, immediately before the migration and again after.

## Real defects found and repaired (read-only investigation surfaced these; none were assumed)

1. **Title-matching duplicate-module bug.** `imprint.reconcile._existing_module_index` keys live modules by name in a plain dict; the old partial imprint had created three modules all named "Computer Architecture Week 1 — Success Foundations" (one per weekday). A live proof (`prune_scope=course` dry-run before any rename) confirmed only one of the three was ever visible to reconciliation — the other two would have been silently orphaned by any prune, not merely stale.
2. **Trailing-slash non-convergence.** Weeks 07/08/10/11's `references.md` cited the same MIT OCW URL with a trailing slash; Canvas silently strips it from stored plain-text on save, so every subsequent dry-run reported a permanent "body changed" with no way to converge. Fixed at the source (`computer_architecture` `b012e33`) since the URL is a citation, not an active hyperlink — dropping the trailing slash changes nothing functionally and matches Canvas's own normalization.
3. **Unresolvable kickoff link tokens.** Two Monday kickoff pages carried `{{link:monday_slides}}` / `{{link:monday_exit_ticket}}` cross-reference tokens that only CS1's bespoke incremental live push can resolve (Architecture's compiler builds a full static plan before any live id exists, unlike CS1's progressive `live_link_map`). Canvas silently stripped the invalid `href` on save, producing a real broken/dead link for students and a second permanent non-convergence source. Fixed by rendering the cross-reference as plain text instead of a fabricated working link (`course_foundry` `8c7c4d2`), with a standing regression test (`test_architecture_kickoff_objects_never_ship_unresolved_link_tokens`).

## Migration executed (Jeremy's explicit authorization, Savnac course 8 only)

1. Freshness re-check immediately before writing: 1 enrollment (Jeremy, Teacher), 6 modules `[71..76]`, 20 assignments, 0 non-empty submissions — no drift from the originally-investigated baseline.
2. Five metadata-only module renames (name field only, `update_module`), preserving Canvas IDs 71–75 and their 33 existing items untouched:
   - 71: "Computer Architecture Week 1 — Success Foundations" → "Monday: Survive This Semester"
   - 72: → "Wednesday: Thrive In Your Degree"
   - 73: → "Friday: Entering Your Career"
   - 74: "Computer Architecture A07 — Advisor (Later)" → "A07 — Advisor (Later)"
   - 75: "Computer Architecture Success Foundations (Optional / Bonus)" → "Success Foundations (Optional / Bonus)"
3. Gate dry-run (`--prune-scope course`) confirmed exactly the intended boundary before any further write: 0 deletes across all 5 renamed Week 1 modules, delete set limited to obsolete module 76 ("Computer Architecture Week 5 — Build the Machine") and its 9 items — no unexplained deletes, no cross-course changes.
4. Live push (`push --prune-scope course --confirm-live`) — first attempt hit a 2-minute host-side command timeout mid-flight (not a Canvas/API failure); confirmed via live inventory that partial progress was safe (idempotent by title, no duplicates, old Week 1 untouched) and resumed with a longer timeout to completion. Final result: 21 created, 6 updated (5 harmless always-refreshed module-metadata touches plus 2 genuine Week 1 page-body syncs), 215 unchanged, 10 deleted. Group weight self-check: 100% across 12 groups.
5. Read-back confirmed: 21 modules exactly matching the canonical plan (positions 1–21, no gaps), Week 1 IDs 905–929 preserved verbatim under their renamed modules, new canonical Week 5 (module 80, IDs 981–994) present, module 76 and its 9 obsolete items gone, no orphans, no duplicates, 229 total module items (matches the compiled plan's own object count exactly), 116 assignments, 12 groups summing to 100%, still 0 submissions and 1 enrollment (no drift during the write).
6. Immediate second dry-run after the migration surfaced 6 non-converging updates (the two defects above, found live, not assumed) — repaired both, re-pushed (0 create / 2 update / 238 unchanged / 0 delete, the one-time transition fixing the previously-broken content), then confirmed the true fixed point twice in a row: **`0 create / 0 update / 240 unchanged / 0 delete`**.

## Grading-group handling and operational-policy provenance

Group weights untouched by this migration (already correct pre-migration; verified unaffected post-migration: 100% across 12 groups, matching `docs/grading-model.md`/Question 003 exactly). No late-penalty or resubmission logic was added to the compiler — Question 003's decision that this lives in Marker/shared pipeline was not reopened.

## Dead-days verification

Unaffected by this migration; already verified accepted under Prompt 008 (Week 16 hard gate: all recurring objects `not_graded`, no 4th checkpoint).

## Rendered read-back verification

Course identity/instructor correct (course 8, "Computer Architecture (COMSC-3013)", Jeremy TeacherEnrollment). Module order/navigation matches the canonical weekly grammar. No zyBooks/premium-tool/GPU requirement introduced by this migration (out of scope for this prompt; Architecture's own zyBooks decision is tracked separately and was not touched here).

## Professor/student walk

Not performed in this pass — zero students enrolled, so a synthetic-student round trip was out of scope for this specific migration; Architecture's own acceptance-battery/dogfood pass remains a separate, future action.

## Immediate re-run/drift behavior

Proven: two consecutive dry-runs after the final fix both returned an identical `0/0/240/0` — a genuine fixed point, not a one-time coincidence.

## Unresolved source/YELLOW items

- Prompt 007's platform-capability yellow (no Python 3.10+/plotting/riscv-cross/pdf-build on Brandy) remains, honestly bounded, course fallback path proven usable.
- The pre-existing, unrelated `test_registry_builds_each_course_from_real_sibling_checkouts` failure (`SourcePaths.defaults()` not respecting `ARCHITECTURE_SOURCE_ROOT`) remains open, tracked separately, out of this prompt's scope.
- No professor/student walk performed (see above) — recommended as a follow-up once real enrollment exists.

## Confirmation

Production SWOSU Canvas and zyBooks were not touched at any point in this prompt. Every live write was to Savnac course 8 only, explicitly authorized by Jeremy at the two write boundaries (renames; push).

## Commits

- `computer_architecture` `b012e33` (trailing-slash reference fix)
- `computer_architecture_savnac` (`savnac/architecture-launch-readiness`) `36c339f` (cherry-picked same fix)
- `course_foundry` `11a2a2c` (merge: link-token convergence fix + `--prune-scope` CLI, on top of `25c8e9b`/Prompt 008's `acdff26`)
- Live Savnac course 8: 5 module renames + 1 push (21 created / 8 updated across two push passes / 10 deleted) + final no-op verification pushes

## Acceptance

All 12 of Prompt 006's acceptance criteria met:
1. Existing course 8 used, not a duplicate.
2. Rendered content is current Git source (verified via the two real defects found and fixed, not merely assumed correct).
3–4. No fabricated/replaced grading policy.
5. Zero-cost/CPU-accessible path unaffected (unchanged by this migration).
6–9. Weekly navigation, technical ending, Week 16 dead-days compliance, and re-run safety all verified.
10. Production Canvas/zyBooks untouched.
11. Established deployment machinery reused (no parallel stack).
12. Jeremy can navigate a coherent, current, duplicate-free course in Savnac.
