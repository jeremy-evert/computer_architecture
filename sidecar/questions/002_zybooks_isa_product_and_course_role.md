# Question 002 — Which zyBooks ISA/product should Architecture use, and what course role should it have?

**Status:** OPEN  
**Owner:** Jeremy, after evidence/recommendation is assembled  
**Blocks:** final zyBook section mapping, vendor/deep-link configuration, and any grading rule tied specifically to zyBooks completion  
**Does not block:** curriculum spine, Weeks 1–4, lab-platform prototyping, RISC-V experiments, or architecture content that can stand independently of a vendor link

## Already decided

Do **not** reopen these:

- Computer Architecture keeps zyBooks as part of its course-resource strategy.
- MIPS itself is not important enough to preserve for historical continuity.
- Jeremy wants the best modern fit, not automatic loyalty to the currently recorded MIPS 6e product.

## Current operational truth

`course_metadata.yaml` currently points to the Fall 2026 operational zyBook:

- Patterson & Hennessy, *Computer Organization and Design (6e) — Interactive Version (MIPS)*
- identifier `SWOSUCOMSC3013EvertFall2026`

That is factual operational metadata until a replacement is actually adopted/configured.

## Prior course-development direction

In earlier Architecture work Jeremy said:

- "MIPS is not important; 7e might be."
- he wanted to stay with zyBooks;
- an ARM-with-zyLabs Patterson/Hennessy product was found;
- the search then moved toward RISC-V, with a RISC-V-oriented Patterson/Hennessy/zyBooks path emerging as the leading pedagogical candidate.

The new course spine also aligns strongly with current RISC-V-based teaching at Berkeley CS61C, Cornell CS3410, Cambridge, and the open RISC-V specification ecosystem.

That makes **RISC-V the planning-leading ISA**, but not yet a vendor adoption fact.

## Evidence needed before Jeremy chooses

Foreman should assemble a short, current, evidence-backed comparison of the actually available zyBooks choices Jeremy can adopt for Fall 2026. At minimum compare any available:

1. **RISC-V Patterson/Hennessy option**
2. **ARM Patterson/Hennessy option**
3. **existing MIPS 6e course**

For each, report only verified facts:

- exact title/edition/release;
- whether it is currently available to Jeremy in zyBooks;
- zyLabs/simulator capabilities;
- chapter/topic coverage;
- fit with the accepted Weeks 5–14 spine;
- migration cost from the current Fall 2026 course;
- whether existing Canvas/LTI/deep links would need to be rebuilt;
- any student-access/cost implication visible from authorized sources.

Do not infer vendor facts from memory when they can be checked.

## Decision A — ISA/product

Recommended decision shape after evidence exists:

> **Choose the zyBooks product that best supports the accepted curriculum, with RISC-V preferred when the available product is pedagogically/currently strong enough.**

The curriculum should not be distorted merely to preserve the old MIPS course.

## Decision B — zyBooks course role

Separate from product choice, Jeremy needs to decide how zyBooks participates in the learning/grading contract.

Possible roles to compare against the final grading model:

- required preparation/reference with low-stakes completion;
- selected required interactive activities only;
- optional/supporting practice;
- bonus/enrichment layer;
- another explicitly defined role.

Do not assign percentages or point values here. That belongs in the grading-contract decision.

## Done when

This question is resolved when the repo records:

1. the selected zyBooks product/ISA/edition;
2. verified operational identifier/URL after adoption;
3. whether the old MIPS course becomes historical provenance;
4. the intended zyBooks course role at a policy level;
5. a follow-up work order for section mapping/deep-link verification if needed.
