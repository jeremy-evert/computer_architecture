# Computer Architecture Savnac source validation receipt

- UTC: 20260817T013525Z
- status: **RED**
- commit: `3221af8d4d76a84e92fb5560d94f8b834353263e`
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
- GREEN — no template placeholders remain in newly authored week Markdown
- GREEN — Week 2 portable Python machine probe executed

## Failure

`Command '['/mnt/brandy_nvme/jevert/git/computer_architecture_savnac/lab/bin/archlab', 'doctor']' returned non-zero exit status 1.`

## Week 2 portable probe

```text
python=3.9.21; system=Linux; machine=x86_64; logical_cpus=96
```

## archlab doctor

```text
not completed
```

## repeated archprobe receipt heads

```text
not completed
```

## Interpretation boundary

This receipt validates the newly authored Architecture launch source and the
required repository-local laboratory path on the named host. It does not prove
optional container, GPU, WSL, macOS, or instructor-showcase lanes.

Week 2 and Week 3 Monday deck sources are validated separately by exact-source
LaTeX builds; generated PDFs are reproducible build products rather than required
Git source.

## Command

```text
python3 scripts/validate_savnac_launch_source.py
```
