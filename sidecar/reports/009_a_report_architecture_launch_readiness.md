# Report 009a — Current Computer Architecture launch truth

**Status:** ACCEPTED EVIDENCE BASELINE  
**Date:** 2026-08-17  
**Initiative:** `sidecar/prompts/009_architecture_launch_readiness_lifecycle.md`  
**Prompt:** `sidecar/prompts/009_a_report_architecture_launch_readiness.md`  
**Mode:** GitHub/read-only evidence reconstruction. No Savnac or production Canvas writes. No shared-repository mutation.

## Executive verdict

Computer Architecture is **not an underbuilt course waiting for wholesale authoring**. The technical course, grading doctrine, laboratory, Week 16 shared experience, and a previously assembled full-semester launch source have substantial evidence behind them.

But the repository currently has a more serious truth problem than the stale planning board suggests:

> **The exact source tree that reached a clean Savnac fixed point is not the current `main` source tree.**

Prompt 006 explicitly used the separate `savnac/architecture-launch-readiness` worktree as `ARCHITECTURE_SOURCE_ROOT`. Current `main` does not contain the early-week/closing-week packages and assignment/evaluation source that the full-semester compiler expects. The launch branch still exists and is currently **diverged** from `main`: it is 8 commits ahead and 28 commits behind the present `main` tip. A direct compare shows branch-only launch source including Weeks 2–4, Week 15, Week 17, A6/A7 assignments, the course-evaluation source, the launch validator, and launch receipts.

Therefore the next job is not “push Architecture to Canvas.” The next job is to **reconcile the proven launch source back into the authoritative current course branch without losing later course truth**, then perform a CS1-102-style production reconnaissance against that reconciled source.

The course is academically far ahead of the old status prose, while production launch readiness is still unproven.

---

## 1. Repository identity and evidence point

Repository: `jeremy-evert/computer_architecture`  
Default branch: `main`  
Initiative-009 prompt tip used while producing this report: `9cb124aebd50ae6cd1c26a10811d64bbd4c6af07`  
Last course-content commit before Initiative 009 began: `6dacff20cc275670a3a56bb2914a433a3e74c49c` (`Canonize Architecture professional evidence pathway`)

This execution seat is the GitHub connector, not a local checkout. It can establish remote branch/file/commit truth, but it cannot truthfully claim a local worktree is clean or run local `git diff --check`/pytest. Those checks belong to later mutable/local units.

### Principal evidence inspected

Computer Architecture:

- `AGENTS.md`
- `README.md`
- `course_metadata.yaml`
- `docs/grading-model.md`
- `docs/professional-pathway.md`
- `planning/week-15.md`
- `planning/week-17-finals.md`
- `sidecar/README.md`
- `sidecar/PLANNING.md`
- `sidecar/prompts/README.md`
- `sidecar/questions/001_zybooks_decision_for_architecture.md`
- `sidecar/questions/002_zybooks_isa_product_and_course_role.md`
- `sidecar/questions/003_assessment_and_grading_contract.md`
- `sidecar/reports/005_build_farkle_ml_architecture_capstone.md`
- `sidecar/reports/006_imprint_architecture_to_savnac_and_read_back.md`
- branch-only `sidecar/reports/006_savnac_ship_readiness.md`
- current `weeks/`, `docs/`, `planning/`, and `sidecar/runs/` directory state
- compare: `main...savnac/architecture-launch-readiness`

Sibling/shared evidence:

- `computer_science_1/START_HERE.md`
- `computer_science_1/sidecar/prompts/102_cs1_online_launch_recon_and_target_lock.md`
- `computer_science_1/sidecar/reports/102_cs1_online_launch_recon_and_target_lock.md`
- `course_foundry/course_foundry/architecture_desired_course.py`
- Foreman Interface Initiative 008 lifecycle doctrine.

---

## 2. Current-truth matrix

