# 009 d03 - Foreman acceptance

**Verdict:** ACCEPTED / PROMOTED
**Initiative:** 009
**Reviewed branch:** `golem/009-d03-current-main-compiler`
**Promoted worker HEAD:** `84db23558a085c6e5faf4373b636a3fa78603ec3`
**Validated Architecture source SHA:** `b0ae4211715e067c64895f59b2f36c0715f7aa75`

## Acceptance basis

Foreman independently reviewed the pushed d03 package against then-current `main`. The branch was a clean fast-forward: two commits ahead, zero behind, with changes limited to the required d03 report and two bounded run receipts under `sidecar/`.

The exact current-main Architecture source was built and validated on Brandy against recorded shared-source checkouts. Course Foundry was dirty before the run, but the worker preserved that state, did not update or patch it, and used explicit source roots so the consumed SHAs and caveat were visible in the evidence.

The required source/compiler gate is GREEN:

- Architecture source validator: GREEN WITH NAMED HOST-CAPABILITY YELLOWS;
- full-semester compiler: PASS;
- Architecture Course Foundry tests: 8 passed;
- Course Foundry deployment tests: 8 passed;
- historical `SourcePaths.defaults()` / `ARCHITECTURE_SOURCE_ROOT` concern: retested and passed;
- Architecture `git diff --check`: PASS;
- no Savnac or production Canvas mutation occurred.

## Desired-state contract accepted

The current compiler produced:

- 21 modules covering Weeks 1-17;
- 229 objects: 81 pages, 32 files, 116 assignments;
- 11 assignment groups totaling 100%;
- exactly five recurring groups with `drop_lowest=1`;
- Machine Dossier checkpoints only in Weeks 6, 9, and 14;
- A6, A7, and course evaluation present;
- no graded recurring Week 16 dead-day work;
- zero undeclared omissions;
- zero unresolved `{{link:...}}` tokens.

The current count of 11 assignment groups is correct. The authoritative `docs/grading-model.md` defines exactly 11 weighted categories totaling 100%, and the recorded Course Foundry compiler defines those same 11 categories. Prompt 006's historical 12-group count is therefore historical evidence, not a current acceptance target.

## Named yellows

Brandy's `archlab doctor` still lacks some full laboratory capabilities, including Python 3.10+, debugger inspection, plotting, RISC-V cross-compilation, and PDF-build capability. The committed Week 3 fallback path passed its source contract, so these remain platform-capability yellows rather than d03 source/compiler blockers.

Course Foundry was pre-existing dirty at the recorded SHA. That dirt was preserved and not modified. No shared defect was reproduced by the required tests.

## Promotion

`main` was fast-forwarded to `84db23558a085c6e5faf4373b636a3fa78603ec3` without force.

No JTT mutation, Savnac write, production Canvas access/write, shared-repository edit, package installation, or environment-wide reconfiguration was performed as part of Foreman acceptance.

## Next gate

d04 may now be released for a read-only Savnac course-8 inventory and guarded dry-run. d04 must return exactly one of `ZERO_OR_EQUIVALENT`, `EXPECTED_MATERIAL_DELTA`, or `UNEXPLAINED_DELTA`; it may not perform a live Savnac reconcile.
