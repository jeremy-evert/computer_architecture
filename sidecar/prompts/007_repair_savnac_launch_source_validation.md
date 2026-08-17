# Sidecar Prompt 007 - Repair Architecture Savnac launch-source validation

**Status:** READY  
**Owner:** Foreman / validation worker  
**Priority:** BLOCKS Prompt 006  
**Target branch:** `savnac/architecture-launch-readiness`

## Mission

Turn the real Brandy launch-source validation from RED into an honest GREEN or explicitly bounded YELLOW without weakening the course contract or pretending Brandy has tools it does not have.

This is a validation-contract repair, not a machine-configuration campaign.

## Evidence that opened this prompt

Real Brandy receipt:

`sidecar/runs/architecture_savnac_source_validation_20260817T011634Z.md`

Observed facts:

- branch tip under test: `3221af8d4d76a84e92fb5560d94f8b834353263e`;
- host: Brandy;
- Python: 3.9.21;
- all newly authored launch-source files exist;
- no launch-week template placeholders remain;
- the Week 2 portable Python machine probe executes;
- validation stops because `./lab/bin/archlab doctor` exits 1.

## Important contract distinction

`archlab doctor` is a capability diagnostic for the *full* laboratory. It currently requires, among other things, Python 3.10+, plotting, RISC-V cross-compile capability, PDF build capability, OpenMP, and other laboratory prerequisites.

Week 3 does **not** say every machine must make the full doctor PASS. The student source explicitly says:

> If your platform cannot execute the wrapper, use the course-provided fallback receipt and identify it as fallback evidence.

Therefore the Savnac launch-source validator must not silently redefine "source ready" to mean "this particular Brandy host satisfies the entire semester laboratory stack."

## Required work

1. Reproduce and capture `./lab/bin/archlab doctor` on Brandy without discarding stdout/stderr or the JSON payload merely because the command exits 1.
2. Identify the exact `missing_required` checks on Brandy.
3. Keep `archlab doctor` itself strict. Do **not** change the laboratory's PASS definition merely to make this launch validator green.
4. Repair `scripts/validate_savnac_launch_source.py` so it distinguishes:
   - launch-source contract checks that must be GREEN;
   - full-laboratory capability diagnostics that may be YELLOW on the named host when the documented fallback path exists;
   - actual failures of the required launch path that remain RED.
5. The validator should retain the doctor output in the receipt even when doctor returns 1.
6. Prove the Week 3 required/fallback contract materially:
   - run `archprobe` twice if it works on Brandy and retain receipt heads;
   - verify the fallback evidence/source named by Week 3 exists and is student-usable when full doctor capability is unavailable;
   - do not install packages, elevate privileges, or mutate Brandy merely to turn diagnostic YELLOWs green.
7. Re-run:

```bash
python3 scripts/validate_savnac_launch_source.py
```

8. Run `git diff --check` and any targeted Python syntax/tests appropriate to the changed validator.
9. Retain the new real Brandy receipt under `sidecar/runs/`.
10. Update the Prompt 006/readiness report only with observed results.

## Acceptance

Accept when:

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