| Area | Classification | Current truth |
|---|---|---|
| Course identity / modality / calendar | `GREEN_IMPLEMENTED` | `course_metadata.yaml` pins COMSC-3013, Fall 2026, section `COMSC-3013-1438`, online/asynchronous, Aug 17–Dec 11, with M/W/F 2 PM only as Jeremy's production cadence. |
| Week 1 shared kickoff | `GREEN_PROVEN` | Architecture compiler composes shared kickoff rather than cloning it; Prompt 006 preserved/read back the five established kickoff modules in Savnac. |
| Weeks 2–4 investigator runway | `YELLOW_STALE_STATUS` + source-integration blocker | Student-facing packages were authored and used from `savnac/architecture-launch-readiness`, but they are absent from current `main`. They are not “never built”; they are **not integrated into authoritative main**. |
| Weeks 5–14 technical core | `GREEN_PROVEN` | Durable week packages exist on main; Prompt 004 campaign and continuity/release evidence established the technical runway with named platform yellows. |
| Week 15 wind-down / pathway | `YELLOW_STALE_STATUS` + source-integration blocker | Planning doctrine and current professional-pathway doctrine exist on main, while the compiled Week-15 package and A6 source used for launch live on the launch branch and are absent from main. |
| Week 16 Farkle + ML | `GREEN_PROVEN` | Prompt 005 reports required path GREEN with real Brandy CPU receipt; no Checkpoint 4 and no dead-days graded Architecture continuation. |
| Week 17 reflection / closure | `YELLOW_STALE_STATUS` + source-integration blocker | Main still carries a planning shell saying operational authoring remains; the actual Week-17 package and A7 final-reflection source used by the launch compiler are branch-only. |
| Grading weights / groups | `GREEN_PROVEN` | Question 003 and `docs/grading-model.md` resolve 100%; Course Foundry compiler asserts the group total and encodes the same family. Prompt 006 read back 12 groups totaling 100%. |
| Drop-lowest | `GREEN_PROVEN` | Question 003 resolves `drop_lowest=1` for the five recurring categories; compiler encodes those values. |
| Due-time convention | `GREEN_PROVEN` at compiler-contract level | Question 003 resolves 11:59 PM Central where a source gives a day but no clock; compiler also carries explicit holiday/dead-day exceptions. |
| Late work ownership | `GREEN_IMPLEMENTED` doctrine | Marker owns late-penalty policy; Architecture/Course Foundry must not invent a second schedule. |
| Resubmission | `GREEN_IMPLEMENTED` doctrine | Always allowed; highest score retained. Shared grading pipeline owns mechanics. |
| Machine Dossier | `GREEN_PROVEN` | Persistent artifact and checkpoints 1/2/3 are established through Week 14; no Week-16 continuation. |
| Zero-cost / open required path | `GREEN_IMPLEMENTED` | No required zyBooks, commercial text, paid AI/CLI, GPU, or private infrastructure. Questions 001/002 are resolved/closed. |
| Lab substrate | `YELLOW_EVIDENCE_LIMIT` | Linux required path has executed evidence. WSL2/macOS/container and optional hardware claims remain intentionally bounded yellows, not evidence that core lessons are placeholders. |
| Full-semester desired-course compiler | `GREEN_PROVEN` for launch-source snapshot, `RED_BLOCKER` for current main-as-source | `architecture_desired_course.py` composes Weeks 1–17 and declares no omissions, but it directly reads `weeks/week-02` through `week-17`, A6/A7, and `docs/course-evaluation.md`. Those required files are not all on current main. |
| Savnac fixed point | `GREEN_PROVEN` for Prompt-006 snapshot | Prompt 006 read back 21 modules, 229 module items, 116 assignments, 12 weighted groups and reached `0 create / 0 update / 240 unchanged / 0 delete` twice after repairing real convergence defects. |
| Current main → Savnac equivalence | `UNKNOWN_REQUIRES_LIVE_RECON` and structurally impossible to assume | Prompt 006 used the launch worktree, not current main. Later main changes plus unmerged launch-source files mean the old fixed point is historical evidence, not proof of today's main desired state. |
| Production Canvas target identity | `UNKNOWN_REQUIRES_LIVE_RECON` | Section metadata identifies `COMSC-3013-1438`, but no accepted evidence inspected here locks the exact production Canvas course id via live read-only discovery. |
| Desired-vs-production semantic diff | `UNKNOWN_REQUIRES_LIVE_RECON` | No accepted Architecture equivalent of CS1 Prompt 102 was found. |
| Professor/student-view dogfood | `YELLOW_EVIDENCE_LIMIT` | Prompt 006 explicitly did not perform a professor/student walk because Savnac had zero student enrollments. |
| Production write | `RED_BLOCKER` by authority/evidence | Not authorized by Initiative 009, and source/target/diff are not yet proven against current canonical source. |
| Final launch closeout | `UNKNOWN_REQUIRES_LIVE_RECON` | No Architecture equivalent of the CS1 post-write Prompt 104 evidence exists yet. |

