# Week 10 Monday - Make the Memory Hierarchy Hurt

## Question

> **Why do we need layers of memory, and what does crossing a layer feel like?**

## Attack the Week 5 ledger

Week 5 could inventory capacity and price. It could not yet say how a workload experiences the hierarchy. Now we add evidence.

## Locality

**Temporal locality** reuses recently accessed data. **Spatial locality** accesses nearby data. Cache lines exploit nearby reuse; dependent pointer chasing intentionally limits easy streaming/prefetch behavior.

## Latency versus bandwidth

Pointer chasing asks how quickly the **next dependent address** becomes available. Streaming asks how much contiguous data can move per unit time. These are different architecture questions.

## Working set

As active data outgrows a level, service can come from farther away and behavior can change. Real transitions are not perfect stair steps.

## Bounded cache mechanics

Use line/block, hit/miss, set/associativity, and replacement only far enough to explain why placement/reuse matter. Avoid hand-simulated cache-table marathons.

## AMAT as a model

A small average-memory-access-time example can show why a small miss rate matters when miss cost is high. AMAT is a simplified reasoning model, not a prediction of the native sweep.

## AI Fluency

Give AI a confident cache/memory claim or an exact boundary interpretation, then critique its precision with the measured curve and source evidence.

## Prediction

Sketch pointer-chase latency and streaming-bandwidth shapes **before** running the experiment.