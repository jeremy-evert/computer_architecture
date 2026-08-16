# Prompt 004_e - Author Week 8: Make It Fast Without Breaking It

**Status:** OPEN  
**Depends on:** 004_a, 004_d  
**Continuity:** move the Week 7 correct-execution model into performance/overlap

## Why this week exists

Week 7 asks how an instruction can execute correctly. Week 8 asks why correctness is not enough.

This week should kill the lazy performance instinct that “higher GHz” or “more pipeline stages” automatically means faster.

## Central question

> **Why does overlap improve throughput, and why does it create new problems?**

## Required concepts

At useful undergraduate depth:

- latency vs throughput;
- CPU execution time basics;
- cycle time / CPI relationship;
- pipeline stages as a teaching model;
- dependency;
- data hazards;
- control hazards;
- structural conflicts at bounded depth;
- forwarding;
- stalls;
- flushes/branch effects;
- why modern real CPUs are richer than the teaching pipeline.

Do not claim the native dependency benchmark directly measures physical pipeline depth.

## Monday package

Start with Week 7's one-instruction path, then ask what happens if we overlap several instructions.

The deck should make students predict:

- what overlap can improve;
- which dependencies prevent overlap;
- why latency of one item and throughput of many items differ.

Use a small timing diagram/pipeline trace that students can reason about before running native code.

## Wednesday investigation

Use Prompt 003's supported substrate:

```text
archlab run dependency
archplot dependency ...
```

The native specimen compares one serial dependency chain with more-independent chains using the same total update count.

Students must distinguish:

- what the experiment actually measures;
- what mechanism the result is consistent with;
- what it cannot prove about the physical processor.

This is the first major Sensitivity Profile plot.

## Friday Explain / Defend

Require a claim connecting dependency/overlap to the measured shape plus an explicit scope statement.

Include at least one calculation/trace or plot interpretation so “independent was faster” is insufficient.

## Machine Dossier

Add the first performance/sensitivity plot and a claim about what the workload seems sensitive to.

This is where the dossier begins moving from Machine Map toward Sensitivity Profile.

## AI Fluency Lens 8

Reason.

Have AI predict behavior before measurement and state a mechanism. After the run, compare prediction and evidence. Reward correction, not lucky guessing.

## Professional Minds

Wednesday: *The Pragmatic Programmer*  
Friday: *Clean Code*

Keep the human theme around craftsmanship/quality without letting it swallow Architecture.

## Stack Showcase

Candidates:

- profiler/timing on a real workload;
- compiler optimization/disassembly comparison;
- hardware performance counters if available as optional instructor evidence;
- a real application whose throughput/latency goals conflict.

## Hard decisions 004_e must make

- exact pipeline model depth;
- amount of CPI arithmetic;
- branch/hazard examples;
- exact dependency specimen workload sizes for students;
- whether one or two plots best tell the story;
- how to teach noise/repeated trials without turning Week 8 into statistics class;
- best showcase workload.

## Validation

- execute the exact authored dependency workload;
- generate the plot through `archplot`;
- verify performance calculations and pipeline traces;
- ensure claims do not exceed evidence;
- verify fallback dataset path.

## Report

Write `sidecar/reports/004_e_author_week_08_make_it_fast_without_breaking_it.md`.

## Done when

Students can explain why **dependency changes available overlap**, distinguish latency from throughput, and read a performance curve without pretending the benchmark reveals more microarchitecture than it does.