### Key interpretation

The “red” in this report is **not** “the course is academically broken.” It is a source-control/launch-control red:

- authoritative `main` does not yet contain the complete source set that produced the accepted full-semester Savnac state;
- production target/diff/closeout have not been independently locked.

That is a much smaller and more tractable problem than rebuilding the semester.

---

## 3. Stale-truth inventory

### `sidecar/PLANNING.md`

Stale claims include:

- Weeks 1–4 OUTSTANDING;
- Weeks 15–17 OUTSTANDING;
- grading operational mechanics OUTSTANDING;
- Savnac/deployment WAITING;
- Gate 4 complete-course Savnac dogfood WAITING;
- Prompt 005 is the next numbered prompt.

Newer evidence:

- Prompt 005 is implemented/validated;
- Question 003 closes grading operations;
- launch-branch source implements Weeks 2–4, 15, 17 and A6/A7/evaluation;
- Prompt 006 performed the full Savnac migration and proved a fixed point.

Risk: **HIGH misdispatch risk.** A cold Foreman could order already-completed authoring or wait on gates that have already been passed.

Repairability: repo-local and safe after the launch-source reconciliation establishes which branch state is authoritative.

### `sidecar/prompts/README.md`

Stale claims include:

- Prompt 007 waiting on Brandy acceptance;
- Prompt 008 requiring unresolved policy reconciliation;
- Prompt 006 waiting on accepted 007/008.

Newer evidence: Prompt 006's accepted report explicitly cites the accepted 007 receipt, Prompt 008 repair evidence, resolved grading policy, and completed Savnac migration.

Risk: **HIGH queue risk.** This file currently points a worker backward through already-consumed dependencies.

Repairability: repo-local, but update it after Initiative 009 records the launch-branch integration seam so the new queue does not erase that truth.

### root `README.md`

Its “Current readiness” section still says:

- due/late operational mechanics need finalization;
- full Week 5–14 authoring remains;
- grading operations and Savnac rendering remain;
- Prompt 004 is merely unblocked.

Newer evidence: all of those claims have later accepted work behind them.

Risk: **MEDIUM/HIGH orientation risk.** The repository's front door currently describes an older project state.

Repairability: repo-local after source reconciliation.

### `planning/week-17-finals.md`

It says the final reflection object/due mechanics still need operational authoring. The launch branch contains `assignments/A7-final-reflection.md`, a Week-17 package, and the full compiler pins the final-reflection object/due time.

Risk: **MEDIUM source ambiguity.** The planning shell and proven launch source disagree because the latter never returned to main.

Repairability: reconcile branch source first, then reduce the planning file to durable doctrine/current pointer rather than historical TODO language.

---

## 4. The launch-branch integration seam

This is the most important new evidence from 009a.

Branch still present:

`सavnac/architecture-launch-readiness` (repository spelling: `savnac/architecture-launch-readiness`)

Current compare against `main`:

- status: `diverged`;
- launch branch: **8 commits ahead**;
- launch branch: **28 commits behind** current main;
- merge base: `adc9e81ac150427544875d43c0bd8366f967c205`.

Branch-only/different source includes, among other files:

