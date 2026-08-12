# COMSC-3013 Computer Architecture — Fall 2026 course design

## Design basis

COMSC-3013 asks students to explain a modern machine as a connected stack:
software expresses intent, an ISA constrains that expression, processor and
memory implementations make it physical, and parallel systems trade simple
stories for real performance and coordination. The official offering remains
online/asynchronous; the M/W/F 2 PM cadence is an instructor planning rhythm,
not a student meeting claim. This design retains the existing 17-week,
six-chapter spine and its holiday structure.

Students should be able to (1) reason quantitatively about performance and
representation; (2) trace a program through assembly, datapath, memory, and
OS-facing abstractions; (3) explain tradeoffs in ISA, arithmetic, pipelines,
caches, and parallel systems; (4) inspect real evidence rather than accept an
AI or tool explanation uncritically; and (5) communicate a defensible systems
claim. No formal prerequisite is recorded, so Week 1 must establish a safe
baseline in binary, command-line work, and C-like program reading.

Recurring instruments are deliberately woven through the semester: Linux/WSL
shell, filesystem and process inspection, minimal vi/vim, Git, compiler and
binary inspection, GDB, and introductory containers. They are evidence tools
for the week's machine question, never a detached "tools unit." ChatGPT,
Claude, and similar models may be used as curiosity and reasoning companions;
students must label their use, inspect generated claims/commands, and validate
them against compiler output, debugger state, documentation, or measured
machine behavior.

## Semester spine and student module blueprint

Every Canvas/Savnac module has: Week at a Glance; short instructor framing;
selected zyBook links; an inspect/annotate activity; an evidence submission or
checkpoint; rubric/feedback link when authored; and a publish/readiness check
(overview, links, activity, and submission instructions visible). Dates,
weights, and completed assignments are intentionally not invented.

| Week | Central question and objectives | KEEP / OPTIONAL menu | Activity / evidence and module emphasis | Gap or dependency |
|---|---|---|---|---|
| 1 | What is a layered machine? Establish environment, binary vocabulary, and inspect a process/file. | 1.1–1.4 / 1.14–1.15 | Orientation plus shell/Git/vi baseline; short observation log. | Ensure WSL/Linux access path. |
| 2 | How do abstraction, technology, and performance claims relate? | 1.5–1.7 / 1.9–1.11 | Measure/compare a simple program; explain metric choice. | Tooling examples need authoring. |
| 3 | Why did power and parallelism change design? | 1.8, 1.12 / 1.13 | Read compiler/binary artifacts; performance claim critique. | No fixed lab yet. |
| 4 | How does an ISA express computation? | 2.1–2.5 / 2.16–2.19 | Assemble/disassemble small examples; representation check. | Labor Day short week. |
| 5 | How do logic, branches, and data movement become instructions? | 2.6–2.8 / 2.9–2.10 | GDB register/control-flow trace. | Need accessible simulator choice. |
| 6 | How do procedures, addressing, and translation connect source to machine? | 2.12–2.14, 2.27 / 2.15, 2.20–2.21 | Compile, inspect, and debug a small program; Git checkpoint. | C familiarity varies. |
| 7 | How does finite arithmetic work? | 3.1–3.4 / 3.9–3.13 | Bit-level trace and test cases. | Arithmetic remediation path. |
| 8 | What breaks when numbers approximate? | 3.5–3.6 / 3.7–3.8 | Floating-point experiment and explanation. | Avoid overloading short conceptual unit. |
| 9 | Can we connect performance, ISA, and arithmetic evidence? | review KEEP / selected self-study | Integrative checkpoint; revise a prior machine claim. | Fall-break short week. |
| 10 | What datapath carries an instruction? | 4.1–4.4 / 4.14 | Diagram-to-observation activity; compiler/binary tie-back. | Digital-logic bridge material needed. |
| 11 | Why do control and cycles complicate implementation? | 4.5–4.7 / 4.11–4.13 | Trace a multicycle/pipeline scenario. | Need visual simulation/instructor material. |
| 12 | How do hazards and exceptions expose tradeoffs? | 4.8–4.10 / 4.12, 4.15–4.19 | Hazard evidence explanation; AI answer must be checked against trace. | Pipeline practice material needed. |
| 13 | Why is memory hierarchy a performance design? | 5.1–5.4 / 5.13–5.15 | Cache locality experiment or trace. | Provide runnable local/contained tooling. |
| 14 | How do protection and sharing reshape memory? | 5.5–5.8 / 5.9–5.12 | Inspect process memory/filesystem boundary; virtual-memory explanation. | OS-facing reading/activity needed. |
| 15 | What makes parallel programs difficult? | 6.1–6.4 / 6.14–6.18 | Lightweight parallelism case analysis. | Thanksgiving Monday only. |
| 16 | Which parallel architecture fits which workload? | 6.5–6.8 / 6.9–6.13 | Compare multicore/GPU/cluster evidence; containerized reproducibility demo. | Scope container intro carefully. |
| 17 | What can we now explain about a real machine? | selected review / references | Cumulative systems narrative and final readiness check. | Final assessment form remains Jeremy decision. |

## ZyBooks is not the whole course

The zyBook supplies a strong conceptual/reference menu but not sufficient
practice in command-line observation, source-to-binary inspection, debugging,
collaborative Git workflows, container reproducibility, or disciplined
AI-assisted investigation. Instructor-created guided traces, small executable
experiments, accessibility-conscious walkthroughs, and a cumulative evidence
portfolio are required. RISC-V labs and appendices are reference/enrichment,
not a replacement for that work.

## Open decisions and readiness gaps

Jeremy needs to choose the supported local environment/simulator, the shape of
the cumulative assessment/portfolio, and any grading model or due-date policy.
Before Canvas deployment, author the weekly activities and rubrics, check tool
accessibility, and verify every selected zyBook deep link. No claim here
changes vendor configuration or price.
