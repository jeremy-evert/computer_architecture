# Sidecar Prompt 005 — Build the Farkle + Machine Learning Architecture capstone

**Status:** OPEN  
**Owner:** Foreman  
**Mode:** prototype → measure → select → author → validate → report

## Mission

Turn Week 16 into a joyful synthesis experience where a real Farkle + machine-learning workload makes the layers of Computer Architecture visible.

The capstone is **not a machine-learning course project wearing an Architecture hat**. Machine learning is the workload. Computer Architecture is what students must investigate, measure, and explain.

A successful student should finish saying:

> I can show what this workload asked the machine to do, where the time/data went, which architecture features mattered, and why my evidence supports that claim.

## Read first

- `planning/fall-2026-spine.md`
- `planning/fall-2026-course-design.md`
- `sidecar/PLANNING.md`
- current Week 13–16 source after relevant authoring lands
- `sidecar/reports/003_build_reproducible_architecture_lab.md`
- `sidecar/reports/004_author_weeks_05_14_architecture_core.md` when available
- `sidecar/questions/003_assessment_and_grading_contract.md`

Inspect existing Farkle work in Jeremy's repositories before creating another incompatible implementation. Reuse a clean existing simulator/game engine or extract the smallest reusable core when that is safer than starting over.

## Capstone constraints

1. **CPU-only completion path is mandatory.**
2. GPU/accelerator execution is optional comparative evidence.
3. **No paid AI subscription or premium AI CLI agent is required.**
4. If students use Codex, Claude Code, ChatGPT Plus, Claude Pro, or another premium tool, that is optional workflow enhancement only and must not change the attainable grading ceiling.
5. No pretrained-model download or giant dataset is required.
6. The ML component must be small enough to run in the Week 3 reproducible lab environment on ordinary student hardware.
7. Students should not need prior ML expertise to succeed. Provide enough scaffold that architecture, not model-theory trivia, remains the hard part.
8. The workload must produce meaningful architecture evidence. Do not add ML merely because Week 16 says ML.
9. Capstone work should fit primarily within Week 16, with Week 14 proposal/measurement planning and Week 15 preflight doing useful preparation.
10. Do not invent final grade weight while Question 003 is open.

## Prototype before choosing

Foreman should have workers prototype a few **small** workload shapes, then select the one that best exposes architecture concepts with the least dependency pain.

Candidate shapes include:

### A. Farkle simulation + learned prediction

- generate many reproducible Farkle turns/games;
- derive compact state/features;
- train a tiny model to predict an outcome such as expected turn score, bust risk, or another well-defined target;
- measure data generation, training, and inference separately.

### B. Farkle decision policy comparison

- compare a simple rule-based strategy with a tiny learned strategy;
- profile the different computational phases;
- keep training bounded and deterministic enough for classroom use.

### C. Matrix-heavy Farkle-derived workload

- use Farkle-generated data as input to a deliberately small vector/matrix workload;
- make SIMD/vectorization/GPU acceleration especially observable;
- avoid losing the game context entirely.

The chosen design should be the simplest thing that produces rich architecture evidence.

## Architecture evidence targets

The capstone should let a student connect **at least three** course layers:

- representation/data layout;
- compiler/toolchain or instruction-level evidence;
- CPU execution/performance;
- cache/memory behavior/locality;
- parallelism/vectorization;
- GPU/accelerator comparison;
- throughput vs latency;
- reproducibility/environment;
- performance/power/energy tradeoffs where measurable responsibly.

Do not require every student to measure every layer.

## Required reproducibility

The capstone must run through the Week 3 lab contract.

Pin or record:

- code version;
- dependencies;
- random seeds where relevant;
- dataset generation parameters;
- workload size;
- machine/environment information;
- exact run commands.

A second run on the same supported environment should be close enough that students can distinguish normal performance noise from a fundamentally different experiment.

## Required student workflow

### Week 14 — Hypothesis / measurement plan

Student chooses or receives a bounded architecture question and predicts what will matter.

Examples:

- Does vectorized data processing materially change runtime for this workload?
- Is training or inference the dominant phase and why?
- Does changing data layout/workload size expose cache behavior?
- If GPU access exists, when does acceleration overcome transfer/setup overhead?

