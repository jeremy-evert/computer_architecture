# Question 001 — Does Computer Architecture require zyBooks?

**Status:** RESOLVED  
**Resolved answer:** **No. Computer Architecture will be complete without zyBooks or any required commercial textbook.**  
**Resolved from:** Jeremy, directly, 2026-08-16.

## Decision

The Fall 2026 course should be authored so every required topic, lab, explanation, practice path, and assessment can be completed without purchasing zyBooks or another commercial textbook.

Jeremy's current preference is to build the strongest course possible from:

- open and freely accessible educational resources;
- primary specifications and official documentation;
- openly published university course materials where usable;
- open-source tools;
- course-created explanations, examples, labs, traces, diagrams, and assessments.

Commercial resources may still help guide the instructors/course authors. Patterson/Hennessy, historical zyBooks content, and other strong textbooks remain valuable references. They are not student dependencies.

## Related affordability decision

Jeremy also explicitly does **not** want to require students to purchase premium AI or command-line agent access at this time.

Therefore:

- no paid AI subscription is required;
- no Codex/Claude Code/premium CLI subscription is required;
- students may use a provider/interface of choice where AI is permitted;
- required AI-supported activities must have a no-cost or otherwise course-accessible path;
- premium AI/CLI tooling may be optional enrichment and may be demonstrated without affecting the required path or grading ceiling.

## Repository consequence

`course_metadata.yaml` now records the historical Fall 2026 zyBooks adoption as **reference/provenance**, not required course material.

Course authors must not introduce a commercial-paywall dependency indirectly by writing student instructions such as "read section X in zyBooks" without an equivalent complete open/course-created path.

## Consequence for Foreman

Foreman should spend research effort assembling and validating the **open-source Computer Architecture canon**, not shopping for a new zyBooks edition.

The old vendor-product-selection question is superseded. See Question 002 and Sidecar Prompt 002 for the replacement open-source curriculum work.
