# Computer Architecture Fall 2026 — target course design (Prompt 030A / 030B)

**Status: TARGET DESIGN. Not yet applied to live production Canvas (course 75249).** This document records what the course should become; `docs/grading-model.md` still describes what is actually live today. See `sidecar/reports/030_architecture_to_optional_commons_end_first_migration.md` for why live renormalization/consolidation is deferred this pass (Prompt 030A's own impact-preview safety gate, plus a sandbox tooling gap on the deletion side).

Controlling prompts: `sidecar/prompts/030a_architecture_three_part_grading_and_consolidation.md` (blob `1624fe1883317ede681ea9c7777237ea799ae729`), `sidecar/prompts/030b_architecture_weekly_video_teaching_rhythm.md` (blob `3471748938f0e1e6b02579209ae66f5293c6e1c4`).

## Grading doctrine (Prompt 030A)

| Component | Weight |
|---|---:|
| Weekly Canvas Engagement | 15% |
| Architecture Reasoning Odyssey | 75% |
| End-of-semester Architecture Reflection | 10% |
| **Total** | **100%** |

No other required graded category. Everything Decision 029 names as shared/enrichment (Semester Kickoff, AI Fluency, Professional Minds, Professional Pathway, Farkle+ML) is harvested into optional Computing Commons instead (see the migration ledger) and is not part of the required Architecture grade.

### Weekly Canvas Engagement — 15%

One cumulative instructor-entered gradebook column for the semester. No student submission, no weekly reflection/receipt/quiz, no due-date treadmill. This replaces the live "Semester kickoff week" + implicit attendance signal with a single object rather than per-week check-ins.

### Architecture Reasoning Odyssey — 75%, ~15 objects

One consolidated assignment per substantive Architecture week (2–16), replacing the live "Weekly Architecture / investigation work" + "Weekly Explain / Defend evidence receipt" + "Machine Dossier checkpoints" split for that week with a single object that carries both the investigation and the explain/defend evidence. Milestone weeks (5, 9, 14 — the existing Machine Dossier checkpoint weeks) carry proportionally more points for the larger evidence burden; all others are weighted equally within the group.

| Week | Target Reasoning Odyssey assignment | Consolidates (live groups) | Relative size |
|---|---|---|---|
| 2 | Architecture Reasoning Odyssey — Week 2: AI Laboratory Training | Weekly Investigation + Explain/Defend | standard |
| 3 | Architecture Reasoning Odyssey — Week 3: Containers & Repeatability | Weekly Investigation + Explain/Defend | standard |
| 4 | Architecture Reasoning Odyssey — Week 4: Linux as a Machine Telescope | Weekly Investigation + Explain/Defend | standard |
| 5 | Architecture Reasoning Odyssey — Week 5: Build the Machine | Weekly Investigation + Explain/Defend + **Machine Dossier Checkpoint 1** | milestone |
| 6 | Architecture Reasoning Odyssey — Week 6: Bits Become Instructions | Weekly Investigation + Explain/Defend | standard |
| 7 | Architecture Reasoning Odyssey — Week 7: Crack Open the CPU | Weekly Investigation + Explain/Defend | standard |
| 8 | Architecture Reasoning Odyssey — Week 8: Make It Fast Without Breaking It | Weekly Investigation + Explain/Defend | standard |
| 9 | Architecture Reasoning Odyssey — Week 9: Follow the Program Down | Weekly Investigation + Explain/Defend + **Machine Dossier Checkpoint 2** | milestone |
| 10 | Architecture Reasoning Odyssey — Week 10: Make the Memory Hierarchy Hurt | Weekly Investigation + Explain/Defend | standard |
| 11 | Architecture Reasoning Odyssey — Week 11: The Useful Lie of Memory | Weekly Investigation + Explain/Defend | standard |
| 12 | Architecture Reasoning Odyssey — Week 12: More Cores, More Problems | Weekly Investigation + Explain/Defend | standard |
| 13 | Architecture Reasoning Odyssey — Week 13: Different Machines for Different Work | Weekly Investigation + Explain/Defend | standard |
| 14 | Architecture Reasoning Odyssey — Week 14: Sit in the Architect's Chair | Weekly Investigation + Explain/Defend + **Machine Dossier Checkpoint 3** | milestone |
| 15 | Architecture Reasoning Odyssey — Week 15: Curation & Catch-Up | light/asynchronous (Thanksgiving) | small |
| 16 | Architecture Reasoning Odyssey — Week 16: Farkle + ML Cost/Effectiveness | already-ungraded enrichment; kept optional, not part of the 75% group | n/a (0 pts, unchanged) |

Weeks 2–14 (13 weeks; three of them milestone-weighted) plus Week 15's light curation object = **14 graded Reasoning Odyssey assignments**. Week 16 stays 0-point/optional as it already is live. This lands the total object count at **1 (Engagement) + 14 (Odyssey) + 1 (Final Reflection) = 16**, one below the ~17 target — an academically justified difference per Prompt 030A's own instruction ("if the strongest pure Architecture course naturally lands at 15, 16, 17, or 18 objects, prefer the academically cleaner result"), since Week 16 is deliberately a joyful ungraded shared week, not a 15th technical milestone, and Week 9's Fall Break Friday and Week 15's Thanksgiving asynchronous posture already compress naturally.

### End-of-semester Architecture Reflection — 10%

Keep the existing Week 17 final reflection (currently `assignments/A7-final-reflection.md`), using the student's accumulated Reasoning Odyssey/Dossier evidence trail. No separate shared reflection required.

### What leaves the required grade

Semester Kickoff, AI Fluency, Professional Minds Wednesday/Friday, Professional Pathway, Farkle+ML finale, and the standalone Weekly Explain/Defend and Machine Dossier checkpoint *categories* (folded into the Reasoning Odyssey objects above) leave the required Architecture grade per Prompt 030A. Course evaluation (2%, institutional) is retained as an ungraded/pass-through Canvas object outside the three academic categories, consistent with how SWOSU course evaluations are typically handled institution-wide — this is a small, deliberate, academically-justified exception, not a fourth grading category.

## Weekly teaching rhythm (Prompt 030B)

Module grammar per substantive week (2–16):

1. **Monday — Teach It** (page/media placeholder; teaching content, not graded)
2. **Wednesday — How I Would Do It** (page/media placeholder; teaching content, not graded)
3. **Architecture Reasoning Odyssey — Week N** (the one graded assignment for the week, per the table above)
4. **Friday — Show & Tell / Feedback** (page/media placeholder, positioned after student work begins arriving; teaching content, not graded; skipped entirely for weeks with no submittable work, e.g. Week 9 Fall Break Friday and Week 15 Thanksgiving)

Video pages carry no points, no due date, no completion requirement, and are not module-completion-gated. See `sidecar/reports/030b_architecture_video_recording_queue.md` for the week-by-week recording status and outlines — no recording exists yet for any week at this pass; all Monday/Wednesday slots are queued as "needs recording," and no fake/placeholder media URL has been created anywhere.

## Live renormalization — deferred, not abandoned

Prompt 030A requires a before/after impact preview proving every currently enrolled student's grade is preserved or improved before changing live assignment-group weights. Computing that preview correctly requires each of the 6 enrolled students' actual current scores across all 11 live groups — deeper per-student grade computation than this pass performed, and even a computed-safe reweighting still requires the same DELETE/consolidate capability documented as deferred in the migration ledger (`computing_commons/docs/migration-ledger-computer-architecture-fall-2026.md`) to actually retire the old 11-group structure. Per Prompt 030A's own explicit fallback ("do not hold the rest of the chain-gun cleanup hostage to unsafe grade math"), this design is recorded as the target and left for a follow-up pass once (a) the impact preview is computed and reviewed, and (b) a reviewed harbor DELETE verb exists.
