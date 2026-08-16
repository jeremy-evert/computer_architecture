# Week 13 - Different Machines for Different Work (Nov 9-13)

## Status
Accepted focus; exact scalar/vector/accelerator comparison and CPU-only fallback need implementation/validation.

## Weekly Focus
**When does workload shape justify a different kind of machine?**

Specialization should emerge as a response to workload structure, throughput, data movement, and cost rather than as a parade of GPU buzzwords.

## Monday - Think / Frame / Lecture
**AI Fluency Lens 13: Decide.**

Lecture: **Different Machines for Different Work.**

Coverage:

- SIMD/vector processing;
- GPU/SIMT concepts;
- throughput-oriented versus latency-oriented design;
- memory/bandwidth/data movement;
- setup/transfer overhead;
- accelerator/tensor/ML workload shapes;
- tradeoffs with general-purpose CPU execution.

## Wednesday - Investigate / Break / Measure
**Professional Minds: _97 Things Every Programmer Should Know_ - How do professionals work with others?**

Compare the same conceptual workload under two or more execution organizations such as scalar versus vectorized or CPU versus accelerator-shaped execution.

**CPU-only required path is mandatory.** Optional GPU evidence may enrich the comparison but cannot gate success.

## Friday - Explain / Defend / Stack Showcase
**Professional Minds: _How to Win Friends and Influence People_ - How do professionals work with others?**

Defend one workload/architecture match while naming setup/data-movement costs and a real tradeoff.

**Stack Showcase:** Jeremy may use a GPU/accelerator/vector path on his own hardware to demonstrate what students would see on richer systems.

## Evidence this week
A specialization/workload-fit receipt using measurement/trace evidence and an explicit tradeoff.

## Machine Dossier role
Add workload-fit/general-versus-specialized evidence. Revisit representation formats where FP32/FP16/BF16/int8 or another format materially clarifies accelerator tradeoffs.

## Online-delivery note
M/W/F are asynchronous anchors. No student GPU requirement.

## Open authoring notes
Avoid making GPU ownership an implicit prestige path. The CPU-only experiment must preserve the same reasoning objective.