- `assignments/A6-professional-pathway-artifacts.md`;
- `assignments/A7-final-reflection.md`;
- `docs/course-evaluation.md`;
- `weeks/week-02/*`;
- `weeks/week-03/*`;
- `weeks/week-04/*`;
- `weeks/week-15/*`;
- `weeks/week-17/*`;
- `scripts/validate_savnac_launch_source.py`;
- launch validation runs/reports.

This explains the apparent contradiction between current `main` and Prompt 006: the course *was* fully assembled for deployment, but the assembled launch source remained in a diverged worktree/branch.

### Consequence

Do **not** blindly merge the launch branch.

It is 28 commits behind main, and main now contains later accepted course truth including the professional-evidence pathway and other post-launch work. The correct operation is a bounded source reconciliation:

1. inventory every branch-only launch artifact;
2. classify it as still required, superseded, or historical evidence;
3. transplant/merge the required artifacts onto current main;
4. reconcile conflicts against newer main doctrine;
5. validate the resulting main source with the current full-semester compiler;
6. prove no launch-required content remains stranded on the branch.

That should be the first implementation unit discovered by Initiative 009.

---

## 5. Savnac truth

Prompt 006 proved considerably more than the stale queue says.

### What it proved

- Existing Savnac course **8** was reconciled rather than duplicated.
- It began from a partial state, not a clean slate.
- A full 21-module canonical course was read back.
- 229 module items matched the compiled plan's object count.
- 116 assignments were present.
- 12 weighted groups summed to 100%.
- Existing Week-1 object ids were preserved through safe module renames/reconcile.
- No students/submissions drifted during the write.
- Three real convergence/loader defects were found or handled in the process:
  1. duplicate module-title matching could orphan modules;
  2. Canvas trailing-slash normalization caused permanent body diffs;
  3. unresolved kickoff link tokens produced broken/non-converging links.
- After the fixes, two consecutive dry runs reached the same fixed point:
  `0 create / 0 update / 240 unchanged / 0 delete`.

This is strong evidence that the full-semester Architecture composition and generic reconcile path can converge.

### What it did not prove

- current `main` compiles to that exact state;
- exact production SWOSU Canvas target id;
- production desired-vs-live diff;
- production course write safety;
- post-write student-view navigation;
- real student submission round trip;
- WSL2/macOS/container support beyond the named platform evidence;
- that every unrelated Course Foundry registry test is green.

### Remaining named yellows from Prompt 006

- platform-capability limitations on Brandy for some optional/full-lab tooling;
- a pre-existing `SourcePaths.defaults()` / `ARCHITECTURE_SOURCE_ROOT` registry-test failure tracked separately;
- no professor/student walk.

None should be silently promoted to a launch blocker without fresh evidence tying it to the production path.

---

## 6. Production-launch gap compared with CS1

CS1's current launch discipline cleanly separates three responsibilities:

1. **102:** read-only target lock + current compiler + semantic diff;
2. **103:** bounded production reconcile after 102 is independently GREEN;
3. **104:** student-view/read-back launch closeout.

Architecture should inherit that separation.

### Architecture status against that pattern

| CS1-family launch surface | Architecture status |
|---|---|
| Exact production target lock | **MISSING / LIVE RECON REQUIRED** |
| Current canonical Git desired-state dry run | **BLOCKED until launch-source branch is reconciled into current main** |
| Read-only desired-vs-production semantic diff | **MISSING** |
| Bounded production reconcile contract | **CAN BE AUTHORED LATER; not safe to execute yet** |
| Independent student-view/read-back closeout | **MISSING** |

A section number is not enough to guess a production Canvas id. The target lock must converge from live Canvas metadata plus repository course identity, just as CS1 Prompt 102 did.

---

## 7. Shared-infrastructure collision boundary

### Safe now inside `computer_architecture`

- reconcile stranded launch source onto current main;
- repair stale Architecture navigation/status after reconciliation;
- add Architecture-local validation/orientation helpers if genuinely needed;
- author/read Architecture prompts and reports.

