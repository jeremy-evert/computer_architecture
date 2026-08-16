# Week 13 Monday - Different Machines for Different Work

## Question

> **When does the workload justify a different kind of machine?**

## General workers are not the only organization

Week 12 showed that general-purpose parallelism pays synchronization, scheduling, cache, and communication costs. Week 13 asks whether regular work can justify a different execution organization.

## Scalar and vector

Scalar instructions operate on individual data elements. SIMD/vector execution can apply similar operations across multiple elements when data/control shape allows it.

## Compiler vectorization is a decision

A modern compiler checks whether vectorization is legal and uses a cost model to decide whether/how to transform code. A vectorization remark proves a transformation decision, **not** a runtime win.

## Throughput orientation

Vector/GPU-style organizations reward abundant regular data-parallel work. Dependencies, divergent control, irregular memory access, small problem sizes, or bandwidth limits can weaken the benefit.

## Data movement is work

Accelerator decisions must include setup, launch, transfer, and memory movement. A fast kernel can lose to a slower-looking CPU path when the fixed costs dominate.

## GPU/SIMT at conceptual depth

Many lightweight lanes execute related threads in groups. Memory hierarchy and scheduling are tuned for throughput. CUDA programming is not required.

## Precision is architectural

FP32, FP16, BF16, and int8 can trade precision/range, storage/bandwidth, and accelerator throughput. This is a design dimension, not a new numeric-formats unit.

## Preserve inconvenient evidence

Prompt 003's reference run reported vectorization but worse runtime for the vectorized/native build. The lesson is not 'vectorization is bad.' The lesson is **specialization must earn its cost for this workload and condition**.

## AI Fluency

Ask AI to recommend scalar/vector/GPU/general-purpose execution for a bounded workload. Then make the decision from measured and inspection evidence.