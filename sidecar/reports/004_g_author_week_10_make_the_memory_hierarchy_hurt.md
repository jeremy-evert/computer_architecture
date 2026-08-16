# Sidecar Report 004_g - Week 10: Make the Memory Hierarchy Hurt

**Status:** IMPLEMENTED WITH NAMED YELLOWS

Week 10 now turns the Week 5 hierarchy ledger into a sensory experiment. The required path compares dependent pointer-chase latency with streaming bandwidth across working-set size.

## Decisions closed

- use the existing validated default sweep rather than invent another benchmark;
- teach line/hit/miss/associativity/replacement only at explanatory depth;
- require one bounded AMAT calculation as a model, not as a curve predictor;
- emphasize regions and shape rather than exact ns values/cache boundary guesses;
- storage benchmarking does not hijack this week;
- fallback uses the committed memory reference dataset.

Both deck variants compile. Prompt 003 already proves the underlying run/plot path on Linux.

**Disposition: 004_g IMPLEMENTED WITH NAMED YELLOWS; 004_h unblocked.**