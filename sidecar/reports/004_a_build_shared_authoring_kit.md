# Sidecar Report 004_a - Build the shared Architecture authoring kit

**Status:** COMPLETE  
**Date:** 2026-08-16  
**Parent:** `sidecar/prompts/004_author_weeks_05_14_architecture_core.md`  
**Work order:** `sidecar/prompts/004_a_build_shared_authoring_kit.md`

## Result

Prompt 004_a created and executed a small common production grammar for every technical week in Computer Architecture.

The durable teaching surface is now `weeks/`.

Later week authors do not need to decide where Monday prose lives, how a deck is built, how Wednesday evidence is framed, how Friday explanation works, how the Machine Dossier receives evidence, how instructor-only notes are separated, or how a week proves that it actually runs.

They can begin with the Architecture question.

## Chosen repository shape

Technical weeks live at:

```text
weeks/week-NN/
  README.md
  monday.md
  monday.tex
  wednesday.md
  friday.md
  references.md
  _instructor.md
  _validation.md
```

Only checkpoint weeks 6, 9, and 14 may add `checkpoint.md`.

The copyable skeleton is `weeks/_template/` and the shared deck support is `weeks/_shared/beamer-preamble.tex`.

Files beginning with `_` are author/instructor surfaces and should not become student LMS objects by default.

This keeps one week's Monday/Wednesday/Friday material physically together instead of reproducing the sibling-course pattern of separate top-level `lessons/`, `presentations/`, and `assignments/` trees.

## Sibling-pattern inspection

The pass inspected the current CS1/CS2 repository shapes before choosing a new layout.

Useful precedent retained:

- self-contained repositories;
- plain Markdown course sources;
- Beamer for Monday decks;
- a shared local Beamer preamble rather than per-week themes;
- speaker notes attached to the slide they support;
- one real unit piloted before mass authoring.

Useful precedent **not** copied wholesale:

- separate top-level lesson/presentation/assignment taxonomies.

Architecture's asynchronous M/W/F design benefits from keeping the complete week together because Monday's model, Wednesday's experiment, and Friday's claim are one argument.

## Frozen authoring conventions

### Week at a Glance

`README.md` is navigation, not another lecture. It owns:

- central machine question;
- prior belief;
- pre-measurement prediction;
- accepted AI Fluency lens;
- mapped Professional Minds topics/calendar exception;
- Monday/Wednesday/Friday path;
- continuity object;
- Machine Dossier action;
- required-materials/equity statement;
- explicit scope/non-goals.

### Monday

`monday.md` and `monday.tex` are **paired sources**.

They are deliberately not mechanically generated from each other because readable explanatory prose and effective slides are different genres.

They must remain semantically synchronized on:

1. central question;
2. prior belief;
3. mechanism/model;
4. persistent worked example/trace;
5. Wednesday prediction;
6. scope/limitation;
7. referenced commands/evidence.

`monday.md` is the student-readable digest. `monday.tex` is the visual teaching storyboard. Speaker notes use Beamer `\note{...}`. Recording logistics live in `_instructor.md`.

### Wednesday

`wednesday.md` makes the recurring experiment grammar explicit:

**Predict -> Perturb -> Run -> Measure -> Visualize -> Explain -> Revise.**

It must name:

- what changes;
- what is held reasonably constant;
- exact supported tool/`archlab` path;
- evidence format and units;
- interpretation questions;
- likely overclaim;
- fallback with equal reasoning ceiling;
- cleanup/re-run guidance only where needed.

### Friday

`friday.md` owns the recurring Explain / Defend receipt:

1. claim / bounded answer;
2. evidence that matters;
3. architecture mechanism;
4. limitation / what evidence does not prove;
5. revision after evidence;
6. AI/tool contribution plus independent verification when relevant.

Raw terminal output is not the intellectual submission.

### Machine Dossier

Every week chooses exactly one handoff posture:

- **ADD**;
- **REVISE**;
- **CORRECT**;
- **PRESERVE**;
- **CONSULT**;
- **NO CHANGE**, with reason.

The blank template never justifies another dossier page.

### Instructor / Stack Showcase

`_instructor.md` owns:

- Monday recording spine;
- canonical Wednesday run notes;
- known noise/failure modes;
- fallback evidence pointer;
- Friday Stack Showcase.

A Stack Showcase names the course question, real system/tool, evidence/action, connection to the student lab, intentionally inaccessible/advanced pieces, and one takeaway.

It is a workshop door, not another assignment or a product tour.

### Sources

`references.md` separates:

- course-owned teaching surface;
- primary/official truth;
- optional/link-first reinforcement;
- explicit adaptation/reuse note only when needed.

Week authors inherit Prompt 002 and do not restart the textbook hunt.

### Validation

`_validation.md` records both authoring coherence and actual execution.

A week cannot become GREEN with unresolved `REPLACE`, `Week NN`, or `WEEK TITLE` placeholders.

It also checks:

