# Sidecar Prompt 007 - Repair Architecture Savnac launch-source validation

**Status:** IMPLEMENTED — AWAITING REAL BRANDY ACCEPTANCE  
**Owner:** Foreman / validation worker  
**Priority:** BLOCKS Prompt 006 until accepted  
**Target branch:** `savnac/architecture-launch-readiness`  
**Implemented branch tip to validate:** `3ab17ba5d0d943cf9f63b6de378ef104dc3002f3`

## Mission

Turn the real Brandy launch-source validation from RED into an honest GREEN or explicitly bounded YELLOW without weakening the course contract or pretending Brandy has tools it does not have.

This is a validation-contract repair, not a machine-configuration campaign.

## Current state

The repair has been authored on the target branch but is **not accepted until Brandy fast-forwards to the implemented tip and reruns the real validator**.

Before judging the repair, prove the worktree is actually on the intended code:

```bash
git pull --ff-only
git rev-parse HEAD
```

Expected commit:

```text
3ab17ba5d0d943cf9f63b6de378ef104dc3002f3
```

A validation result from an older commit does not accept or reject this implementation.

## Evidence that opened this prompt

Real Brandy receipts against the older launch tip `3221af8d4d76a84e92fb5560d94f8b834353263e` were RED.

Observed facts:

- host: Brandy;
- Python: 3.9.21;
- all newly authored launch-source files existed;
- no launch-week template placeholders remained;
- the Week 2 portable Python machine probe executed;
- validation stopped because `./lab/bin/archlab doctor` exited 1.

## Important contract distinction

`archlab doctor` is a capability diagnostic for the *full* laboratory. It currently checks, among other things, Python version, plotting, RISC-V cross-compile capability, PDF build capability, OpenMP, and other laboratory prerequisites.

Week 3 does **not** say every machine must make the full doctor PASS. The student source now names the committed course fallback explicitly when full local capability is unavailable.

Therefore the Savnac launch-source validator must not silently redefine "source ready" to mean "this particular Brandy host satisfies the entire semester laboratory stack."

## Implemented repair

The target branch now:

- keeps `archlab doctor` strict;
- captures doctor output even when the diagnostic exits nonzero;
- distinguishes launch-source readiness from full-lab host capability;
- preserves missing full-lab capabilities as named YELLOW evidence when the required/fallback student path remains usable;
- verifies the committed Week 3 fallback path rather than gesturing vaguely at fallback evidence;
- keeps missing source, missing fallback, broken required path, or validator execution failure as RED.

Week 3 now points to the real committed privacy-safe fallback receipt under `lab/fallback_data/` rather than leaving students to infer which artifact to use.

## Required acceptance work

1. Fast-forward the Brandy Architecture Savnac worktree to the implemented branch tip and assert the exact commit before validation.
2. Run:

```bash
python3 scripts/validate_savnac_launch_source.py
```

3. Retain the full receipt, including doctor output and missing capability details.
4. Confirm repeated `archprobe` behavior or the documented fallback behavior as recorded by the validator.
5. Run:

```bash
git diff --check
```

6. Retain the new real Brandy receipt under `sidecar/runs/`.
7. Update Prompt 006/readiness reporting only from the observed result.

Do **not** install packages, elevate privileges, or mutate Brandy merely to turn diagnostic YELLOWs green.

## Acceptance

Accept when:

- the Brandy worktree is proven to be on `3ab17ba5d0d943cf9f63b6de378ef104dc3002f3` or a descendant containing the same repair;
- newly authored Week 2-4/15/17 source checks remain GREEN;
- the validator no longer treats optional/full-semester host capabilities as an unexplained source-launch RED;
- doctor output and missing capabilities are visible in the receipt;
- required `archprobe`/fallback behavior is proved honestly;
- no machine configuration was changed;
- no production Canvas or Savnac write occurred;
- a real Brandy receipt records the result.

A bounded YELLOW is acceptable if the only remaining limitations are named platform/toolchain capabilities already covered by the course fallback doctrine. RED remains required for missing source, unusable required path, missing fallback, or validator execution failure.

## Done when

Prompt 006 can consume a trustworthy launch-source readiness receipt instead of conflating "Brandy is not the entire lab image" with "the course source is not deployable."
