# Question 001 — Does Computer Architecture keep zyBooks?

**Status:** RESOLVED  
**Resolved answer:** **Yes — Computer Architecture stays with zyBooks.**  
**Resolved from:** Jeremy's prior Computer Architecture course-development conversation (2026-08-10): "MIPS is not important; 7e might be," followed by an explicit preference to **stay with zyBooks** while looking beyond the old MIPS product.

## What this resolves

Computer Architecture is intentionally different from CS1, CS2, and DSCT on this point. Those courses later moved away from required zyBooks use, but Architecture retains zyBooks as part of its course-resource strategy.

The old question should therefore no longer block course design on a binary "keep or drop zyBooks" decision.

## What this does **not** resolve

Keeping zyBooks does not mean the currently recorded MIPS 6e product is automatically the final pedagogical choice.

Jeremy's subsequent Architecture planning established two important constraints:

- **MIPS itself is not important.** Do not preserve it merely because the existing operational Fall 2026 course points to a MIPS 6e zyBook.
- Jeremy wants to **stay with zyBooks** and explored newer ARM and RISC-V options, with a RISC-V-oriented Patterson/Hennessy path emerging as the leading direction.

Two narrower decisions remain and are tracked separately:

1. **Which zyBooks ISA/product/edition should Fall 2026 use?** See `002_zybooks_isa_product_and_course_role.md`.
2. **How should zyBooks count in the grading contract?** Required reading/practice, graded participation, bonus/support layer, etc. This belongs with the broader assessment decision rather than reopening the keep/drop question.

## Repository rule until the product changes

`course_metadata.yaml` currently records the operational Fall 2026 MIPS 6e zyBook and URL. That remains factual metadata until an actual replacement course is adopted/configured.

Planning documents may correctly state that the curriculum is moving toward a modern ISA/RISC-V direction, but no agent should silently rewrite the operational zyBook identifier or vendor configuration without evidence that the replacement exists and has been adopted.

## Consequence for Foreman

Work may proceed on:

- the 17-week curriculum spine;
- Weeks 1–4;
- the reproducible lab platform;
- architecture labs and activities that are not tightly coupled to a specific zyBook deep link;
- RISC-V toolchain/simulator prototyping;
- grading-model options that leave the exact zyBooks weighting parameterized.

Do not let this old binary question stall curriculum construction again.
