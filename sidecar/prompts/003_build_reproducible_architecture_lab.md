# Sidecar Prompt 003 — Build the reproducible Computer Architecture lab platform

**Status:** OPEN  
**Owner:** Foreman  
**Mode:** inspect → prototype → smoke-test → document → recommend

## Mission

Build and validate the semester's reproducible lab capsule so Computer Architecture labs are runnable rather than aspirational.

Week 3 teaches Containers & Repeatability. This prompt must give that week a real environment and give Weeks 4–16 a stable technical foundation.

The environment should make a clean machine capable of compiling, running, inspecting, debugging, disassembling, timing, and eventually executing the chosen ISA experiments with minimal setup drift.

## Read first

- `AGENTS.md`
- `sidecar/PLANNING.md`
- `planning/fall-2026-course-design.md`
- `planning/fall-2026-spine.md`
- current Week 2–4 planning after Prompt 001 lands
- `sidecar/questions/002_zybooks_isa_product_and_course_role.md`

Inspect sibling/shared infrastructure before inventing a new pattern. Jeremy has previously discussed WSL2, remote Podman + SSH/VPN, Raspberry Pis, older desktops/laptops, and containerized course tooling. Reuse any proven shared container/runtime conventions where they fit.

Also use current external evidence where useful: Cornell CS3410 Spring 2026 runs its coursework through a Docker container, demonstrating that a containerized architecture lab can be a first-class course infrastructure rather than an incidental setup trick.

## Design constraints

1. **CPU-only completion path is mandatory.**
2. GPU support is an optional extension, not a prerequisite.
3. The canonical environment should be describable with a portable `Containerfile`/Dockerfile-compatible build where feasible and should be tested with the runtime(s) Jeremy actually supports.
4. Prefer open-source tools students can legally install/use.
5. Do not require students to understand the full Linux CLI before Week 4. Week 3 can use guided commands while teaching the repeatability concept.
6. Do not bake credentials, private network assumptions, or professor-only secrets into the image.
7. A remote fallback may be recommended, but it must not silently become a single point of failure for the course.

## Tool capability targets

Research and choose the smallest coherent set that supports the accepted spine. Candidate capabilities:

### Baseline systems tools

- GCC/Clang or another suitable C compiler;
- `make` or similarly simple build tooling;
- GNU/binutils or equivalent (`objdump`, `readelf`, `nm`, etc.);
- `gdb` or equivalent debugger;
- `file`, `xxd`/`od`, `/proc` inspection tools;
- `time`/profiling and basic system-inspection tools;
- Git where needed.

### ISA path

If RISC-V remains the planning-leading choice, prototype a practical student path using a suitable combination of:

- RISC-V GNU toolchain/cross-compiler;
- QEMU user/system emulation where pedagogically useful;
- Spike, Venus, RARS, Cornell's interpreter, or another well-supported simulator/emulator;
- primary RISC-V documentation/reference card.

Do not install five redundant simulators simply because they exist. Choose by pedagogical need and maintenance cost.

### Optional modern-workload path

Identify how Week 13/16 can run a small parallel/ML workload on CPU everywhere, with optional GPU acceleration where supported. Avoid huge model downloads or hardware-specific assumptions.

## Required prototype

Create a small course-owned smoke test that proves the environment can do the things later labs require.

A good smoke test should demonstrate, at minimum:

1. report host/container architecture and tool versions;
2. compile a tiny program;
3. run it;
4. inspect the produced binary;
5. disassemble relevant code;
6. debug or inspect state at a breakpoint/step;
7. record a simple timing/measurement;
8. if RISC-V tooling is selected, compile/run/step or otherwise execute a small RISC-V example;
9. emit a machine-readable or clearly reviewable PASS/FAIL receipt.

Keep it tiny. This is a health check, not a lab assignment.

## Cross-platform validation

Test as much as the available machines allow, prioritizing the environments students are likely to have:

- Windows + WSL2;
- native Linux;
- macOS where feasible;
- container runtime compatibility (Podman/Docker as appropriate).

If a platform cannot be tested, say so explicitly.

Use Jeremy's available hardware for validation where appropriate, but do not turn his specific machines into student requirements.

## Remote fallback research

Evaluate whether a managed remote Linux/container fallback would materially reduce student failure. Jeremy has previously discussed shared Podman + SSH/VPN infrastructure.

Return a recommendation, not an uncontrolled deployment, unless a clearly existing course-safe infrastructure path already owns this capability.

The report should distinguish:

- canonical local path;
- optional remote fallback;
- professor/development-only infrastructure.

## Student-facing Week 3/4 implications

Return enough validated information for Prompt 001/004 to author:

- Week 3 container setup/reproducibility exercise;
- Week 4 Linux commands that definitely exist in the supported environment;
- troubleshooting/error signatures;
- a one-command or very small smoke-test path students can use to verify their lab is healthy.

## Explicit non-goals

- no production Canvas writes;
- no mandatory GPU stack;
- no giant devcontainer platform;
- no cloud vendor dependency without a strong reason;
- no course grading decisions;
- no zyBooks adoption change;
- no requirement that students use Jeremy's private network.

## Required report

Write:

`sidecar/reports/003_build_reproducible_architecture_lab.md`

Include:

- alternatives considered;
- selected tool/runtime stack and why;
- files created/modified;
- image/container size if relevant;
- smoke-test commands/results;
- platforms actually tested;
- known failure modes;
- remote fallback recommendation;
- Week 3/4 authoring implications;
- unresolved YELLOWs;
- worker commit SHA(s).

## Foreman acceptance

Foreman independently runs the smoke test from the documented path and verifies:

1. the lab environment builds/starts reproducibly;
2. the smoke test is meaningful and small;
3. CPU-only completion is real;
4. no secrets/private assumptions are embedded;
5. later week authors can depend on the environment without each inventing their own toolchain.

## Done when

The repository contains a tested, reproducible architecture lab foundation and evidence showing that a fresh supported environment can perform the core inspect/build/measure operations needed by the semester.
