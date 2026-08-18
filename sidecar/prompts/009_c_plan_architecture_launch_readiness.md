# Prompt 009c — Plan the Computer Architecture launch-readiness route

**Status:** READY TO EXECUTE  
**Initiative charter:** `sidecar/prompts/009_architecture_launch_readiness_lifecycle.md`  
**Accepted report:** `sidecar/reports/009_a_report_architecture_launch_readiness.md`  
**Accepted map:** `sidecar/reports/009_b_map_architecture_launch_ready_shape.md`  
**Mode:** bounded implementation planning; no implementation and no LMS writes  
**Worksite:** `computer_architecture`

## Mission

Turn the accepted 009b map into the smallest evidence-gated route from today's diverged source state to an independently validated Architecture launch state.

The plan must name exact ordered `009_d_NN` units, their dependencies, authority, evidence, and stop conditions. Do not implement source changes or author the `d_NN` prompts during this prompt.

Do not pre-author a speculative shared-infrastructure repair. If later execution exposes a real Course Foundry/Harbor/shared defect, Foreman may add the next unused `d_NN` unit from that evidence.

## Read first

- `sidecar/prompts/009_architecture_launch_readiness_lifecycle.md`
- `sidecar/reports/009_a_report_architecture_launch_readiness.md`
- `sidecar/reports/009_b_map_architecture_launch_ready_shape.md`
- `AGENTS.md`
- `sidecar/README.md`
- current `main...savnac/architecture-launch-readiness` compare evidence
- accepted Prompt-006 evidence
- current CS1 102/103/104 responsibility split as a family pattern only.

## Required plan

Write:

`sidecar/reports/009_c_plan_architecture_launch_readiness.md`

The plan must include:

1. route summary and explicit non-goals;
2. exact ordered `d_NN` units;
3. for every unit: one noun-shaped responsibility, named paths/surfaces, dependency, allowed authority, forbidden scope, acceptance proof, evidence destination, and retry/repair route;
4. which units are safe now entirely within `computer_architecture`;
5. which units require a local execution seat/shared read access but no shared mutation;
6. which units must wait for a collision-free ownership window or explicit production authorization;
7. a conditional Savnac re-proof decision rather than an automatic rewrite;
8. a CS1-102-style Architecture production reconnaissance unit that performs no write;
9. a production-write unit that is authored but cannot execute without an explicit gate;
10. a separate launch-closeout unit;
11. the exact 009e final validation contract;
12. any genuine human question and the exact unit it blocks. Runtime/tool availability is not a human preference question.

## Unit sizing rule

Split responsibilities when they can fail, be reviewed, or be retried independently.

Do not combine:

- branch/source reconciliation with production target discovery;
- stale status repair with shared compiler repair;
- production write with post-write launch validation.

Do not create busywork units for optional platform experiments that are not launch blockers.

## Concurrency rule

Cleo owns Brandy and active CS1 dispatch work. Until that ownership window is explicitly clear:

- `computer_architecture` is mutable;
- `course_foundry`, `harbor`, shared curriculum repos, and Brandy are read-only evidence surfaces at most;
- no shared repair commit is allowed merely because Architecture discovers a defect.

## Acceptance criterion

009c is acceptable only if a fresh Foreman can author every planned implementation prompt without guessing:

- exact responsibility;
- current dependency;
- authority boundary;
- expected evidence;
- stop condition;
- whether a production/Savnac/shared mutation is actually authorized.

The route should make the first safe useful unit obvious.

## Stop condition

Stop after the plan report is durable and reviewed. Do not author or execute `d_NN` or 009e in this stage.
