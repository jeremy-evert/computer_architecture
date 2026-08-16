# Prompt 004_m - Execute and validate student-release readiness

**Status:** OPEN  
**Depends on:** authored Weeks 5-14; may begin platform subchecks earlier when useful  
**Purpose:** prove the authored course actually runs on the surfaces we intend to claim

## Why this prompt exists

Prompt 003 proved the laboratory substrate on an executed Linux surface and deliberately left named platform YELLOWs. Prompt 004's week authors will create real commands, workload sizes, plots, dossiers, and teaching assumptions.

004_m is where claims become support.

This prompt is not a curriculum rewrite. It is the **hardware-and-execution truth pass**.

## Available real-world validation opportunity

There are accessible Windows and Mac machines that can be used to burn down yellow paint. Use them deliberately when this prompt is executed.

Do not promote a platform from YELLOW because documentation says it should work.

## Mission

Execute the actual authored Weeks 5-14 paths and classify support honestly.

## Required platform targets

### Linux

Re-run the final authored workloads, not only Prompt 003's original smoke defaults.

### Windows / WSL2

On at least one real Windows machine:

- establish/verify WSL2 path;
- run `archlab doctor`;
- run `archprobe` with scope interpreted honestly;
- execute representative RISC-V, dependency, memory, scaling, communication, vector experiments;
- generate plots;
- build dossier PDF;
- record install/admin friction;
- distinguish Windows-host truth from WSL-visible truth.

If WSL installation itself requires institutional/admin handling, record it as deployment work rather than improvising around policy.

### macOS

On a real Mac:

- run the native/appropriate probe path;
- determine which chamber capabilities work natively;
- determine whether container/runtime path is cleaner;
- record Apple Silicon differences where applicable;
- execute as much of the actual authored course as honestly supported;
- do not force x86 assumptions.

### Containerfile/runtime

Build the actual `lab/Containerfile` under at least one intended runtime if available.

Record:

- build success;
- image size;
- first-run cost;
- mounted-workflow behavior;
- plotting/PDF output behavior;
- host-observation limitations;
- Docker vs Podman support truth.

## Week-level execution matrix

For each Week 5-14 record:

- exact required commands;
- Linux result;
- WSL result;
- macOS result if claimed;
- fallback result;
- runtime duration on representative hardware;
- generated artifacts;
- failure modes;
- student-facing troubleshooting needed.

A week may be GREEN on one supported path and YELLOW elsewhere.

## Yellow-paint priorities

Specifically attempt to resolve:

1. WSL2 execution;
2. Windows-host vs WSL Observatory scope;
3. Containerfile build/image size;
4. Podman support decision;
5. macOS native/container feasibility;
6. authored workload tuning on normal machines.

## Equity checks

Validate that:

- CPU-only path remains complete;
- no required GPU appears accidentally;
- no premium AI appears in a required command;
- no root/admin is required after initial institution-approved environment setup;
- fallback evidence produces the same reasoning task;
- faster hardware does not create extra points.

## Measurement-hygiene checks

On different machines, expect different numbers.

We want:

- meaningful shapes;
- interpretable variation;
- explicit scope;
- honest fallback when a phenomenon is weak.

Do not tune tests to force identical answers across machines.

## Failure doctrine

A platform failure is useful evidence.

Classify it:

- authoring bug;
- lab-substrate bug;
- platform limitation;
- institutional/admin issue;
- optional capability missing;
- measurement too noisy;
- documentation problem.

Fix the smallest correct layer.

Do not rewrite curriculum to appease one platform unless the required access contract truly fails.

## Required durable outputs

- updated support matrix;
- updated troubleshooting/bootstrap docs;
- week-level validation receipts;
- any necessary small lab fixes;
- current fallback datasets where needed;
- explicit GREEN/YELLOW/RED platform matrix.

## Report

Write `sidecar/reports/004_m_execute_validate_student_release_readiness.md`.

## Done when

We can tell a student, without vibes:

- which path is supported;
- exactly how to start;
- what commands should work;
- what output artifacts to expect;
- what to do when their hardware does not expose a clean phenomenon;
- which platform claims remain unproven.

This is where yellow paint becomes either **green evidence or an honest warning label**.