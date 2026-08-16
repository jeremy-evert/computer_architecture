# Sidecar Prompt 005 - Build the shared Farkle + ML architecture game

**Status:** READY WHEN DELIBERATELY STARTED  
**Historical filename:** retained for compatibility; the former Architecture-capstone framing is retired.  
**Owner:** Foreman  
**Mode:** inspect existing shared Farkle assets -> freeze the software problem -> build the smallest valid tournament/benchmark surface -> validate CPU path -> report

## Mission

Build **Week 16 Farkle + Machine Learning** as a joyful shared computing-family experience with a specifically useful Computer Architecture echo.

Computer Architecture already reached its technical finale in Week 14. Week 16 must not become Checkpoint 4, a hidden Machine Dossier continuation, or a second final project.

The Week 16 Architecture question is:

> **What does it cost a machine to make a better Farkle decision, and when is that extra cost actually worth paying?**

The course should force students to use what they learned about architecture to make a bounded engineering judgment, not to learn a new Architecture mechanism.

The desired student feeling is:

> The software problem stayed mostly fixed. I changed the computational strategy or the machine underneath it, measured what happened, and decided which architecture was worth using for the outcome I cared about.

## Read first

- `planning/fall-2026-course-design.md`
- `planning/block-map.md`
- `planning/machine-dossier.md`
- `planning/week-16.md`
- `docs/grading-model.md`
- shared/sibling Farkle + ML sources
- Prompt 003 lab report
- Prompt 004 Week 5-14 report

Reuse shared Farkle assets rather than creating an Architecture-only fork.

## Core design rule: freeze the problem, vary the substrate

Prescribe a small, fixed set of course-owned Farkle software strategies with stable interfaces and correctness tests.

Students should **not** win by rewriting the game, changing the scoring rules, weakening correctness, or inventing an incomparable workload.

A useful fixed software menu may include a bounded subset such as:

1. simple heuristic player;
2. small trained ML player;
3. more expensive trained ML player;
4. bounded simulation / Monte Carlo player at fixed effort levels.

The implementation may choose a smaller set if that produces a cleaner Week 16 experience.

Students then vary or compare architectural choices underneath or around those fixed strategies, for example:

- compiler flags / optimization level;
- bare metal versus containerized execution;
- CPU worker count;
- CPU versus optional GPU/accelerator path;
- local versus instructor-provided cloud/NRP execution;
- precomputation or caching where the fixed software contract permits it;
- deployment target / hardware class.

Do not permit arbitrary changes that destroy comparability.

## Training cost is part of the Architecture story

For trained ML strategies, preserve or provide fixed training jobs at bounded levels of difficulty/expense.

Students should be able to observe that a model can have:

- **preparation cost:** training time, training compute, and optionally normalized monetary cost;
- **play cost:** decision latency, games per unit time, inference compute, and optionally normalized operating cost;
- **effectiveness:** win rate, expected score, decision quality, or another fixed tournament metric.

The learning target is not ML theory. The learning target is the tradeoff:

> An expensive model may cost more to prepare but less to use repeatedly. A simulation strategy may cost almost nothing to prepare but spend compute on every decision. A cheap heuristic may be nearly free and still be the rational choice under some objective.

Where useful, expose amortization questions such as:

> After how many games does a higher training cost become worthwhile?

## Cost has multiple currencies

Do not collapse all cost into one vague number.

At minimum distinguish:

### Effectiveness
- win rate or other fixed success metric;
- expected score/value if useful;
- stability across repeated deterministic-seed tournament bundles.

### Preparation
- training wall time;
- bounded compute/resource use;
- normalized or observed monetary cost when applicable.

### Operation
- decision latency;
- games completed in a fixed time window;
- runtime compute/resource use.

### Capital / environment
- hardware class;
- normalized hardware value or assigned competition cost when needed for fair comparison;
- local/container/cloud execution context.

Confidence is not itself a universal currency. Treat it as something additional computation may purchase when the chosen software strategy exposes it.

## Fixed hardware competition lanes

The instructor may expose fixed execution lanes so students can compare software without family hardware wealth becoming the competition.

Potential lanes:

- Raspberry Pi / very constrained machine;
- normal laptop-like host;
- proper desktop host;
- large instructor/NRP compute host.

A lane may be represented by an instructor-controlled runner that pulls a submitted artifact and executes the fixed benchmark.

For serious same-hardware comparisons, record the actual executing host or hardware class. Do not claim identical hardware merely because two pods requested the same broad resource type.

## Student participation scope

Keep the required student burden small.

A student should normally need to choose:

- **one hardware lane**, and
- **two fixed software strategies or effort levels**

then make a prediction, run/submit them, inspect the evidence, and make an architectural judgment.

Do not require every student to test every machine or every software strategy.

## Tournament categories

The implementation may support several playful leaderboards so "best" is explicitly objective-dependent.

Candidate categories include:

- **Farkle Champion:** strongest validated raw playing result;
- **Top 500:** most valid games completed in a fixed time window such as five minutes;
- **Green 500:** strongest effectiveness relative to bounded compute/resource cost;
- **Bottom Dollar:** cheapest valid architecture that reaches a declared effectiveness floor;
- **Training Miser:** strongest resulting player relative to preparation/training cost;
- **Round Robin:** fixed software contestants compete on the same controlled hardware lane.

