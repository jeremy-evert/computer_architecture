# Week 10 - Make the Memory Hierarchy Hurt (Oct 19-23)

## Status
Accepted sensory-lab focus; memory benchmark harness, plotting helper, and validation still need implementation.

## Weekly Focus
**Why do we need layers of memory, and what does crossing a layer feel like?**

This is a major sensory week. Cache, locality, latency, bandwidth, and working-set size should become experiences attached to measured curves.

## Monday - Think / Frame / Lecture
**AI Fluency Lens 10: Critique.**

Lecture: **Make the Memory Hierarchy Hurt.**

Critique claims such as "more memory is faster" or "cache is just small RAM."

Coverage:

- temporal/spatial locality;
- cache blocks/lines;
- mapping/associativity/replacement at useful depth;
- hits/misses;
- basic AMAT;
- latency versus bandwidth;
- capacity and hierarchy tradeoffs.

## Wednesday - Investigate / Break / Measure
**Professional Minds: _Software Engineering_ - How do teams build quality systems?**

Run a memory sensory experiment such as:

- dependent pointer chase versus streaming/bulk access;
- increasing working-set sizes;
- repeated controlled measurements.

Students should attempt to **find the cliffs** rather than being handed a graph to memorize.

## Friday - Explain / Defend / Stack Showcase
**Professional Minds: _Agile Software Development_ - How do teams build quality systems?**

Plot working-set size/access behavior against latency/throughput using course helpers. Annotate likely hierarchy transitions only where the evidence justifies them.

Revisit Week 5 **Dollars-Per** with latency/bandwidth/Time-Per context.

**Stack Showcase:** Jeremy runs a richer cache/memory profiler or counter path on one of his systems.

## Evidence this week
Major Sensitivity Profile update:

- raw measurement receipt;
- memory hierarchy plot(s);
- latency/bandwidth explanation;
- revised hierarchy/economics claim.

## Machine Dossier role
Major expansion: measured memory hierarchy rather than specification-only hierarchy.

## Online-delivery note
M/W/F are asynchronous anchors. If a student's hardware cannot expose a clean cliff, provide course-owned fallback data that preserves the reasoning task.

## Open authoring notes
Avoid false precision and cross-machine benchmark contests. The shape/mechanism matters more than whose laptop is fastest.
