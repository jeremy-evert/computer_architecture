# Physical-platform validation runbook

Use this when a real Windows/WSL2 or Mac machine is in front of you. Do not promote a platform from YELLOW based on documentation alone.

## A. Windows / WSL2

From a current repository checkout inside WSL2:

```bash
./lab/bin/archlab doctor --out /tmp/archlab-doctor.json
./lab/bin/archprobe --out-dir /tmp/archprobe
./lab/bin/archlab run riscv --out-dir /tmp/arch-riscv
./lab/bin/archlab run dependency --updates 12000000 --out-dir /tmp/arch-dependency
./lab/bin/archlab plot dependency /tmp/arch-dependency/dependency.csv --out /tmp/arch-dependency/dependency.png
./lab/bin/archlab run memory --out-dir /tmp/arch-memory
./lab/bin/archlab plot memory /tmp/arch-memory/memory.csv --out /tmp/arch-memory/memory.png
./lab/bin/archlab run scaling --work 4000000 --out-dir /tmp/arch-scaling
./lab/bin/archlab plot scaling /tmp/arch-scaling/scaling.csv --out /tmp/arch-scaling/scaling.png
./lab/bin/archlab run communication --out-dir /tmp/arch-communication
./lab/bin/archlab plot communication /tmp/arch-communication/communication.csv --out /tmp/arch-communication/communication.png
./lab/bin/archlab run vector --items 4000000 --out-dir /tmp/arch-vector
./lab/bin/archlab plot vector /tmp/arch-vector/vector.csv --out /tmp/arch-vector/vector.png
```

Also run:

```bash
getconf PAGESIZE
head -n 8 /proc/self/maps
```

Build a Dossier with the generated figures. Record:

- Windows version + WSL distribution;
- whether WSL install/setup required administrator or institutional help;
- `archprobe` scope (`wsl-visible` expected when run directly in WSL);
- tool-install friction;
- runtimes/plot shapes;
- PDF build result;
- what Windows-host facts are **not** visible from WSL.

## B. macOS

Start natively:

```bash
./lab/bin/archlab doctor --out /tmp/archlab-doctor.json
./lab/bin/archprobe --out-dir /tmp/archprobe
```

Do not immediately install random privileged tooling to force a PASS. Record missing required checks first.

Then attempt the same authored RISC-V/dependency/memory/scaling/communication/vector/plot/Dossier path where `doctor` says the dependencies exist.

Important macOS questions:

- Does the installed `gcc` command provide GNU GCC or Apple's Clang compatibility wrapper?
- Is OpenMP available through the supported course environment?
- Are `clang` + `llvm-objdump` available for the RV32I path?
- Does matplotlib run without GUI assumptions?
- Does `latexmk+pdflatex` or Tectonic build the Dossier?
- Which host cache/memory facts are exposed by the native Observatory?

If native setup becomes fragile, test the intended container runtime rather than mutating the curriculum.

## C. Containerfile

When Docker or Podman is available:

```bash
cd lab
podman build -t swosu-archlab -f Containerfile .
# or Docker equivalent
```

Record image size, first-build time, first-run time, mounted-workflow behavior, plotting/PDF output, and Observatory scope. The Observatory should not be used inside the chamber to make claims about the physical host.

## Pass rule

GREEN requires executed evidence for the **actual authored workloads**, generated plots, and PDF build. Different numeric results are expected and welcome.
