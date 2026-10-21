# Make the Memory Hierarchy Hurt

A single original, two-speaker script for Jeremy’s private instructor listening library. It prepares the instructor for the October 21, 2026 Week 10 memory sensory lab. Dana and Maria are the speakers; the script uses the established renderer voices af_sarah and af_heart.

## Sources and credit

The narration follows the course’s Week 10 plan, Monday, Wednesday, Friday, instructor notes, and references, along with the `lab/README.md` and `lab/MEASUREMENT.md` descriptions of the memory experiment and measurement limits. Background references named in the course materials are MIT OpenCourseWare 6.004, Berkeley CS61C cache notes, and Cornell CS3410. The lab itself is the source for the course’s pointer chase and stream comparison. The script is original explanatory narration and does not reproduce passages from those sources.

## Contents

- `scripts/01_make_the_memory_hierarchy_hurt.md` — source script
- `manifest.json` — source hash, speaker map, word count, and estimated duration
- `production/render_on_maisie.sh` — single episode render and private library handoff for Flo

The script and manifest are versioned text. Do not add rendered audio, staging copies, runtime receipts, or Audiobookshelf content to Git.

## How Flo renders it

On Maisie, use the existing Audio Foundry checkout and Kokoro environment. Verify their paths, then from this directory run:

```bash
export AUDIO_FOUNDRY_CHECKOUT=/verified/existing/audio_foundry/checkout
export KOKORO_PYTHON=/verified/existing/kokoro-venv/bin/python
bash production/render_on_maisie.sh render 01
```

Inspect and spot-listen to the rendered file. Before using `publish 01`, independently verify that the live Audiobookshelf mount is the private instructor library, then set `PRIVATE_AUDIOBOOKSHELF_MOUNT_VERIFIED=YES`. The script refuses publication without that explicit check and refuses to overwrite a different existing file. Library refresh and device playback checks remain separate. Generated files and receipts stay under the configured Audio Foundry runtime, outside this repository.

## Factual claims for Flo to check

- The script describes the lab’s pointer chase as a dependent-access latency probe and its contiguous stream as a bandwidth probe; these are the experiment’s intended interpretations, with machine effects still possible.
- It says cache lines bring neighboring data together and that temporal and spatial locality can make such transfers useful; verify wording against the course’s preferred level of detail.
- It presents AMAT as hit time plus miss rate times miss penalty, using illustrative values of one, one tenth, and five. The example is conceptual and is not a lab measurement.
