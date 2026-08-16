# Week 8 Monday - Make It Fast Without Breaking It

## Question

> **Why does overlap improve throughput, and why does it create new problems?**

## Correct is not fast

Week 7 explained how one instruction can execute correctly. Performance begins when many instructions/work items compete for time and resources.

## Latency versus throughput

**Latency** asks how long one dependency path takes. **Throughput** asks how many independent units of work can complete per unit time. A design can improve one without proportionally improving the other.

## CPU-time model

Use the bounded model:

`CPU time ≈ instruction count × CPI × cycle time`

Every term is conditional. The formula organizes reasoning; it is not a universal benchmark score.

## Teaching pipeline

Use a five-stage teaching path, IF/ID/EX/MEM/WB, only to make overlap visible. Do not claim every real CPU literally has five stages.

## Hazards

- data dependency can force waiting;
- forwarding can satisfy some dependencies sooner;
- stalls preserve correctness when data/resources are not ready;
- branches create uncertainty about which future instructions are useful;
- structural conflicts occur when work competes for the same resource.

## Native sensory experiment

The course compares a serial dependency chain with four more-independent chains while holding total update count fixed. The experiment is consistent with available instruction-level overlap, but does not expose exact physical pipeline depth.

## AI Fluency

Have AI predict the result and state a mechanism **before** measurement. After the run, distinguish lucky prediction from an explanation that survives evidence.

## Prediction

Commit to dependent versus independent behavior before seeing the canonical plot.