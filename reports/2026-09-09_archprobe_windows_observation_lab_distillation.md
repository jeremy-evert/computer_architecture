# Week 4 archprobe / Windows observation-lab distillation — Sept. 9, 2026

Prepared 2026-09-09 by Flo from material Jeremy pushed to
`computing_commons/computer_architecture/` from the Morgan workstation
(`SWOSU-62673`) during the Week 4 window.

## Evidence and scope

All primary evidence is in the **public** `computing_commons` repo under
`computer_architecture/` (pushed 2026-09-09, commits `c525903`..`1090799`):

- `jeremy_notes_from_chat_1_and_2.md` — ~181 KB raw transcript covering four
  assistants in sequence: GPT 5.6 Think ("chat 1"), Claude Sonnet ("chat 2"
  review), an OpenAI Codex CLI session, and a Copilot handoff-notes closer.
  It is chat exhaust, not classroom dialogue.
- `morgan_windows_desktop_observations.txt` — the student prediction file
  (free text).
- `visible_archprobe_handoff.ps1` / `visible_archprobe_handoff_revised.ps1`
  — the observation-and-git-handoff runner, original and revised.
- `tools/archprobe.ps1` + `Install-ArchProbe.ps1` — a **newly built,
  course-owned `archprobe` command** and a per-user PATH installer.
- `archprobe_handoff_SWOSU-62673_2026*.txt` (4) and
  `archprobe_original_vs_revised_valid_comparison_20260909_120203.txt` —
  generated evidence receipts.

Not copied into this repo: the raw transcript, the prediction file, and the
receipts. The Windows host is referred to by the nickname "Morgan" that
Jeremy already committed publicly; no other identifying detail is carried.

## What this was

The concrete **Windows implementation** of the Week 4 required surface. The
Week 4 package (`weeks/week-04/`) says *"Use the validated `archprobe`
surface first"* and the machine-dossier doctrine
(`planning/machine-dossier.md`, Prompt 003) specifies a course-owned probe
that reports OS / CPU topology / memory / uptime with **no administrator
privilege on the required path**. Before today `archprobe` was "an interface
to evaluate, not yet a promise." It now exists for Windows:

- `tools/archprobe.ps1` emits `ComputerName, OperatingSystem,
  OSArchitecture, InstalledRAMGiB, FreeRAMGiB, UsedRAMGiB, CPUModels,
  PhysicalPackages, PhysicalCores, LogicalProcessors, LastBootTime,
  UptimeHours` via `Get-CimInstance` (Win32_OperatingSystem /
  Win32_ComputerSystem / Win32_Processor).
- `Install-ArchProbe.ps1` appends the repo `tools/` dir to the **user**
  PATH only — no admin, no machine-wide change, no download.
- Codex correctly refused to install the unrelated public "ArchProbe"
  (an Android GPU profiler) and instead wrote a transparent local command.

The revised handoff runner adds a "Section 0" that reads the prediction file
into the receipt, adds an explicit physical-core vs. logical-processor
interpretation note, and tightens the git exit-code handling.

## Teaching results worth keeping

- **"Right number, wrong noun."** The prediction said "~12 cores." The host
  has an i7-8700K: **6 physical cores, 12 logical processors.** The
  predictor held a true number and attached it to the wrong concept — the
  cleanest possible hook for the physical/logical distinction, and the
  revised runner now prints that note next to the data every run.
- **"No result is not proof of absence."** A `Zone.Identifier` check
  appeared to show the marker gone, then present — the earlier look had
  suppressed its own error and queried the wrong place. Good evidence-first
  beat: absence of a finding can mean you looked wrong.
- **A parser error silently voided a whole setup block.** An early PATH
  script hit a parse error, so *none* of its `$ToolDirectory` /
  `$ArchProbeScript` assignments ever entered scope; later lines ran with
  blank variables and it "said already installed but wasn't recognized."
  One broken line, not one broken statement.
- **Evidence-first, versioned workflow.** The run record shows the tool
  beginning *absent*, the Windows-native fallback preserving the lesson
  anyway, the course surface then implemented, and a final run
  independently confirming the surface agrees with the fallback. That
  arc — not "the script worked" — is the product.

## Prediction scorecard (for the debrief)

| Claim | Predicted | Actual | Result |
|---|---|---|---|
| Installed RAM | 32 GB | 31.95 GiB | correct |
| RAM in use | ~3 GB | ~13.3 GiB (~42%) | far off |
| CPU cores | ~12 | 6 physical / 12 logical | right number, wrong concept |
| Busiest process | Chrome/Edge/Teams | msedge (4.53 CPU-s in a 3-s sample); Teams also present | correct |
| Uptime | ~1 week | ~25 hours | off by ~6 days |

The two big misses (memory headroom, uptime) are themselves the lesson:
intuition about *steady-state* machine state is unreliable; you measure it.

## Known debt (from the transcript's own review passes)

1. **Git output is not saved to the receipt.** The commit/push terminal
   output only scrolls by; a student whose push fails keeps no record of
   why. Recommended fix: append a `*_git_log.txt` **sidecar** (not the
   committed report, so a successful commit stays clean).
2. **`$PSScriptRoot` is empty when the script is dot-sourced** rather than
   run with `pwsh -File`. The guard handles it; it needs a one-line comment
   so students don't delete the guard as mysterious.
3. **Prediction file is free text.** Restructure
   `morgan_windows_desktop_observations.txt` into key/value pairs if
   auto-scoring is ever wanted.
4. **`archprobe`-missing message is too neutral.** Make it "ACTION
   REQUIRED: install archprobe per the setup guide before resubmitting."
5. **Stray 0-byte `morgan_windows_desktop_observations.txt` at the
   `computing_commons` repo root** (from Notepad opening at the wrong cwd),
   committed in `57748ba`. The intended copy is
   `computer_architecture/morgan_windows_desktop_observations.txt`. Safe to
   delete the root one — left for the owner since Jeremy is actively
   pushing to that repo from Morgan.
6. **The 181 KB four-assistant transcript sits in a public repo.** It is
   fine as a raw teaching relic, but decide whether it belongs there as-is
   or trimmed — students pointed at `fun_with_LaTeX/`-style polished
   examples may stumble into it.

## Cross-repo note

Canonical Week 4 Windows material is currently split: Jeremy pushed the
scripts and receipts to **`computing_commons/computer_architecture/`** (the
repo Morgan has checked out), while the durable course spine lives here in
**`computer_architecture/`**. Recommend deciding which is home for
`tools/archprobe.ps1` + `Install-ArchProbe.ps1` and, if it is this repo,
lifting the validated command into `weeks/week-04/` or a `tools/` dir with
a note in `planning/machine-dossier.md` that Prompt 003's probe now has a
working Windows path.

## Student product

`lecture-recaps/2026-09-09-week4-observation-lab-predict-then-probe.md` —
the concise, de-identified "predict, then probe" recap.
