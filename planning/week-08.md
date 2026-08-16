# Week 8 — Do Many Things at Once: Pipelining + Performance (Oct 5–9)

## Status
Accepted spine; detailed pipeline activity and measurement path still need authoring/validation.

## Weekly Focus
How can a processor overlap instruction execution without violating the ISA contract? Introduce latency, throughput, CPI, pipeline stages, hazards, forwarding, stalls, flushing, and branch effects at an appropriate depth.

This is the second half of the **Correct + Fast** sister pair with Week 7.

## Monday — Oct 5 — Frame
Start from Week 7's one-instruction datapath and ask what changes when several instructions occupy different stages at once. Distinguish latency from throughput and connect the pipeline to performance goals.

## Wednesday — Oct 7 — Inspect / Build / Measure
Trace overlapping instructions through a simple pipeline. Expose at least one data/control hazard and observe or calculate the consequence of forwarding, stalling, or flushing.

## Friday — Oct 9 — Explain / Defend
Defend one performance claim: what improved, what new complication appeared, and what evidence supports the explanation.

## Evidence this week
A pipeline timing/trace artifact plus a short performance interpretation using appropriate metrics such as cycles, CPI, latency, or throughput.

## Open authoring notes
Branch prediction, superscalar execution, and out-of-order execution are candidates for enrichment or later tradeoff discussion. Do not crowd the core pipeline mental model merely to name modern features.
