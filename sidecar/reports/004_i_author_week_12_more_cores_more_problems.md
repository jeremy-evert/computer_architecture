# Sidecar Report 004_i - Week 12: More Cores, More Problems

**Status:** IMPLEMENTED WITH NAMED YELLOWS

Week 12 is implemented as one coherent investigation with two sensory halves: **worker scaling** and **communication/wait shape**.

## Decisions closed

- Amdahl depth: one bounded model and simple predictions;
- scaling workload: `--work 4000000`, matching Prompt 003 smoke;
- communication: preserve Chatterbox/Freight Train user-space no-root experiment;
- false sharing: conceptual/mechanism discussion, not a required live microbenchmark;
- low-core machines: equal-ceiling fallback data;
- workload language: chunky/local versus chatty/dependent survives into Week 13.

Current OpenMP primary documentation was reverified. Both deck variants compile.

**Disposition: 004_i IMPLEMENTED WITH NAMED YELLOWS; 004_j unblocked.**