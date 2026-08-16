# Week 12 - More Cores, More Problems (Nov 2-6)

## Status
Accepted sensory-lab focus; shared-memory/communication harness and validation still need implementation.

## Weekly Focus
**When does adding workers help, and when does cooperation cost more than it buys?**

Students should feel the difference between a workload that can do substantial local work and one that constantly waits, synchronizes, or communicates.

## Monday - Think / Frame / Lecture
**AI Fluency Lens 12: Revise.**

Lecture: **More Cores, More Problems.**

Coverage:

- thread/data parallelism;
- speedup and Amdahl's Law;
- shared memory;
- synchronization;
- cache coherence;
- false sharing;
- computation-to-communication ratio;
- latency/synchronization as scaling constraints.

## Wednesday - Investigate / Break / Measure
**Professional Minds: _Getting Things Done_ - How do professionals sustain performance?**

Parallel sensory lab comparing:

- chunky/local useful work between coordination events; versus
- deliberately chatty/dependent/synchronized work.

Vary worker count and, where the validated harness permits, communication/synchronization delay.

MPI may appear if Prompt 003 proves it humane; MPI itself is not the objective.

## Friday - Explain / Defend / Stack Showcase
**Professional Minds: _Joy on Demand_ - How do professionals sustain performance?**

Plot runtime/speedup against workers and/or added communication delay. Explain the shape and identify where additional workers stopped helping.

**Stack Showcase:** Jeremy may demonstrate a multicore/MPI/NRP-style run on a richer system to show where the road leads.

## Evidence this week
Scaling/communication Sensitivity Profile update:

- controlled experiment receipt;
- plot;
- explanation of computation versus coordination;
- revised belief about "more cores = faster."

## Machine Dossier role
Add core/thread topology context plus measured scaling/communication sensitivity.

## Online-delivery note
M/W/F are asynchronous anchors. Required path must run on ordinary CPU hardware without access to Jeremy's cluster/network.

## Open authoring notes
Teach the transferable communication-to-computation principle rather than memorizing that a named application is inherently latency-sensitive or insensitive.
