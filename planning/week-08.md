# Week 8 - Make It Fast Without Breaking It (Oct 5-9)

## Status
Accepted focus; pipeline/performance sensory lab and plotting scaffold still need implementation/validation.

## Weekly Focus
**Why does doing several things at once improve performance, and why does it create new problems?**

This week should make latency, throughput, dependencies, hazards, CPI, and pipeline behavior experiential rather than vocabulary-only.

## Monday - Think / Frame / Lecture
**AI Fluency Lens 8: Reason.**

Lecture: **Make It Fast Without Breaking It.**

Coverage:

- latency versus throughput;
- CPU-time equation and CPI at useful depth;
- pipeline stages;
- structural/data/control hazards;
- forwarding, stalls, flushes;
- branch effects;
- why GHz alone is not a performance argument.

## Wednesday - Investigate / Break / Measure
**Professional Minds: _The Pragmatic Programmer_ - What does professional craftsmanship look like?**

Run a bounded performance/pipeline experiment that contrasts dependent and more-independent work or otherwise makes overlap/hazards visible.

Students predict what should matter before timing/tracing.

## Friday - Explain / Defend / Stack Showcase
**Professional Minds: _Clean Code_ - What does professional craftsmanship look like?**

Use course-scaffolded Python/matplotlib tooling to create the first real **Sensitivity Profile** curve.

Explain what the plot says about latency/throughput/dependencies rather than merely uploading it.

**Stack Showcase:** Jeremy profiles/times the same idea with his real compiler/profiler/tool stack.

## Evidence this week
- controlled performance/pipeline evidence;
- first sensitivity plot;
- explanation of what "fast" means for this experiment;
- revision of any naive Week 5 performance metric that the evidence complicates.

## Machine Dossier role
Add first performance/sensitivity plot and latency/throughput evidence.

## Online-delivery note
M/W/F are asynchronous anchors. Plotting is scaffolded; matplotlib syntax itself is not the learning objective.

## Open authoring notes
Choose an experiment that is stable enough across student systems to teach the concept without rewarding noisy benchmark theater.
