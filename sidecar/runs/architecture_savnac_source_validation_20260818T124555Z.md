# Computer Architecture Savnac source validation receipt

- UTC: 20260818T124555Z
- status: **GREEN WITH YELLOWS**
- commit: `b0ae4211715e067c64895f59b2f36c0715f7aa75`
- host: `brandy`
- Python: `3.9.21`
- platform: `Linux-5.14.0-570.58.1.el9_6.x86_64-x86_64-with-glibc2.34`

## Contract checks

- GREEN — source exists: `weeks/week-02/README.md`
- GREEN — source exists: `weeks/week-02/monday.md`
- GREEN — source exists: `weeks/week-02/monday.tex`
- GREEN — source exists: `weeks/week-02/wednesday.md`
- GREEN — source exists: `weeks/week-02/friday.md`
- GREEN — source exists: `weeks/week-03/README.md`
- GREEN — source exists: `weeks/week-03/monday.md`
- GREEN — source exists: `weeks/week-03/monday.tex`
- GREEN — source exists: `weeks/week-03/wednesday.md`
- GREEN — source exists: `weeks/week-03/friday.md`
- GREEN — source exists: `weeks/week-04/README.md`
- GREEN — source exists: `weeks/week-04/wednesday.md`
- GREEN — source exists: `weeks/week-04/friday.md`
- GREEN — source exists: `weeks/week-15/README.md`
- GREEN — source exists: `weeks/week-17/README.md`
- GREEN — source exists: `assignments/A6-professional-pathway-artifacts.md`
- GREEN — source exists: `assignments/A7-final-reflection.md`
- GREEN — source exists: `docs/course-evaluation.md`
- GREEN — source exists: `lab/fallback_data/week05-machine-reference.txt`
- GREEN — source exists: `lab/fallback_data/week05-machine-reference.json`
- GREEN — no template placeholders remain in newly authored week Markdown
- GREEN — Week 3 names the committed course fallback receipt explicitly
- GREEN — Week 2 portable Python machine probe executed
- GREEN — repeated `archprobe` runs produced non-empty machine receipts
- GREEN — Week 3 fallback receipt exists for hosts where wrappers cannot run
- GREEN — `git diff --check` exits 0

## Named YELLOWs

- YELLOW — full `archlab doctor` capability check is not PASS on this host; missing_required=['python_3_10_plus', 'debugger_state_inspection', 'plotting', 'riscv_cross_compile', 'pdf_build']. This is diagnostic, not by itself a launch-source failure because Week 3 provides a named fallback path.

## Week 2 portable probe

```text
python=3.9.21; system=Linux; machine=x86_64; logical_cpus=96
```

## archlab doctor

```text
{
  "matplotlib_error": "No module named 'matplotlib'",
  "missing_required": [
    "python_3_10_plus",
    "debugger_state_inspection",
    "plotting",
    "riscv_cross_compile",
    "pdf_build"
  ],
  "next_step": "Use the supported course Experimental Chamber or fallback evidence path. Do not improvise administrator/root changes unless explicit course instructions authorize them.",
  "openmp_probe": {
    "note": "96",
    "pass": true
  },
  "optional": {
    "container_runtime": true,
    "gdb": false,
    "lldb": false,
    "mpi": false,
    "qemu_riscv": false,
    "tectonic": false
  },
  "platform": "Linux-5.14.0-570.58.1.el9_6.x86_64-x86_64-with-glibc2.34",
  "python": "3.9.21",
  "required_checks": {
    "binary_inspection": true,
    "debugger_state_inspection": false,
    "native_c_compiler": true,
    "openmp": true,
    "pdf_build": false,
    "plotting": false,
    "python_3_10_plus": false,
    "riscv_cross_compile": false
  },
  "schema": "swosu.archlab.doctor/v1",
  "status": "FAIL",
  "timestamp_utc": "2026-08-18T12:45:55.742646+00:00",
  "tools": {
    "clang": null,
    "docker": null,
    "file": "/usr/bin/file",
    "gcc": "/usr/bin/gcc",
    "gdb": null,
    "latexmk": null,
    "lldb": null,
    "llvm-objdump": null,
    "make": "/usr/bin/make",
    "mpicc": null,
    "objdump": "/usr/bin/objdump",
    "pdflatex": "/usr/local/texlive/2025/bin/x86_64-linux/pdflatex",
    "podman": "/usr/bin/podman",
    "qemu-riscv32": null,
    "qemu-riscv64": null,
    "readelf": "/usr/bin/readelf",
    "tectonic": null
  },
  "versions": {
    "clang": null,
    "gcc": "gcc (GCC) 11.5.0 20240719 (Red Hat 11.5.0-5)",
    "matplotlib": null
  }
}
```

## repeated archprobe receipt heads

```text
RUN A:
SWOSU Architecture Observatory
Scope: host-visible
OS: Rocky Linux 9.6 (Blue Onyx)
Architecture: x86_64
CPU: Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz
Logical processors: 96
Visible memory: 375.9 GiB
Cache records: 4
Accelerator visible: False

RUN B:
SWOSU Architecture Observatory
Scope: host-visible
OS: Rocky Linux 9.6 (Blue Onyx)
Architecture: x86_64
CPU: Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz
Logical processors: 96
Visible memory: 375.9 GiB
Cache records: 4
Accelerator visible: False
```

## Interpretation boundary

This receipt validates the newly authored Architecture launch source and the
required/fallback Week 3 laboratory path on the named host. A full doctor FAIL
is retained as a platform capability YELLOW when the source/fallback contract
is still usable; it is not silently rewritten as PASS.

It does not prove optional container, GPU, WSL, macOS, or instructor-showcase
lanes. Week 2 and Week 3 Monday deck sources are validated separately by
exact-source LaTeX builds; generated PDFs are reproducible build products rather
than required Git source.

## Command

```text
python3 scripts/validate_savnac_launch_source.py
```
