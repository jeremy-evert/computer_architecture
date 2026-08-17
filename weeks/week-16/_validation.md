# Week 16 authoring / execution validation receipt

**Status:** YELLOW - authored; real Brandy execution receipt required before GREEN

**Validation date:** 2026-08-16  
**Authored branch:** `farkle/shared-core-architecture-brandy`  
**Validator:** Foreman + real Brandy checkout  
**Execution platform:** pending final real-host validator run

## Authoring checks

- [x] No unresolved template placeholders remain in the authored Week 16 files.
- [x] `README.md` central question matches Monday/Wednesday/Friday.
- [x] Monday digest and deck share the same prior belief, model, prediction, and scope.
- [x] AI Fluency integration uses Lens 16: Reflect and Improve.
- [x] Professional Minds references remain reflection/enrichment rather than duplicate Architecture assignments.
- [x] Machine Dossier action is explicitly `NO CHANGE` because the technical dossier froze in Week 14.
- [x] Friday requires a bounded judgment, evidence, Architecture connection, limitation, and revision rather than raw-output paste.
- [x] No Checkpoint 4 or new grading category was invented.
- [x] Canonical shared computational ownership is recorded through `_SHARED_PROVENANCE.json`.

## Execution gate

Run from repository root:

```bash
python scripts/validate_week16_farkle.py
```

The validator must produce a GREEN raw receipt under:

`sidecar/runs/week16_farkle_architecture_validation_<timestamp>.md`

Required checks:

- generated canonical package hashes match its provenance manifest;
- required execution mode is explicitly `native-python-cpu`;
- no accelerator use is claimed;
- fixed five-strategy CPU suite executes;
- raw denominators are internally consistent;
- deterministic playing outcomes repeat across timing trials;
- throughput median/min/max evidence is positive and ordered;
- JSON and CSV machine-readable evidence are emitted.

## Deck build gate

From `weeks/week-16/`:

```bash
latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=build monday.tex
```

- [ ] Deck compilation must be checked on a host with the course LaTeX toolchain before student release.
- [x] Deck source is authored as a visual storyboard rather than copied digest paragraphs.
- [x] Speaker notes are present where they materially help the recording.

A missing LaTeX toolchain is a named authoring YELLOW, not a reason to alter the required Farkle CPU path.

## Fallback

The latest retained real GREEN validator receipt may be used as instructor fallback evidence if a live classroom run is unavailable. Do not invent benchmark numbers.

The fallback preserves the same reasoning task: students compare effectiveness, preparation/operation cost, and named execution context before making the Architecture judgment.

## Remaining YELLOWs

| Yellow | Why it remains | Blocks authoring? | Blocks student release? | Owner / next proof |
|---|---|---:|---:|---|
| real Brandy execution receipt | connector cannot execute private checkout | no | yes | run `python scripts/validate_week16_farkle.py` on Brandy |
| deck compilation | LaTeX not executed in connector environment | no | yes for rendered deck | run `latexmk` on course authoring host |
| optional hardware zoo | additional lanes are enrichment and require separate verified receipts | no | no | future Stack Showcase |

## Validation judgment

**What is genuinely ready:** canonical shared package, Architecture-owned runner/CLI, student Monday/Wednesday/Friday surfaces, instructor plan, deck source, provenance and one-command validation contract.

**What should not yet be claimed:** a GREEN Brandy runtime, a compiled Week 16 PDF deck, Tesla T4 execution, GPU acceleration, power/energy results, or cross-machine performance rankings.
