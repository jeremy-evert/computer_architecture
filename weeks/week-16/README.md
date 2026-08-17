# Week 16 - Farkle + Machine Learning: What Did the Compute Buy?

> **Central machine question:** What does it cost a machine to make a better Farkle decision, and when is that extra cost actually worth paying?

## Dead-days grading boundary

Fall 2026 Week 16 is the three-class-day dead-days window immediately before finals.

Therefore this week is a **real learning/application experience but not a graded recurring-work week**:

- no Machine Dossier checkpoint;
- no graded AI Fluency assignment;
- no graded Professional Minds assignment;
- no graded Architecture Investigation assignment;
- no graded Explain / Defend assignment;
- no premium tool/hardware path creates points.

You may still run the benchmark, write the judgment, discuss the evidence, and keep the receipt as portfolio/learning evidence. The work exists because it is useful and fun, not because Canvas is dangling points over it.

## Week at a Glance

**Prior belief we are testing/refining:** a more computationally expensive strategy or a more powerful machine is automatically the better architecture.

**Prediction before measurement:** choose two fixed Farkle strategies and predict which will be more effective, which will consume more preparation or runtime work, and whether the extra work will be worth paying for under one objective you name.

**AI Fluency lens:** Lens 16 - Reflect and Improve. Use it as an ungraded reflection lens this week.

**Professional Minds:** Wednesday - *Generative AI Design Patterns* reflection; Friday - semester reflection: what kind of professional do I want to become? These remain enrichment/reflection surfaces rather than graded Week 16 assignments.

| Day | Mode | What happens | Evidence |
|---|---|---|---|
| Monday | Think / Frame | Separate effectiveness, preparation cost, operating cost, and machine context. Make a prediction. | short prediction for yourself / discussion |
| Wednesday | Investigate / Break / Measure | Run two fixed strategies on one validated CPU lane and inspect repeated machine-readable evidence. | JSON/CSV receipt + observed relationship |
| Friday | Explain / Defend | Decide whether the extra computation bought enough effectiveness for your declared objective. | bounded ungraded architecture judgment |

## Continuity

**What returns from an earlier week:** latency/throughput, parallelism, locality, specialization, resource constraints, and the habit of choosing evidence that matches a workload.

**What this week intentionally carries forward:** the architect's job is not to maximize every metric. It is to choose a machine under a workload, objective, and constraint.

## Machine Dossier handoff

**Action: NO CHANGE.**

The technical Machine Dossier froze in Week 14. Week 16 may consult earlier Architecture ideas to explain evidence, but it does not create a new dossier layer or Checkpoint 4.

## The shared machine

The Farkle rules, learner, strategies, fair simulation, and common evidence semantics come from the canonical `jeremy-evert/Farkle_and_Machine_Learning` computational core vendored under:

`weeks/week-16/code/farkle_ml/`

Computer Architecture owns only the execution-context layer under:

`weeks/week-16/code/architecture_farkle/`

That layer records the host, repeats timings, preserves raw effectiveness evidence, and writes JSON/CSV receipts. It does **not** fork the game or silently rewrite the learning algorithms.

## The required lane

The required learning path is:

- native Python;
- CPU;
- ordinary supported computer;
- no paid AI/API;
- no GPU;
- no cloud/NRP/Kubernetes;
- no special family hardware.

A machine may physically contain a GPU. That does not make a native Python CPU run a GPU benchmark.

If your local machine cannot run the lane cleanly, use the course-provided real fallback receipt and do the same reasoning task. Hardware convenience does not create a grading ceiling because Week 16 itself is ungraded.

## Student path

1. Read [`monday.md`](monday.md) and make the prediction before seeing benchmark results.
2. Follow [`wednesday.md`](wednesday.md), choose two fixed strategies, and run repeated evidence on one CPU lane when practical.
3. Complete the reasoning in [`friday.md`](friday.md) using the receipt rather than a screenshot dump. Keep it as learning/portfolio evidence; it is not a graded Week 16 submission.
4. Use [`references.md`](references.md) when you need to trace ownership or verify what the benchmark does.

## Fixed strategy menu

Use the provided strategies rather than rewriting the workload:

- `bank_at_300` - cheap human threshold;
- `learner:500` - small preparation/training budget;
- `learner:2000` - larger preparation/training budget;
- `rollout:10` - modest decision-time simulation;
- `rollout:25` - larger decision-time simulation.

The usual comparison baseline is `bank_at_425`.

## Cost currencies

Keep them separate.

### Effectiveness

- win rate against the same baseline;
- raw wins/ties and starter balance;
- stability under the same deterministic workload.

### Preparation

- training turns;
- preparation wall time;
- learned-table/model size when applicable.

### Operation

- evaluation wall time;
- games per second;
- timing variation across repeated runs.

### Machine / environment

- actual host and CPU;
- logical CPU count;
- execution mode;
- declared hardware lane.

Do not collapse these into one magic score unless you have first declared exactly what that score is optimizing.

## Scope

**This week is about:** making one Architecture-informed cost-versus-effectiveness judgment from a fixed shared workload.

**This week is not trying to teach:** new ML theory, GPU programming, deep profiling, Kubernetes, a production tournament platform, or another technical capstone.

## Optional Stack Showcase

The instructor may later run the exact same benchmark contract on additional verified hardware lanes. Those runs are enrichment and shared evidence, not a student's grading ceiling.
