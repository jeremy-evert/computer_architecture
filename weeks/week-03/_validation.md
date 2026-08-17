# Week 3 authoring / execution validation

**Status:** YELLOW - authored from already-proven Prompt 003 lab; exact Week 3 command/deck rerun still required

- [x] central question matches planning Week 3.
- [x] required path uses the already-validated repository-local lab wrappers.
- [x] container runtime is optional rather than falsely required.
- [x] no package-index, paid AI, GPU, private host, or root requirement introduced.
- [x] evidence scope distinguishes execution environment from physical host truth.
- [x] Machine Dossier explicitly does not begin this week.

Release rerun:

```bash
./lab/bin/archlab doctor
./lab/bin/archprobe --out-dir /tmp/arch-week03-a
./lab/bin/archprobe --out-dir /tmp/arch-week03-b
```

Deck gate:

```bash
cd weeks/week-03
latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=build monday.tex
```

Prompt 003's broader `make validate` is already GREEN on Linux; this receipt intentionally asks only for the Week 3-facing subset.
