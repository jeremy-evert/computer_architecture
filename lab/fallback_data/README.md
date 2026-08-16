# Reference fallback data

These small datasets preserve the **reasoning task** when a student's machine cannot expose a phenomenon cleanly or the required local compiler/tool is unavailable after reasonable troubleshooting.

They were captured on 2026-08-16 in a **container-visible x86_64 Linux environment** during Prompt 003 / Week 5 validation. They are intentionally not a performance baseline, hardware ranking, or promise that another machine should reproduce the same numbers.

## Week 5 observable-machine fallback

- `week05-machine-reference.json`
- `week05-machine-reference.txt`

This is a real privacy-safe `archprobe` receipt from the validation environment. Its most important teaching feature is the scope label: **container-visible**. It is useful when a student's local Observatory path is unavailable because the student can still build the Machine Map, interpret cache/memory/CPU fields, and explain why environment-visible evidence must not be silently promoted into a claim about the physical host.

The receipt reports an AMD EPYC 9V74 model while exposing only five logical processors. Do not interpret that combination as a physical machine inventory. The discrepancy is exactly why the Observatory records scope.

## Sensory-lab fallback datasets

The other CSV files support later weeks. Use them to practice:

- identifying the shape of dependent-access latency as working set grows;
- comparing measured vs ideal shared-memory scaling;
- comparing a chatty communication pattern with a bulk-transfer pattern as controlled per-message waiting is increased.

A student using fallback evidence must still make a prediction, interpret the evidence/figure, explain the mechanism, and state the limitation that the data were course-provided rather than measured on the student's own machine.

Fallback evidence has the same grading ceiling as locally measured evidence.
