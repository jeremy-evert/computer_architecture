# The GPU Showdown

A short, standalone student handout: an evidence dossier from a small local-GPU
benchmark fleet. It asks students to decide what the benchmark evidence
actually supports rather than accept a headline "which GPU wins" ranking at
face value.

Delivered as its own dedicated Canvas module ("The GPU Showdown") rather than
folded into a week module, so it stays easy to find and easy to extend later
if companion material is added.

The instructor-only answer key for this handout lives at
`instructor/gpu_showdown_key.pdf` in this same repository, and is
deliberately never uploaded to Canvas or any student-facing surface.

Machine labels in the table (Machine A-H) are anonymized fleet host names —
the source data used real host names, relabeled before publication so the
student-facing copy doesn't expose them. The key was relabeled to match.

## Provenance

- Source repository: `jeremy-evert/local_ai_lab_setup`
- Source branch: `anna/gpu-showdown-latex-027`
- Source commit: `7feb3b1b8725b41a659aaa69d46221377b97a852`
- Built from: `curriculum/gpu_showdown/main.tex` (machine labels relabeled to
  Machine A-H before build; see note above)
- Built on: April, 2026-09-02, via `latexmk` (pdflatex backend)
- SHA-256 (v3, relabeled + CPU column added): `2566f8035d4310f2ffd52c9d8aa1ae1368ac406e5370e95fae473fa27ceaddb4`
- Live Canvas placement: course 75249 (COMSC-3013-1438), module "The GPU Showdown"
