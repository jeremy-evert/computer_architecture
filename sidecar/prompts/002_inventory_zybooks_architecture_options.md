# Sidecar Prompt 002 — Inventory current zyBooks Architecture options

**Status:** OPEN  
**Owner:** Foreman  
**Mode:** authorized reconnaissance → evidence table → recommendation → no vendor mutation

## Mission

Give Jeremy the current evidence needed to resolve `sidecar/questions/002_zybooks_isa_product_and_course_role.md` without guessing from old screenshots, memory, or product names.

This prompt is **read/research only** with respect to zyBooks. Do not adopt, replace, configure, or publish a vendor course.

## Read first

- `course_metadata.yaml`
- `planning/fall-2026-spine.md`
- `planning/fall-2026-course-design.md`
- `sidecar/PLANNING.md`
- `sidecar/questions/001_zybooks_decision_for_architecture.md`
- `sidecar/questions/002_zybooks_isa_product_and_course_role.md`
- `planning/zybooks-section-decisions.csv` for the current MIPS product's known content provenance

Also inspect any relevant current four-course zyBooks readiness reports/workflows already present in Jeremy's task-tracking/shared repositories. Reuse the established authenticated reconnaissance method rather than building another browser-hacking path.

## Known planning history

Do not treat these as vendor facts, but preserve them as decision context:

- Jeremy wants Architecture to stay with zyBooks.
- Jeremy said MIPS itself is not important and newer editions may matter.
- An ARM-with-zyLabs Patterson/Hennessy option was previously observed.
- RISC-V became the leading pedagogical direction under discussion.
- The accepted Week 5–14 spine is curriculum-first and aligns strongly with RISC-V-based current teaching elsewhere.

## Required reconnaissance

Using only authorized access, determine which relevant Computer Organization / Computer Architecture zyBooks products are actually available to Jeremy now.

At minimum attempt to verify any available:

- Patterson/Hennessy RISC-V product;
- Patterson/Hennessy ARM product;
- current MIPS 6e product.

For each verified option capture:

- exact product title;
- edition/version/release information visible to Jeremy;
- ISA;
- whether zyLabs are included and what kind of simulator/lab capability is visible;
- high-level chapter/topic coverage;
- whether the option appears adoptable for Fall 2026;
- whether Jeremy already owns/has access to it;
- any visible student cost/access information that can be verified legitimately;
- what would need to change from the currently operational `SWOSUCOMSC3013EvertFall2026` course;
- likely fit against Weeks 5–14 of the accepted spine.

If a field cannot be verified, mark it UNKNOWN. Do not interpolate.

## Comparison lens

The best option is not merely the newest edition number. Compare pedagogical fit for the accepted course:

- representation/arithmetic;
- modern ISA/assembly;
- datapath/control;
- pipelining;
- caches/memory hierarchy;
- VM/OS support where available;
- multicore/parallelism;
- GPU/accelerator/modern-system relevance;
- quality of interactive or executable experiences;
- ease of mapping selected sections rather than forcing the semester into chapter order.

## External curriculum check

Use current/open primary course sources only as pedagogical context, especially:

- Berkeley CS61C 2026;
- Cornell CS3410 2026;
- Cambridge Introduction to Computer Architecture;
- RISC-V International specifications.

This is not a general web-survey prompt. The vendor availability evidence is the core job.

## Recommendation

Return one of:

- **Recommend RISC-V product**;
- **Recommend ARM product**;
- **Keep current MIPS product for Fall 2026**;
- **Evidence insufficient — Jeremy should not decide yet**.

State why in terms of the accepted curriculum and migration cost.

Do **not** make the adoption change yourself in this prompt.

## Required report

Write:

`sidecar/reports/002_inventory_zybooks_architecture_options.md`

Include:

- date/time of reconnaissance;
- authorized method used;
- evidence table;
- current MIPS course facts;
- verified alternatives;
- curriculum-fit comparison;
- migration considerations;
- explicit unknowns;
- recommendation;
- exact decision Jeremy still needs to make.

Do not store credentials, cookies, tokens, or screenshots containing secrets.

## Foreman acceptance

Foreman verifies that the report separates:

1. verified vendor facts;
2. Jeremy's prior preferences;
3. external pedagogical evidence;
4. the worker's recommendation.

No zyBooks write occurs.

## Done when

Jeremy can open one bounded report and make the ISA/product decision without repeating the reconnaissance himself.
