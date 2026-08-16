# Sidecar Report 004_m - Execute and validate student-release readiness

**Status:** IMPLEMENTED WITH PHYSICAL-MACHINE YELLOWS  
**Date:** 2026-08-16

## Verdict

The authored Weeks 5-14 required laboratory path is **GREEN on the executed Linux surface** and the complete course-owned fallback path is GREEN.

Windows/WSL2, native macOS, and the Containerfile/runtime remain **YELLOW because real execution is still required**. Those yellows are now mechanical platform tests, not unresolved curriculum design.

Durable artifacts:

- `lab/validation/2026-08-16-authored-weeks-05-14-linux.json`
- `lab/PLATFORM_SUPPORT.md`
- `lab/PLATFORM_VALIDATION_RUNBOOK.md`

## Fresh authored-core Linux execution

The execution sandbox was assembled from the current committed lab source retrieved through the GitHub connector. The final authored commands were run, not only the older Prompt 003 smoke defaults.

### Health / Observatory

`archlab doctor`: **PASS**.

`archprobe`: **PASS**, correctly labeled **container-visible** on Debian GNU/Linux 13 / x86_64 and warned that CPU/memory/storage visibility may differ from the physical host.

### Week 6 RISC-V

The final authored RV32I path passed. The persistent source-to-CPU specimen ended with:

- `x10/a0 = 18`
- `x11/a1 = 18`

### Week 8 dependency

Authored `12,000,000` update run passed:

- dependent: ~1.183 ns/update;
- independent4: ~0.306 ns/update.

The plot built successfully.

### Week 10 memory

The full authored working-set sweep passed and produced both latency and bandwidth figures.

Pointer-chase observations on this surface ranged from ~1.5 ns/access at tiny working sets to ~108 ns/access at 32 MiB. Streaming throughput changed differently, preserving the intended latency-versus-bandwidth story.

### Week 11

Unprivileged observation passed:

- `getconf PAGESIZE` -> 4096 bytes;
- short `/proc/self/maps` excerpt captured without privileged access.

### Week 12 scaling

Authored `--work 4000000` run passed. The visible surface produced:

- 1 thread: 1.00x;
- 2 threads: ~2.66x;
- 4 threads: ~5.50x.

The apparently superlinear result is preserved rather than normalized away. It is evidence that timing conditions, cache/frequency effects, CPU quotas, and baseline noise can make a simple Amdahl model diverge from a short real measurement. Students should reason about the discrepancy rather than treat Amdahl as a promise.

### Week 12 communication

At the 20 ms controlled per-message wait:

- Chatterbox: ~1.302 s;
- Freight Train: ~0.0204 s.

The intended waiting-sensitivity contrast remained strong.

### Week 13 vectorization

Authored `--items 4000000` run passed. The compiler emitted vectorization remarks (32-byte and 16-byte vectors in this execution), and on this machine the native/vectorized build was **slightly faster**:

- scalar_no_vectorize: ~0.0417 s;
- compiler_native: ~0.0379 s.

This differs from the Prompt 003 validation surface, where vectorization was reported but runtime was worse. That disagreement is a successful course result: **vectorized is not a guaranteed performance verdict; workload, compiler and machine context matter.**

### Week 14 final Dossier

The exact authored five-figure Dossier command passed with `latexmk+pdflatex`.

- PDF: 268,106 bytes;
- SHA-256: `1e8fa0f445ae1e6601171e397a2606bd63111a50072438e73a9851c378413696`;
- figures: dependency, memory, scaling, communication, vector.

This is the first validation pass that proves the **authored Week 14 evidence bundle**, not merely the generic Prompt 003 PDF scaffold.

## Fallback validation

The plotter successfully consumed the course fallback shapes for:

- dependency;
- memory latency + bandwidth;
- scaling;
- communication;
- vector.

The continuity audit also committed RISC-V and Week 11 curated fallback packets. Fallback remains an equal reasoning ceiling, not a lower-grade path.

## Platform matrix

See `lab/PLATFORM_SUPPORT.md`.

### GREEN

- Linux Experimental Chamber authored path;
- container-visible Observatory with honest scope label;
- CPU-only requirement;
- no-root sensory experiments;
- fallbacks + plotting;
- authored multi-figure Dossier PDF.

### YELLOW / WAITING FOR PHYSICAL MACHINE

- Windows/WSL2;
- native macOS;
- macOS container option;
- Docker/Podman Containerfile build/image-size/mount proof.

No Docker or Podman runtime exists on this execution surface, so image-build claims were not invented.

## What the YELLOWs block

| Yellow | Authoring | Savnac dogfood | Advertising full student support | Production readiness |
|---|---|---|---|---|
| real WSL2 execution | does not block | does not block source dogfood | **blocks WSL2 GREEN claim** | blocks final Windows support signoff |
| real macOS execution | does not block | does not block | blocks macOS GREEN claim | blocks macOS support signoff if advertised |
| Containerfile runtime build | does not block | does not block | blocks container-image GREEN claim | blocks container-image support signoff |
| final instructor machine/showcase capture | does not block | does not block | blocks final recording asset only | recording/publication task |

## Disposition

**004_m is implemented with physical-machine yellows.**

The course now has enough execution truth for helm-level Prompt 004 acceptance. The remaining tests should be run opportunistically on the available Bills/Mac using `lab/PLATFORM_VALIDATION_RUNBOOK.md`, and their receipts can promote individual platform rows without reopening curriculum authoring.
