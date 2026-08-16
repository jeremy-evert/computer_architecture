# Prompt 004_i - Author Week 12: More Cores, More Problems

**Status:** OPEN  
**Depends on:** 004_a; Prompt 003 scaling + communication substrate  
**Continuity:** create workload family that Week 13 can reuse

## Why this week exists

Students have spent years hearing that more cores means more performance. Week 12 should make that statement uncomfortable.

The week needs two sensory experiences:

1. work can fail to scale because some fraction does not parallelize or because coordination/cache/scheduling costs grow;
2. communication shape matters, so frequent dependent waiting can dominate even when total data moved is small.

## Central question

> **When does adding workers help, and when does cooperation cost more than it buys?**

## Required concepts

- thread/data parallelism;
- Amdahl's Law;
- speedup/efficiency at bounded depth;
- shared memory;
- synchronization;
- coherence at conceptual depth;
- false sharing;
- workload grain;
- communication-to-computation ratio;
- waiting/coordination cost.

MPI syntax is not a learning goal.

## Monday package

Start with a simple “double the workers” belief and build a quantitative prediction.

Teach enough Amdahl to make a falsifiable model, then introduce reasons reality may be worse or simply different.

Set up two workload shapes:

- chunky/local useful work;
- chatty/dependent coordination.

## Wednesday investigation

Use both stable experiments, but author them as one coherent investigation rather than two unrelated labs:

```text
archlab run scaling
archplot scaling ...

archlab run communication
archplot communication ...
```

### Scaling half

Vary worker count and measure runtime/speedup.

### Communication half

Preserve **Chatterbox vs Freight Train**.

Vary controlled per-message wait and compare many dependent exchanges with bulk transfer.

State explicitly: this is a user-space model of per-message waiting cost, not direct Internet latency measurement.

## Friday Explain / Defend

Students should answer something stronger than “four threads was fastest.”

Require:

- where scaling improved;
- where returns diminished or evidence became noisy;
- one plausible coordination/cache/scheduling mechanism;
- how communication shape changes sensitivity to waiting;
- a revised rule for when “more workers” helps.

## Machine Dossier

Add scaling and communication Sensitivity Profile evidence.

## AI Fluency Lens 12

Revise.

Make students record a scaling prediction, then explicitly revise the model after evidence. AI can propose reasons for deviation, but students must distinguish measured fact from plausible mechanism.

## Professional Minds

Wednesday: *Getting Things Done*  
Friday: *Joy on Demand*

Keep it human and sustainable-performance oriented, not forced parallel-computing analogy theater.

## Stack Showcase

Ideal options:

- bigger multicore machine;
- MPI demonstration;
- NRP/cluster-style scaling;
- real parallel build/data workload;
- false-sharing/perf-counter demonstration.

Students need not reproduce the instructor environment.

## Hard decisions 004_i must make

- default worker counts and runtime size;
- exact Amdahl math depth;
- whether false sharing gets a live micro-demo or conceptual trace;
- how to sequence scaling + communication inside one humane Wednesday;
- whether the same core workload can seed Week 13;
- best larger-system showcase;
- what to do on 2-core/low-core student machines.

## Validation

- execute authored scaling and communication runs on representative hardware where possible;
- ensure runtime is humane;
- verify plots/units;
- validate fallback data;
- ensure no-root path;
- audit claims about coherence/false sharing so measurement and inference stay distinct.

## Report

Write `sidecar/reports/004_i_author_week_12_more_cores_more_problems.md`.

## Done when

Students can say **why more workers is a hypothesis, not a guarantee**, and can distinguish computation, synchronization, and communication shape as separate forces.