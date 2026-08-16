# Computer Architecture Sidecar

Project-local workbench for Jeremy, ChatGPT, the Foreman, golems, and other
agents working **about** Computer Architecture. The repository outside
`sidecar/` is the course itself — current course content, planning,
decisions — and should describe the course without narrating the agent/human
process that produced it.

## Current shape

- `questions/` — unresolved ambiguities or decisions that need Jeremy's
  explicit resolution before dependent work can proceed honestly.
- `prompts/` (to be added as work is scoped) — project-local work orders.
- `reports/` (to be added as work lands) — results and evidence.

This repo's existing `prompts/`/`reports/` at the repository root predate
this sidecar convention (see `computer_science_2/sidecar/` for the fuller
pattern this mirrors); reconciling them into `sidecar/` is a future
cleanup, not required before using `sidecar/questions/` today.
