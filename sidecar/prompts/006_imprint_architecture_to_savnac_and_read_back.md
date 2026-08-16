# Sidecar Prompt 006 — Imprint Computer Architecture into Savnac and read it back

**Status:** OPEN  
**Owner:** Foreman  
**Mode:** inspect → compile → imprint → read back → walk → verify

## Mission

Make the current Git-backed Computer Architecture course visible and inspectable in Savnac through Jeremy's existing Course Foundry / Imprint machinery.

This is a deployment-and-dogfood job, not a second curriculum-authoring system.

The acceptance condition is not "an API returned 200." It is:

> Jeremy can open the intended Computer Architecture course in Savnac, navigate a recognizable current course, and see what the repository actually became.

Git remains authoritative. Savnac is the human inspection surface. Production SWOSU Canvas remains out of scope.

## Read first

### Computer Architecture

- `AGENTS.md`
- `README.md`
- `course_metadata.yaml`
- `planning/fall-2026-spine.md`
- `planning/fall-2026-course-design.md`
- current week source
- current assignments/labs/rubrics that have actually landed
- `sidecar/PLANNING.md`
- `sidecar/questions/*.md`
- relevant `sidecar/reports/*.md`

### Existing deployment machinery

Inspect Course Foundry / Imprint and the most recently accepted Savnac deployment paths for sibling courses, especially CS1/CS2.

Do not assume old file names are still current. Locate the actual desired-course compiler, dry-run/diff path, imprint/write path, identity mapping, and read-back/acceptance tooling that now own this responsibility.

Reuse and generalize the existing machinery only where a real Architecture gap proves generalization necessary.

## Sequencing

This prompt may be opened early for reconnaissance, but **do not publish fake green weeks merely because the semester map names them**.

A useful first imprint may include only the source-backed near-term slice, such as:

- Course Information / landing context;
- Week 1;
- Week 2;
- Week 3;
- Week 4;
- any later weeks that are genuinely authored and validated.

As more weeks become source-ready, the same deployment path should be able to extend the rendered course without creating duplicate objects.

## Required work

### 1. Resolve the intended Savnac course identity

Before writing anything, inspect Savnac and determine:

- whether the Computer Architecture test/dogfood course already exists;
- its course ID and course code/name;
- instructor enrollment;
- publication/state as relevant;
- current modules/pages/assignments/rubrics;
- whether stale/partial content is already present.

Do not trust a historical course ID without reading the current target back.

Do not create a duplicate course merely because discovery is inconvenient.

### 2. Reconcile current Git source against the compiler

Run the existing Architecture desired-state/dry-run path if one exists.

If no Architecture compiler exists but the shared compiler can be parameterized cleanly, generalize the shared path rather than cloning a course-specific deployment stack.

Represent unresolved course mechanics honestly.

Do not invent:

- points;
- grading weights;
- due dates;
- late rules;
- submission mechanisms;
- final zyBooks product/deep links;
- production configuration.

If an unresolved value is required by the current compiler, fix the compiler/schema to support an honest missing/YELLOW state where appropriate rather than fabricating policy.

### 3. Imprint only source-backed objects

Use the established write path to create/update the intended Savnac course.

Prioritize a coherent student journey over object count.

At minimum, once source exists, the rendered course should expose:

- course identity/information;
- semester/weekly navigation;
- Week at a Glance or equivalent weekly landing;
- student-facing pages/reference links;
- actual labs/assignments/rubrics that are source-ready;
- a coherent Week 1 → Week 2 → Week 3 → Week 4 path.

Later authored weeks should use the same object model and navigation pattern.

### 4. Read Savnac back after writing

Verify from the rendered target, not merely from the outbound payload:

- intended course identity;
- instructor enrollment;
- module order;
- page/assignment/rubric existence;
- object links and navigation;
- student-visible status where appropriate;
- current Week 1 doctrine has no Architecture technical gate;
- Weeks 2–4 match current source;
- no stale six-chapter textbook-driven week titles overwrite the new curriculum-first spine;
- current operational zyBooks facts are not silently replaced by an unadopted product;
- no obvious duplicate modules/pages/assignments were created.

### 5. Perform a bounded professor/student walk

Where the existing acceptance tooling permits, walk the rendered course as a professor and/or synthetic student.

The walk should answer practical questions:

- Can a student tell what this week is about?
- Can they find the material/activity/submission?
- Can they move forward/back without getting trapped?
- Are unpublished or missing objects creating dead ends?
- Does the rendered language match source?

This is not a request for a giant new synthetic-student research battery.

### 6. Prove immediate re-run behavior

Run the supported dry-run/diff/no-op path again after imprint.

The desired state is:

- no duplicate objects proposed;
- no unexplained source-owned drift;
- intentional YELLOWs are explicit;
- a second imprint is understood and safe.

If idempotence is incomplete for an object type, document it with evidence and do not claim a clean no-op.

## Production boundary

This prompt authorizes **Savnac writes only**.

It does not authorize:

- production SWOSU Canvas writes;
- production enrollments;
- zyBooks vendor writes/adoptions;
- LTI production configuration;
- credential disclosure.

If a shared tool points at production by default, stop and correct the target before proceeding.

## Required report

Write:

`sidecar/reports/006_imprint_architecture_to_savnac_and_read_back.md`

Include:

- source commits inspected;
- Course Foundry / Imprint paths reused or generalized;
- resolved Savnac course identity;
- pre-write reconnaissance;
- compiler/dry-run result;
- objects created/updated/left untouched;
- rendered read-back verification;
- professor/student walk evidence;
- immediate re-run/drift behavior;
- unresolved source/YELLOW items;
- confirmation that production Canvas and zyBooks were not mutated;
- worker commit SHA(s) and relevant execution receipts.

## Foreman acceptance

Foreman independently verifies that:

1. the intended Architecture course, not a duplicate, was used;
2. rendered content comes from current Git source;
3. the course is useful for Jeremy to inspect in Savnac;
4. unsupported grading/vendor facts were not fabricated;
5. Week 1–4 navigation reflects the accepted semester design;
6. immediate re-run behavior is safe/understood;
7. no production Canvas or zyBooks write occurred;
8. the work reused the established deployment stack rather than creating another one.

## Done when

Computer Architecture can be compiled from current repository truth, imprinted into the intended Savnac course through the shared deployment path, read back, navigated, and re-run without silent duplication or fabricated policy.
