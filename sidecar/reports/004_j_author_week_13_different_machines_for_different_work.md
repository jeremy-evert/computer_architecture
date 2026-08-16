# Sidecar Report 004_j - Week 13: Different Machines for Different Work

**Status:** IMPLEMENTED WITH NAMED YELLOWS

Week 13 is implemented around **workload fit, vectorization evidence, data movement, and specialization cost**, not CUDA syntax.

## Decisions closed

- persistent workload language comes from Week 12;
- required problem size is 4,000,000 items, matching Prompt 003 smoke;
- students inspect timing + compiler vectorization remarks + bounded disassembly evidence;
- precision formats are a design-dimension taste, not a numeric-format unit;
- GPU hierarchy/programming remains optional;
- slower vectorized results are explicitly valid evidence.

Current LLVM vectorizer documentation was reverified. Both deck variants compile.

**Disposition: 004_j IMPLEMENTED WITH NAMED YELLOWS; 004_k unblocked.**