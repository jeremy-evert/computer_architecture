# Reference fallback data

These small datasets preserve the **reasoning task** when a student's machine cannot expose a phenomenon cleanly or the required local compiler/tool is unavailable after reasonable troubleshooting.

Numeric sensory datasets were captured on 2026-08-16 in a **container-visible x86_64 Linux environment** during Prompt 003 / Week 5 validation. They are intentionally not a performance baseline, hardware ranking, or promise that another machine should reproduce the same numbers.

## Week 5 observable-machine fallback

- `week05-machine-reference.json`
- `week05-machine-reference.txt`

This is a real privacy-safe `archprobe` receipt. Its most important teaching feature is the scope label: **container-visible**. The receipt reports an AMD EPYC 9V74 model while exposing only five logical processors; that discrepancy is exactly why evidence scope matters.

## Weeks 6/9 RISC-V fallback

- `week06-riscv-source-to-cpu-reference.txt`

This packet reproduces the committed `transform()` source-to-RV32I disassembly and records the validated final architectural state (`a0=18`, `a1=18`). It preserves the same representation/disassembly/state reasoning task without pretending to be cycle accurate.

## Sensory-lab fallbacks

- `dependency-reference.csv` - Week 8 dependency/available-overlap interpretation.
- `memory-reference.csv` - Week 10 working-set latency and streaming-bandwidth interpretation.
- `scaling-reference.csv` - Week 12 shared-memory scaling interpretation.
- `communication-reference.csv` - Week 12 Chatterbox/Freight Train waiting sensitivity.
- `vector-reference.csv` + `vectorization-reference.txt` - Week 13 timing plus the durable fact that the validation compiler reported vectorization.

A student using fallback evidence must still make a prediction, create/read the figure where applicable, explain the mechanism, distinguish measurement from inference, and state that the data were course-provided rather than measured on the student's machine.

## Week 11 VM/process fallback

- `week11-process-map-reference.txt`

This is explicitly a **curated teaching trace, not a live machine receipt**. It preserves the mapping/permissions/translation reasoning task on platforms where Linux `/proc/self/maps` is unavailable. Students must not promote its example virtual addresses into claims about their own machine or physical frames.

Fallback evidence has the same grading ceiling as locally measured evidence. Faster, more expensive, or more cooperative hardware never creates extra points.
