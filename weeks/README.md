# Computer Architecture technical-week authoring contract

Weeks 5-14 are authored as self-contained week packages under `weeks/week-NN/`.

This directory is intentionally the teaching surface, not another planning layer. Thin semester intentions stay in `planning/`; runnable student-facing material belongs here once authored.

## The weekly rhythm

Every technical week follows one recognizable argument:

> **Monday builds the model. Wednesday makes the machine argue with it. Friday explains the smoke.**

The week is not three unrelated assignments. Monday should make Wednesday interpretable; Wednesday should generate the evidence Friday requires.

## Directory contract

Copy `weeks/_template/` to `weeks/week-NN/`, then replace placeholders rather than inventing a new layout.

```text
weeks/week-NN/
  README.md          # student Week at a Glance + dossier handoff
  monday.md          # student-readable digest + prediction
  monday.tex         # Beamer deck source; speaker notes live here
  wednesday.md       # investigation / sensory lab
  friday.md          # Explain / Defend receipt
  references.md      # teaching / truth / reinforcement map
  _instructor.md     # recording spine + Stack Showcase plan
  _validation.md     # author execution/readiness receipt
```

Checkpoint weeks (6, 9, 14) may add `checkpoint.md`. That file extends the ordinary week contract; it does not create a second assignment system.

Files beginning with `_` are author/instructor surfaces and should not be published to students by default.

## Paired-source lecture doctrine

`monday.md` and `monday.tex` are **paired sources**, not generated copies.

- `monday.md` is the readable explanation.
- `monday.tex` is the visual teaching storyboard.
- Speaker notes live beside the slide they support via `\note{...}`.
- `_instructor.md` holds the recording spine and demonstration logistics that do not belong in the student digest.

Do not paste whole paragraphs from the digest onto slides. Instead, keep these semantic anchors synchronized:

1. central question;
2. prior belief being refined;
3. named mechanism/model;
4. persistent worked example or trace;
5. Wednesday prediction;
6. scope / what the model does not prove;
7. evidence filenames or commands referenced.

If the digest and deck disagree on one of those anchors, the week is not ready.

## Student-facing surface

### `README.md` - Week at a Glance

Navigation, not lecture. A student should answer within a minute:

- What is the machine question?
- What should I predict before measuring?
- What happens Monday, Wednesday, Friday?
- What evidence do I submit?
- What changes in my Machine Dossier?

### `monday.md` - Think / Frame

Teach only enough architecture to support a prediction and interpret the investigation. End with a question the machine gets to answer.

### `wednesday.md` - Investigate / Break / Measure

Make the experimental grammar explicit:

**Predict -> Perturb -> Run -> Measure -> Visualize -> Explain -> Revise.**

Use the stable `archlab` contract when applicable. Name the controlled variable, what should stay fixed, the expected evidence files, and what the experiment does *not* prove.

### `friday.md` - Explain / Defend

The student submits judgment, not a screenshot dump. The recurring receipt is:

1. claim / bounded answer;
2. evidence that matters;
3. architecture mechanism;
4. limitation / what the evidence does not establish;
5. revision after evidence;
6. AI/tool use and independent verification when relevant.

## Machine Dossier handoff

Each week explicitly chooses one action in its `README.md`:

- **ADD** evidence;
- **REVISE** a claim;
- **CORRECT** a metric;
- **PRESERVE** a decision with stronger evidence;
- **CONSULT** only;
- **NO CHANGE**, with a reason.

A blank template box is never a reason to add dossier material.

## Instructor surfaces

### `_instructor.md`

Contains:

- Monday recording spine;
- canonical Wednesday demonstration notes if useful;
- Friday Stack Showcase plan;
- what premium/private/advanced tooling is intentionally instructor-only.

The Stack Showcase answers one question: **where does this week's idea show up in real work?** It is not another student lab or a product tour.

### `_validation.md`

A week is not green because prose exists. Record what was actually checked:

- authored commit;
- platform;
- lab commands;
- generated evidence;
- plot/PDF result where relevant;
- deck build;
- links;
- fallback;
- dossier handoff;
- remaining YELLOWs.

## Reference contract

`references.md` separates:

1. **Course-owned teaching surface** - what students should actually start with.
2. **Primary / official truth** - what verifies technical claims.
3. **Optional / link-first reinforcement** - useful but not required for coherence.
4. **Reuse note** - only when course material adapts licensed external content.

Do not reopen the Prompt 002 textbook hunt inside individual weeks.

## Deck build contract

All decks use `weeks/_shared/beamer-preamble.tex`.

From a week directory:

```bash
latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=build monday.tex
```

Instructor notes copy:

```bash
pdflatex -interaction=nonstopmode -halt-on-error \
  -output-directory=build \
  "\\PassOptionsToPackage{show}{pgfpages}\\input{monday.tex}"
```

Generated deck files live in `build/` and are not canonical source during authoring. The source plus `_validation.md` is canonical. A later deployment pass may choose to publish/retain rendered PDFs when LMS ingestion requires them.

## Naming and evidence

Use stable, boring names inside a week. Generated evidence should normally use the laboratory's own receipt naming under `lab/runs/`; week prose should name the expected experiment/figure rather than inventing parallel data schemas.

If a durable course fixture is necessary, place it deliberately under the appropriate course/lab-owned path and explain why it is committed.

## Checkpoint extension

Only Weeks 6, 9, and 14 add `checkpoint.md`.

Checkpoint expectations inherit the accepted axes:

- Functions / Runs;
- Concept use;
- Explanation;
- Demonstrability / Reproducibility;
- explicit tradeoff when the checkpoint is a design comparison.

Checkpoint work should synthesize the week's ordinary evidence rather than require a second unrelated project.

## Authoring rule of thumb

If a future author has to ask, "Which new folder/system should I invent for this?" the first answer is probably **none**.