### Week 15 — Asynchronous preflight

Student proves the workload runs and captures environment/baseline evidence. This should be lightweight and self-contained.

### Week 16 — Capstone investigation

Student:

1. runs a controlled baseline;
2. captures relevant architecture evidence;
3. changes one meaningful variable or implementation choice;
4. runs again;
5. interprets the difference;
6. makes one bounded architecture claim;
7. defends it with evidence;
8. records AI assistance separately from verification evidence.

Students may use no-cost AI, premium AI, CLI agents, or no AI where the task permits. The assignment must be written so premium features are never necessary.

### Week 17 — Reflection bridge

The capstone should provide one obvious artifact the student can reference when answering: "What do I understand now that I could not explain in August?"

## Tooling research

Choose a tiny, maintainable **open/free required** ML stack. Candidates might include a small NumPy implementation, scikit-learn model, lightweight PyTorch CPU workload, or another appropriate open tool.

Compare:

- image/dependency size;
- startup friction;
- deterministic behavior;
- profiling visibility;
- CPU performance on ordinary machines;
- optional GPU path;
- how directly the workload exposes architecture ideas.

If a simpler non-framework implementation teaches the architecture better, prefer it.

## Performance measurement doctrine

Teach enough measurement hygiene that the capstone does not reward benchmark theater:

- warmup when relevant;
- multiple measurements when relevant;
- distinguish wall time from CPU time where useful;
- record workload size;
- avoid treating incomparable machines as proof of an architectural law;
- discuss noise/uncontrolled variables;
- do not require privileged counters students cannot access.

Advanced hardware counters/perf may be an extension if the environment supports them reliably.

## Required artifacts

Create repository-standard locations for:

- Farkle/ML workload source;
- deterministic data-generation path if needed;
- run/measurement scripts;
- student capstone handout/source;
- Week 14 planning bridge;
- Week 15 preflight instructions;
- Week 16 investigation instructions;
- unweighted rubric/check criteria;
- instructor validation/sample evidence;
- smoke/acceptance test.

Do not commit giant generated datasets, trained model binaries, environment caches, or excluded artifacts.

## Acceptance battery

At minimum prove:

1. clean CPU-only run from the supported lab environment;
2. deterministic/reproducible data generation where used;
3. model/workload completes in a reasonable bounded run;
4. baseline measurement works;
5. at least one controlled variation produces interpretable evidence;
6. optional GPU path fails gracefully when no GPU exists;
7. student instructions do not depend on Jeremy's private machines/network;
8. student instructions do not depend on a paid AI account or premium CLI agent;
9. no model/data download secretly makes the assignment enormous.

## Explicit non-goals

- no production Canvas writes;
- no large-language-model training;
- no requirement to teach neural-network mathematics in depth;
- no leaderboard rewarding expensive hardware;
- no premium AI/CLI requirement;
- no benchmark competition across heterogeneous personal machines unless normalized/structured carefully;
- no final grading percentage.

## Required report

Write:

`sidecar/reports/005_build_farkle_ml_architecture_capstone.md`

Include:

- existing Farkle assets inspected/reused;
- candidate workload prototypes and why one was chosen;
- ML/tool dependencies;
- architecture concepts exposed;
- CPU validation results;
- optional GPU validation if tested;
- repeatability evidence;
- confirmation of no paid-AI/CLI dependency;
- student workload/runtime characteristics;
- created course artifacts;
- remaining YELLOWs;
- worker commit SHA(s).

## Foreman acceptance

Foreman independently runs the capstone path and confirms:

1. it is fundamentally a Computer Architecture synthesis assignment;
2. ML/Farkle provides a compelling workload rather than needless complexity;
3. ordinary CPU hardware can complete it;
4. students collect and interpret real evidence;
5. it connects naturally from Week 14 through Week 17;
6. paid AI/CLI tools are optional only;
7. no unresolved grading policy was invented.

## Done when

Week 16 has a tested, reproducible, CPU-accessible Farkle + ML capstone that makes several layers of the machine visible, requires no paid AI/CLI tooling, and gives students a defensible architecture story for the final reflection.
