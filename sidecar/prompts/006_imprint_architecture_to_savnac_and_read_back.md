# Sidecar Prompt 006 — Imprint Computer Architecture into Savnac and read it back

**Status:** OPEN  
**Owner:** Foreman  
**Mode:** inspect → compile → imprint → read back → walk → verify

## Mission

Make the current Git-backed Computer Architecture course visible and inspectable in Savnac through Jeremy's existing Course Foundry / Imprint machinery.

This is a deployment-and-dogfood job, not a second curriculum-authoring system.

The acceptance condition is:

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

Locate the actual desired-course compiler, dry-run/diff path, imprint/write path, identity mapping, and read-back/acceptance tooling that currently own this responsibility.

Reuse/generalize existing machinery only where a real Architecture gap proves generalization necessary.

## Pinned rendered-course doctrine

The Savnac course must not imply that students are required to purchase or possess:

- zyBooks or another commercial textbook;
- paid ChatGPT/Claude or another paid AI subscription;
- Codex, Claude Code, or another premium AI CLI agent;
- specialized GPU hardware.

If optional premium resources are mentioned, they must be clearly labeled optional and the no-cost required path must remain visible.

## Sequencing

This prompt may open early for reconnaissance, but do not publish fake green weeks merely because the semester map names them.

A useful first imprint may include only the source-backed near-term slice:

- Course Information / landing context;
- Week 1;
- Week 2;
- Week 3;
- Week 4;
- any later weeks genuinely authored and validated.

As more weeks become source-ready, the same deployment path should extend the rendered course without duplicate objects.

## Required work

### 1. Resolve the intended Savnac course identity

Before writing anything, inspect Savnac and determine:

- whether the Computer Architecture test/dogfood course already exists;
- its course ID/code/name;
- instructor enrollment;
- publication/state as relevant;
- current modules/pages/assignments/rubrics;
- whether stale/partial content is already present.

Do not create a duplicate course because discovery is inconvenient.

### 2. Reconcile current Git source against the compiler

Run the existing Architecture desired-state/dry-run path if one exists.

If no Architecture compiler exists but shared machinery can be parameterized cleanly, generalize the shared path rather than cloning a course-specific stack.

Represent unresolved mechanics honestly.

Do not invent:

- points;
- grading weights;
- due dates;
- late rules;
- submission mechanisms;
- commercial-resource requirements;
- paid AI/CLI requirements;
- production configuration.

If an unresolved value is required by the compiler, fix the schema/path to represent honest missing/YELLOW state where appropriate rather than fabricating policy.

### 3. Imprint only source-backed objects

Use the established write path to create/update the intended Savnac course.

Prioritize a coherent student journey over object count.

At minimum, once source exists, the rendered course should expose:

- course identity/information;
- zero-cost required-materials doctrine where students need it;
- semester/weekly navigation;
- Week at a Glance or equivalent weekly landing;
- student-facing open/course-created reference material;
- actual labs/assignments/rubrics that are source-ready;
- a coherent Week 1 → Week 2 → Week 3 → Week 4 path.

### 4. Read Savnac back after writing

Verify from the rendered target, not merely the outbound payload:

- intended course identity;
- instructor enrollment;
- module order;
- page/assignment/rubric existence;
- object links/navigation;
- student-visible status where appropriate;
- Week 1 has no Architecture technical gate;
- Week 2 does not imply a paid AI/provider/CLI requirement;
- Weeks 3–4 match current source;
- no stale textbook-driven week titles overwrite the curriculum-first spine;
- no zyBooks/commercial textbook appears as required material;
- no specialized GPU or premium AI/CLI appears as required;
- no obvious duplicate modules/pages/assignments were created.

### 5. Perform a bounded professor/student walk

Where existing acceptance tooling permits, walk the rendered course as a professor and/or synthetic student.

Ask:

- Can a student tell what this week is about?
- Can they find the material/activity/submission?
- Can they complete the required path without hitting a paywall?
- Is a premium-tool mention clearly optional?
- Can they move forward/back without getting trapped?
- Are unpublished/missing objects creating dead ends?
- Does rendered language match source?

### 6. Prove immediate re-run behavior

Run supported dry-run/diff/no-op again after imprint.

Desired state:

- no duplicate objects proposed;
- no unexplained source-owned drift;
- intentional YELLOWs explicit;
- second imprint understood and safe.

If idempotence is incomplete, document it honestly.

## Production boundary

This prompt authorizes **Savnac writes only**.

It does not authorize:

- production SWOSU Canvas writes;
- production enrollments;
- zyBooks vendor writes/adoptions;
- LTI production configuration;
- credential disclosure.

## Required report

Write:

`sidecar/reports/006_imprint_architecture_to_savnac_and_read_back.md`

Include:

- source commits inspected;
- Course Foundry / Imprint paths reused/generalized;
- resolved Savnac course identity;
- pre-write reconnaissance;
- compiler/dry-run result;
- objects created/updated/left untouched;
- rendered read-back verification;
- professor/student walk evidence;
- no-paywall/optional-premium verification;
- immediate re-run/drift behavior;
- unresolved source/YELLOW items;
- confirmation production Canvas/zyBooks were not mutated;
- worker commit SHA(s) and relevant receipts.

## Foreman acceptance

Foreman independently verifies that:

1. the intended Architecture course, not a duplicate, was used;
2. rendered content comes from current Git source;
3. the course is useful for Jeremy to inspect;
4. unsupported grading facts were not fabricated;
5. the required student path contains no commercial-textbook, paid-AI/CLI, or specialized-GPU dependency;
6. Week 1–4 navigation reflects accepted design;
7. immediate re-run behavior is safe/understood;
8. no production Canvas or zyBooks write occurred;
9. work reused the established deployment stack.

## Done when

Computer Architecture can be compiled from current repository truth, imprinted into the intended Savnac course, read back, navigated, and re-run without silent duplication, fabricated policy, or a hidden paid-resource requirement.
