# Computer Architecture laboratory platform support

**Status:** 2026-08-16 after Prompt 004_m partial physical-platform validation

A support claim means the course has **executed evidence**, not that documentation says the path ought to work.

| Surface | Status | What is proven | What remains |
|---|---|---|---|
| Linux Experimental Chamber | **GREEN** | doctor, RV32I, dependency, memory, OpenMP scaling, communication, vectorization, matplotlib plots, Week 11 unprivileged observations, multi-figure Dossier PDF | different Linux distributions may still have installation friction |
| Linux/container-visible Observatory | **GREEN WITH SCOPE LABEL** | `archprobe` reports container-visible evidence and warns against physical-host promotion | physical-host truth requires running Observatory outside a container |
| Fallback evidence | **GREEN** | dependency, RISC-V, memory, Week 11 mapping trace, scaling, communication, vector plotting/reasoning paths | fallback is course-provided evidence, not student's local measurement |
| Windows + WSL2 | **YELLOW / WAITING FOR REAL MACHINE** | intended command grammar and WSL scope detection exist | execute on a real Bill; record setup/admin friction; validate plots/PDF |
| macOS native | **YELLOW / WAITING FOR REAL MAC** | `archprobe` has a bounded non-Linux path; CPU-only curriculum has fallbacks | native compiler/OpenMP/RISC-V/plot/PDF path must be executed; do not assume GNU `gcc` semantics on macOS |
| macOS via container | **YELLOW** | architecture permits Experimental Chamber separation | requires a real runtime/image build and mounted-workflow test |
| Docker/Podman Containerfile | **YELLOW** | Containerfile exists | no Docker/Podman runtime was available on the validation surface; image build, image size and mount behavior unproven |
| MPI / GPU / QEMU / premium AI | **OPTIONAL** | not required for grading ceiling | enrichment only; any published example needs its own scoped evidence |

## Student-release rule

Until a real Windows/WSL2 run passes, do **not** advertise WSL2 as fully GREEN. Until a real Mac run passes, do **not** advertise native macOS as fully GREEN.

The course remains authorable and dogfoodable because Linux + equal-ceiling fallback paths are real. Production student support claims must match this matrix.
