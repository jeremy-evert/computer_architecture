# Week 12 instructor / recording plan

Start with `double the workers` as the naive belief. Use one Amdahl calculation, then explain why reality can be worse/different.

## Canonical paths

Use the exact student commands. Prompt 003's reference smoke observed speedup ~1.0, 1.89, 3.40 for 1/2/4 workers and about 1.304 s Chatterbox versus 0.020 s Freight Train at the 20 ms setting on that validation surface. These are receipts, not expected student answers.

## Stack Showcase

The preferred real-world showcase is the course-owned supplemental deck:

`stack-showcase-race-conditions.tex`

It uses the live 2026-08-16/17 Foreman incident as a concrete concurrency story:

- Lead Foreman pulled from the top of the task queue;
- Assistant Foreman pulled from the bottom;
- the logical work was partitioned;
- both processes still mutated the same `jeremy_task_tracking` checkout/index/control files;
- visible state changed underneath the other process;
- Git eventually surfaced divergence/inconsistency and the Lead stopped rather than forcing a winner;
- the repair combines one worktree per Foreman seat with explicit single-writer ownership of canonical control-plane files.

The teaching bridge is:

> **Partitioning work does not partition state.**

Use the story to connect Week 12's worker-count/synchronization model to agents, Git repositories, network separation, process isolation, and real shared-state ownership. The network itself was not the failure boundary; the mutable checkout was.

The deck should remain a Stack Showcase, not a new graded student lab. Students do not need Claude Code, Codex, private hosts, or the Foreman system to understand or reproduce the architecture principle.

Other optional demonstrations may still use a larger multicore machine, parallel build/data workload, MPI, or NRP. Show a scaling ceiling and a cost of cooperation. Students do not reproduce the instructor environment.
