# Initiative 009 — Computer Architecture launch readiness lifecycle

**Status:** ACTIVE CHARTER  
**Worksite:** `jeremy-evert/computer_architecture`  
**Owner:** Foreman / ChatGPT  
**Course:** COMSC-3013 Computer Architecture, Fall 2026  
**Lifecycle:** report current truth → map desired shape → plan route → bounded `d_NN` units → Foreman validation

## Human intent

Pull Computer Architecture forward deliberately and at high quality, using the project-local initiative lifecycle established by `foreman_interface` rather than a single giant implementation pass.

The course has already accumulated substantial source, validation, and Savnac evidence. Do not assume old planning documents accurately describe current readiness. Reconstruct current truth first, then decide what remains.

The operating sequence is:

```text
009_architecture_launch_readiness_lifecycle
→ 009_a_report_architecture_launch_readiness
→ 009_b_map_architecture_launch_ready_shape
→ 009_c_plan_architecture_launch_readiness
→ 009_d_01 ... 009_d_NN bounded work units discovered by the plan
→ 009_e_validate_architecture_launch_readiness
```

Each stage changes focus. A later stage is authored from accepted evidence produced by the prior stage, not from momentum or chat memory.

## Current known context, not yet a verdict

Existing repository evidence strongly suggests Computer Architecture is farther along than several navigation/status files say:

- Prompt 006 reports a successful full-course Savnac course-8 reconcile and read-back;
- two consecutive post-fix dry runs reached `0 create / 0 update / 240 unchanged / 0 delete`;
- production SWOSU Canvas was not touched;
- grading policy, dead-days posture, drop-lowest rules, due-time convention, and resubmission policy have been resolved;
- the technical core, Week 16 shared experience, and professional pathway have durable source;
- several sidecar/root readiness summaries still describe earlier blockers as outstanding.

Initiative 009 must prove or correct that interpretation before using it to schedule work.

## Comparison standard

Use the strongest current sibling-course launch patterns as evidence, especially Computer Science I's launch sequence:

- read-only production reconnaissance and exact target lock;
- current desired-state compilation;
- desired-vs-live semantic diff;
- bounded production reconcile only after the target and delta are understood;
- independent student-view/launch closeout after the write.

Computer Architecture should inherit useful family discipline without pretending it is CS1 or copying CS1-specific content contracts.

## Tonight's concurrency boundary

Cleo owns Brandy and the active CS1 dispatch/production work.

Therefore, during the reconnaissance, mapping, planning, and safe repo-local cleanup stages of Initiative 009:

### Mutable

- `jeremy-evert/computer_architecture` project-local source, sidecar prompts/reports, and clearly bounded repo-local truth/navigation repairs authorized by a later `d_NN` prompt.

### Read-only evidence surfaces

- `jeremy-evert/computer_science_1`;
- `jeremy-evert/course_foundry`;
- `harbor` and Canvas integration/deployment repositories;
- shared curriculum repositories such as `semester_kickoff_week`, `ai_fluency`, and `professional_minds`;
- Brandy/local deployment state owned by Cleo's CS1 run.

Do not repair, refactor, commit, merge, or otherwise mutate shared infrastructure while Cleo's CS1 production work may be using it. If Architecture reconnaissance reveals a shared-infrastructure defect, record the defect and the evidence needed for a later separately owned repair.

## Production boundary

No production SWOSU Canvas write is authorized by this charter.

A future production-imprint `d_NN` prompt may be authored only after the initiative proves all of the following:

1. the exact Fall 2026 COMSC-3013 production Canvas course is locked by evidence;
2. current Git desired state compiles cleanly;
3. the current production semantic diff is understood;
4. no unresolved source-of-truth contradiction exists;
5. shared-infrastructure ownership is clear and no concurrent mutable-work collision exists;
6. the production write is explicitly authorized at the real write gate.

Savnac is evidence and dogfood, not authority over Git and not permission to write production.

## Foreman / worker boundary

Foreman owns:

- stage acceptance;
- scope and authority boundaries;
- reconciliation of conflicting evidence;
- authorship of the next lifecycle stage after accepting the previous one;
- final `009_e` launch-readiness judgment.

A bounded worker/session may own one `d_NN` unit and its evidence. Worker completion does not self-certify initiative completion.

## Questions boundary

Worker uncertainty returns to Foreman first. Create a durable `sidecar/questions/` item only for a genuine remaining Jeremy decision that cannot be resolved from source, policy, or evidence and that blocks a named unit.

Do not turn runtime limitations, missing local credentials, or routine discoverable facts into Jeremy preference questions.

## Git safety belt

For every mutable unit in `computer_architecture`:

- preserve unrelated work;
- inspect the exact intended diff;
- validate the changed contract with repository-native checks where available;
- run `git diff --check` in a local execution seat when available;
- commit intentionally with a narrow message;
- leave a durable report/receipt before the unit is accepted.

## Completion

Initiative 009 is complete only when `009_e_validate_architecture_launch_readiness.md` independently establishes the final state and classifies Computer Architecture as one of:

- **GREEN — production course is correctly deployed and launch-closed**, or
- **GREEN TO WRITE — source, target, delta, and machinery are proven but the explicit production write has intentionally not been authorized**, or
- **YELLOW — usable course with named non-launch-blocking limitations**, or
- **RED — a concrete blocker remains**, with the exact repair unit or human gate named.

If `009_e` exposes a repairable defect, author the next unused `009_d_NN` repair prompt and rerun `009_e`; do not invent a later lifecycle letter.
