# Machine Dossier and Architecture Sensory Lab contract

**Status:** accepted planning doctrine; implementation/scaffolding still needs to be built and validated.

The Machine Dossier is the persistent Architecture artifact for **Weeks 5-14**.

It is not a weekly worksheet stack. It is a living technical record that accumulates only when a week's evidence genuinely improves the student's model of the machine.

## Why it exists

Students should not leave Computer Architecture merely able to point at a diagram and say "that is the CPU" or repeat that cache is "fast."

They should be able to answer:

- What does this component do?
- What does it cost?
- What constraint does it introduce?
- What capability does it buy?
- What workload cares?
- What happens when I deliberately make that resource worse?
- What evidence changed my design judgment?

## Two views of one machine

### 1. Machine Map

The Machine Map records what exists and how the pieces fit:

- student-designed machine;
- observable real machine;
- CPU/ISA/cores/threads;
- cache hierarchy;
- RAM;
- storage;
- GPU/accelerator if present;
- interfaces and compatibility constraints;
- prices/capacities/specifications;
- workload goal;
- selected derived metrics.

### 2. Sensitivity Profile

The Sensitivity Profile records what the workload/system cares about when a constraint changes:

- latency;
- bandwidth;
- working-set/cache capacity;
- sequential versus random access;
- dependency versus independence;
- synchronization frequency;
- core/worker count;
- communication delay;
- data movement/setup cost;
- general-purpose versus specialized execution.

The important question is not "which number is bigger?" It is **which constraint changes the behavior of this workload, and how do we know?**

## Dossier lifecycle

| Week | Dossier role |
|---|---|
| 1-4 | No Machine Dossier. Students build investigation, reproducibility, and observation habits first. |
| 5 | **Dossier v0:** PC build(s), workload, compatibility, cost/capacity hierarchy, actual-machine snapshot, initial Dollars-Per ledger. |
| 6 | Add representation/ISA evidence and Checkpoint 1 trace. |
| 7 | Crack the CPU box open conceptually: datapath/control notes and trace. |
| 8 | Add first performance/sensitivity plot and latency/throughput evidence. |
| 9 | **Checkpoint 2:** source-to-CPU integration synthesis. |
| 10 | Major measured memory-hierarchy expansion: cache/locality/latency/bandwidth plots. |
| 11 | Add VM/protection/I/O abstraction evidence. |
| 12 | Add scaling/communication/synchronization sensitivity plot. |
| 13 | Add workload-fit/general-vs-specialized evidence. |
| 14 | **Checkpoint 3:** rebuild/redefend the Week 5 machine; freeze dossier. |
| 15 | Curate/catch up only. No new dossier layer. |
| 16 | Optional/light reference during Farkle + ML; no new checkpoint. |
| 17 | Use the frozen dossier as evidence for reflection. |

## Week 5 machine-design pattern

Week 5 should preserve the successful historical PCPartPicker-style DNA:

1. **Would It Run?**
   - compatible parts;
   - required interfaces/power/form factor;
   - a computer that should actually boot/work.
2. **Would It Be Fun / Fit the Workload?**
   - build for a stated workload;
   - identify likely bottlenecks;
   - justify where the budget goes.
3. **Dollars Per**
   - calculate simple derived metrics;
   - compare the hierarchy from cache through RAM/storage/cloud where meaningful;
   - later revisit whether the chosen metric was actually a useful one.

Naive Week 5 metrics are allowed because later weeks should teach students why naive metrics can lie.

## Memory/storage hierarchy ledger

The dossier should be able to represent, when data is available:

| Layer | Capacity | Approx. cost per unit | Latency | Bandwidth | Time to move/read a large fixed amount | Persistent? | Source/measurement |
|---|---:|---:|---:|---:|---:|---|---|
| L1 | | | | | | No | |
| L2 | | | | | | No | |
| L3 | | | | | | No | |
| RAM | | | | | | No | |
| NVMe | | | | | | Yes | |
| SATA SSD | | | | | | Yes | |
| HDD | | | | | | Yes | |
| Network/cloud | | | | | | Usually | |