Do not turn all categories into grading requirements. They are a game surface for evidence and choice.

## Ranking and rarity

Do not reward a category merely because many students selected it, and do not let a solo entrant automatically earn a perfect performance score.

If ranking is implemented, separate:

1. **performance within the category**, and
2. **pioneer / rarity credit** for exploring an underused valid design point.

A bounded implementation may use a normalized performance score plus a small fixed pioneer pool divided among qualifying entrants.

Qualification requires a correct, reproducible submission that clears the fixed baseline. Obscurity alone is not success.

Exact point formulas are an implementation detail for Prompt 005 only if needed for the Week 16 experience. Do not let scoring-system design consume the prompt.

## Automated runner idea, deliberately bounded

The instructor may eventually operate a controller that:

1. pulls a versioned student artifact from GitHub or another approved source;
2. builds or resolves an immutable container image;
3. runs the fixed tournament harness on an instructor-controlled lane;
4. emits a standard result receipt;
5. updates a leaderboard.

NRP/Kubernetes may be used for the large-compute lane and may later run jobs opportunistically.

**Important scope fence:** Prompt 005 does **not** require building a production tournament platform, persistent web service, generalized scheduler, Kubernetes control plane, GitHub app, semester-long live league, or complex multi-host orchestration.

If a tiny instructor runner or static leaderboard is enough to prove the Week 16 experience, stop there.

Record larger automation ideas as future infrastructure, not Week 16 blockers.

## Submission / execution safety

If instructor infrastructure executes student artifacts:

- treat student code as untrusted;
- use instructor-owned wrappers/jobs rather than blindly launching student-supplied Kubernetes manifests;
- impose bounded CPU/RAM/GPU/time limits;
- avoid privileged containers and host filesystem access;
- disable or tightly restrict network access during scored play where practical;
- preserve benchmark version, seed bundle, source commit/image digest, hardware lane, and result receipt;
- correctness must be verified before performance counts.

Do not build more security infrastructure than the bounded Week 16 run requires.

## Architecture echo

The required reflection should stay short but force prior Architecture knowledge to matter.

Useful questions:

- What did you decide was expensive: time, training, operating compute, hardware cost, or lost effectiveness?
- Which strategy/machine did you predict would be best for your objective?
- What changed when the machine or computational effort changed?
- Where did additional computation stop buying enough improvement to be worth it?
- Which prior Architecture idea best explains the result: locality, throughput, latency, parallelism, vectorization, data movement, specialization, or another measured constraint?
- What architecture would you choose now, and for what objective?

The final judgment should sound like:

> **For this workload, under this constraint, measured this way, I would choose this architecture because the additional effectiveness is or is not worth the additional cost.**

## Pinned constraints

1. Week 14 already froze the Machine Dossier.
2. Week 15 is asynchronous wind-down/catch-up.
3. Week 16 is joyful shared application.
4. Week 17 is reflection.
5. CPU-only required path.
6. GPU/accelerator path optional.
7. No paid AI/CLI requirement.
8. No large model/dataset download.
9. No prior ML expertise required.
10. Architecture-specific evidence remains light.
11. Fixed software contracts preserve comparability.
12. Instructor-owned hardware lanes must not become an equity barrier.
13. No expensive-hardware-only leaderboard may determine the student's grading ceiling.

## Required artifacts

Create/validate only what Week 16 actually needs:

- canonical shared Farkle workload source or adapter;
- bounded fixed software-strategy menu;
- small ML training/application path;
- fixed benchmark/tournament interface and correctness checks;
- CPU smoke test;
- optional GPU/instructor-compute enrichment path if worthwhile;
- one or more standard result receipts;
- student instructions;
- simple prediction + architectural judgment/reflection receipt;
- instructor showcase/tournament notes;
- optional minimal static leaderboard or runner if it materially improves the experience;
- no new Architecture checkpoint/rubric.

## Explicit non-goals

- no production Canvas writes;
- no Architecture Checkpoint 4;
- no Machine Dossier continuation;
- no required profiling deep dive;
- no LLM training;
- no requirement to build a full ML system;
- no leaderboard rewarding expensive hardware as the only form of success;
- no premium AI/CLI requirement;
- no full production tournament service;
- no generalized Kubernetes submission platform;
- no semester-long infrastructure detour.

## Required report

Write:

`sidecar/reports/005_build_farkle_ml_architecture_capstone.md`

The historical report path may remain for compatibility, but the report must explicitly state that the heavy-capstone design was retired.

Include:

- shared assets reused;
- final fixed software choices;
- benchmark/tournament contract;
- training/preparation cost treatment;
- hardware lane treatment;
- CPU validation;
- optional GPU/instructor-compute validation;
- student runtime/friction;
- Architecture judgment prompt;
- any leaderboard/runner implemented;
- larger tournament-platform ideas explicitly parked as future infrastructure;
- confirmation no new dossier/checkpoint was created;
- worker commit SHA(s).

## Done when

Week 16 is a tested, humane, shared Farkle + ML game where students can hold the software problem mostly still, vary meaningful computational or hardware choices, measure cost versus effectiveness, and make an Architecture-informed decision.

The implementation is done when the **learning game works**. It is not waiting for a grand tournament platform.