### Read only while Cleo owns CS1/Brandy dispatch

- `course_foundry`;
- `harbor` / Canvas deployment code;
- Brandy worktrees/processes;
- shared curriculum repositories.

### Potential later shared work

The historical `SourcePaths.defaults()` / `ARCHITECTURE_SOURCE_ROOT` registry failure is a candidate shared repair only if a fresh current-main Architecture launch dry run demonstrates that it affects the required production path. Until then it is a known yellow/test defect, not permission to mutate Course Foundry during CS1 production.

The current full-semester compiler itself already encodes:

- Week 1 shared kickoff composition;
- Weeks 2–17 module generation;
- 100% group weights;
- drop-lowest values;
- dead-days ungraded Week 16 recurring activities;
- explicit final reflection/evaluation source;
- no declared semester omissions.

That means the first unknown is source reconciliation, not a presumed compiler rewrite.

---

## 8. Reusable CS1 family discipline vs CS1-specific behavior

### Reuse

- exact target discovery rather than course-id guessing;
- source/repo SHA recording;
- preserve unrelated dirt/concurrent work;
- current desired-state compile before a write;
- semantic diff before a write;
- explicit destructive-scope analysis;
- separate production write from final student-view closeout;
- no worker self-certification.

### Do not copy blindly

- CS1's online-vs-F2F section disambiguation rules;
- CS1-specific Week-1 ownership quirks beyond the shared kickoff contract;
- CS1 Odyssey gates/categories;
- CS1 bespoke progressive link behavior;
- CS1 production course ids or object counts.

Architecture has its own asynchronous M/W/F grammar, Machine Dossier, grading family, and generic Imprint full-course reconcile path.

---

## 9. Questions the 009b map must answer

The next map should answer these relationship questions before implementation planning:

1. **Canonical-source relationship:** What must be true on `main` for launch source to be authoritative, and what role should the diverged Savnac branch have after reconciliation?
2. **Truth-navigation relationship:** Which file is the cold-start “what remains” authority, and how must README/PLANNING/prompt queue point to it so status does not drift into competing truths again?
3. **Source-to-compiler relationship:** What exact source completeness/validation contract must current `main` satisfy before a compiler result can be considered launch evidence?
4. **Savnac relationship:** What parts of the Prompt-006 fixed point may be inherited as prior evidence, and what must be re-proven after current-main reconciliation?
5. **Production-target relationship:** What independent evidence locks the exact Fall 2026 Canvas course without relying on memory or section-number guesswork?
6. **Production-diff relationship:** What semantic categories must be inspected before any live reconcile, including existing content, group rules, dates, publish state, links/assets, duplicates/orphans, and destructive scope?
7. **Write-authorization relationship:** Which evidence moves Architecture from “source ready” to “GREEN TO WRITE,” and which explicit gate authorizes the actual production write?
8. **Closeout relationship:** What student/professor view, navigation, grading, and read-back evidence is required after a write before declaring launch GREEN?
9. **Shared-infrastructure relationship:** How do we surface a real Course Foundry/Harbor defect without colliding with Cleo's active CS1 ownership or letting Architecture silently fork shared machinery?
10. **Platform-yellow relationship:** Which platform/support yellows are release blockers, and which remain honest documented optional/physical evidence limits?
11. **Foreman ownership:** Which stages may be delegated and which acceptance decisions must remain Foreman-owned?

## 009a acceptance

This report resolves the three required questions:

1. **What is already real?** Most of the course, the technical core, grading doctrine, shared Week 16 experience, full-semester compiler shape, and a proven Savnac fixed point.
2. **What is lying by age?** Root/sidecar readiness and queue prose, plus a Week-17 planning TODO, all lag later accepted evidence.
3. **What is actually missing?** First, reconciliation of the launch-ready source branch into current authoritative main. Then a fresh current-source compile, exact production target lock, semantic diff, separately authorized write, and independent launch closeout.

**009a verdict: ACCEPTED. Proceed to 009b mapping.**