The exact rows/metrics should be validated before student release. Do not imply false precision.

## Architecture sensory rule

> **No important architecture adjective without an experience attached to it when a safe, reproducible experiment can provide one.**

Examples:

- "latency-sensitive" should follow an experiment where added waiting changes dependent work;
- "bandwidth-bound" should follow bulk-transfer/streaming evidence;
- "cache-friendly" should follow a working-set/access-pattern experiment;
- "scalable" should follow a worker-count experiment;
- "communication-heavy" should follow a parallel/network experiment;
- "accelerated" should account for setup/data movement as well as steady-state throughput.

## Standard experiment grammar

Every sensory lab should be authorable through the same compact sequence:

1. **Predict** - what resource/constraint should matter?
2. **Perturb** - deliberately change one bounded architectural condition.
3. **Run** - keep the rest of the experiment as controlled as practical.
4. **Measure** - capture machine-readable data where possible.
5. **Visualize** - turn the measurements into a figure/table that exposes shape.
6. **Explain** - connect the shape to an architecture mechanism.
7. **Revise** - change the original explanation/design claim if the evidence demands it.

## Python visualization

Python with **matplotlib** is the default plotting instrument because it lets students turn repeated measurements into visible curves.

The course should provide scaffolds/helpers so the student is not graded on remembering plotting syntax.

Candidate structure:

```text
dossier/
  machine.yaml
  data/
    week08-performance.csv
    week10-memory.csv
    week12-scaling.csv
  plots/
  main.tex
  sections/
```

Candidate student experience:

```bash
archprobe snapshot
archlab run memory
archplot memory
make dossier
```

These command names are **interfaces to evaluate**, not yet promises. Prompt 003 owns implementation and validation.

## LaTeX publishing

LaTeX is useful here because the dossier needs:

- equations;
- units;
- tables;
- figures;
- cross-references;
- readable technical prose;
- a durable compiled PDF.

Students should not receive a "learn LaTeX" side course.

The lab platform should evaluate the smallest reliable path, such as a constrained TeX Live/latexmk setup or another open build path. The repository should provide a template and a one-command build.

LaTeX and Python are instruments. **Architecture evidence and explanation are what earn the grade.**

## Automated machine probe

Prompt 003 should build a small course-owned probe capable of collecting a reproducible snapshot such as:

- OS/kernel/container;
- CPU/architecture/ISA;
- core/thread topology;
- cache information where exposed;
- memory;
- storage;
- GPU/accelerator presence where safely detectable;
- selected tool versions.

Prefer structured output (for example JSON plus a friendly Markdown summary) so later scripts can consume it.

The probe must not require administrator privileges for the required path.

## Network and parallel sensory capability

The lab platform should support a safe way to teach latency and communication cost without requiring students to control a real network.

A good required path may use:

- a user-space delay/rate-limiting harness/proxy/simulator; and/or
- container-local controlled communication;
- optional Linux `netem` enrichment where privileges safely exist;
- a small shared-memory or MPI-style experiment where the environment supports it.

The transferable Week 12 contrast is:

- lots of useful local work between communications; versus
- tiny work followed by frequent dependent communication/synchronization.

Do not reduce this to memorizing that one named workload is "good" and another is "bad."

## Week 14 final dossier defense

Students return to the Week 5 design under the same or explicitly bounded budget/workload.

For at least several important choices, they record:

- original choice;
- current choice;
- changed or deliberately unchanged;
- workload requirement;
- metric chosen;
- evidence from the dossier;
- tradeoff accepted.

The design question is:

> **What would I build now, and what evidence changed or strengthened my decision?**

The dossier is frozen after this checkpoint.

## Equity and access

- CPU-only completion path.
- No required paid AI.
- No required premium CLI agent.
- No required GPU.
- No required private network or Jeremy-owned machine.
- When a personal machine cannot expose a measurement reliably, provide a course-owned trace/data/fallback path that preserves the reasoning goal.
- Premium/frontier/local tools may be visible in instructor recordings but do not change the grading ceiling.