- central-question consistency;
- digest/deck semantic sync;
- AI Fluency / Professional Minds alignment;
- licensing/source compliance;
- dossier handoff;
- grading-category integrity;
- exact commands executed;
- evidence units/context;
- fallback path;
- equity/no premium dependency;
- deck build;
- links;
- remaining YELLOWs and what they block.

## Generated-artifact decision

Generated deck build products live under `weeks/**/build/` and are ignored by Git during authoring.

Canonical authoring truth is source + validation receipt, not a growing pile of binary PDFs.

A later Course Foundry/Savnac deployment pass may deliberately publish or persist rendered PDFs if the LMS workflow requires them.

## Deck build proof

The blank template was compiled before acceptance.

### Student deck

Command:

```bash
cd weeks/_template
latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=build monday.tex
```

Result:

- PASS;
- 6-page PDF;
- 64,856 bytes in the validation environment;
- SHA-256 `2d7b3f6f2fb014d25a27b917f8857eded1e385973b706c050fe7e1dd62056ab7` for that local proof artifact.

The PDF was rendered to PNG at 160 DPI and visually inspected. Title, machine-question, worked-example, scope, and Wednesday-handoff frames showed no clipping/overlap/broken glyphs in the inspected render.

### Instructor notes build

An inherited CS1-style attempt using a `pgfpages` package option named `show` **failed** on the validation TeX stack with:

```text
LaTeX Error: Unknown option `show' for package `pgfpages'.
```

That failure was not hidden.

The Architecture shared preamble now uses an explicit `\shownotes` switch:

```bash
pdflatex -interaction=nonstopmode -halt-on-error \
  -jobname=monday-notes -output-directory=build \
  "\\def\\shownotes{1}\\input{monday.tex}"
```

Result:

- PASS;
- 6-page two-screen notes PDF;
- 77,970 bytes in the validation environment;
- SHA-256 `49c5448289abc0bf742350f56666538d81af24a922c45ab9894684e51f30d68a` for that local proof artifact;
- page size approximately 725.669 x 272.126 points, reflecting the slide + notes layout.

The notes PDF was rendered at 140 DPI and visually inspected. The slide and its speaker notes appeared side-by-side as intended.

## Implementation commits

- `6b6d03bdc3ee9a9cc678da0825ac34f80fb96def` - build shared Architecture authoring workbench;
- `29e024e8ea51ac286264afecc76670433d2fc47b` - fix instructor notes build after execution exposed the inherited bad invocation;
- `345d17ae2de3d453825f89dd060e0411a704bc60` - polish shared-strand placement, template audit, and macro interface.

## Tradeoffs rejected

### Rejected: auto-generate slides from the Markdown digest

Reason: it would optimize consistency at the cost of teaching quality. A good student explanation and a good visual storyboard are not the same artifact.

### Rejected: separate top-level `lessons/`, `presentations/`, and `assignments/`

Reason: Architecture's M/W/F online design works better when the whole weekly argument is visible in one directory.

### Rejected: commit generated PDFs by default

Reason: binary churn adds little authoring truth. Build success belongs in `_validation.md`; deployment may render later.

### Rejected: separate week-specific Beamer themes

Reason: decorative forks are maintenance debt. One local shared preamble is enough.

### Rejected: separate Machine Dossier assignment system

Reason: the dossier is a living artifact; a small handoff action is enough.

### Rejected: separate checkpoint framework

Reason: Weeks 6/9/14 add `checkpoint.md` but inherit the ordinary evidence/receipt/rubric grammar.

### Rejected: a new lab/data runner

Reason: Prompt 003 already settled the stable `archlab`/receipt contract.

## What 004_b through 004_k may now treat as frozen

Later week authors may assume:

- authored technical weeks live in `weeks/week-NN/`;
- the `_template` file set is the default package;
- `_` files are instructor/author surfaces;
- Monday digest + Beamer deck are paired, not generated;
- speaker notes live in the deck;
- `_instructor.md` owns recording/showcase logistics;
- Wednesday exposes the sensory grammar explicitly;
- Friday uses the common Explain/Defend receipt;
- Machine Dossier handoff uses the six accepted actions;
- references use teaching/truth/reinforcement/reuse layers;
- validation uses `_validation.md` and records actual execution;
- generated deck artifacts stay under ignored `build/` during authoring;
- checkpoint weeks extend the same system with `checkpoint.md`;
- no week invents a new runner, data schema, plotting system, or grading category casually.

These conventions may be changed later only when actual week authoring provides evidence that the workbench is getting in the way of the course.

## Scope kept clean

Prompt 004_a did **not**:

- author Week 5 technical content;
- choose Week 5 workloads/budgets;
- modify grading weights;
- modify the Prompt 003 lab CLI;
- claim WSL/macOS support;
- write Savnac/Canvas;
- begin Prompt 004_b.

## Disposition

**Prompt 004_a is complete.**

The common workbench is real, copied from a small skeleton, and its deck paths were executed rather than merely documented.

`004_b_author_week_05_build_the_machine.md` is now the next ready authoring work order.
