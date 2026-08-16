# Sidecar Prompt 004 - Author Weeks 5-14 of the Computer Architecture core

**Status:** OPEN - READY TO EXECUTE, but not started by this writing pass  
**Owner:** current helm / future authoring team  
**Mode when executed:** orient -> build shared authoring kit -> author in continuity waves -> execute labs -> record lectures/showcases -> review across weeks -> validate -> report  
**Depends on:** Prompt 001 reconciliation + Prompt 002 accepted source canon + Prompt 003 accepted laboratory substrate

> **This file is the work order. Writing or revising it does not authorize executing Prompt 004.**

---

# Why we need Prompt 004

Prompts 001-003 built the conditions for a good Computer Architecture course.

- Prompt 001 made the course **structurally coherent**.
- Prompt 002 made the course **source-coherent**.
- Prompt 003 made the course **experiment-coherent**.

Prompt 004 now has the expensive job: make the course **instructionally coherent**.

This is the pass where plans become actual weeks students can experience.

Until Prompt 004 is complete, the repository has an excellent course design, an open-source canon, a real laboratory, a grading model, and thin week shells. It does **not** yet have ten finished technical weeks.

The danger is not that later authors will fail to find enough Computer Architecture content. The danger is the opposite.

Computer Architecture has more good content than can fit into this course. A technically capable author can easily produce:

- ten accurate lecture decks;
- ten runnable labs;
- ten respectable assignments;
- ten impressive demonstrations;

and still build a bad semester.

That happens when every week resets the story, every lecture becomes a chapter summary, every lab proves a vocabulary word in isolation, every worker invents a slightly different evidence format, or the Machine Dossier turns into ten worksheets stapled together at the end.

Prompt 004 exists to prevent **death by competent fragmentation**.

The ten technical weeks must feel like one investigation:

> **Build a machine. Open it. Follow software down into it. Make its constraints hurt. Discover what the workload actually cares about. Then sit in the architect's chair and make the call.**

The course should gradually make the student less impressed by specifications and more interested in evidence.

In Week 5 the student is allowed to say things such as:

- more cores is better;
- more cache is better;
- this SSD has more GB per dollar;
- this GPU has a bigger number;
- this processor has a higher clock;

By Week 14 those claims should sound incomplete without the next question:

> **For what workload, under what constraint, measured how, and what tradeoff did you accept?**

That intellectual migration is the real product of Prompt 004.

---

# The payoff

If Prompt 004 succeeds, the Fall 2026 Architecture course gains something much more valuable than ten weeks of content.

It gains a **repeatable teaching engine**.

Each week will have a recognizable rhythm:

1. **Monday gives the student a model.**
2. **Wednesday makes the machine argue with the model.**
3. **Friday forces a better explanation.**

The student experiences a controlled progression:

- intuition;
- prediction;
- observation;
- perturbation;
- measurement;
- visualization;
- explanation;
- revision;
- architectural judgment.

The instructor gains a different but equally important rhythm:

- one day to teach through a deliberate slide deck and recorded explanation;
- one day to guide or demonstrate a real investigation;
- one day to show the authentic stack at work and expose where the simplified student model leads in real systems.

The Stack Showcase can visibly include current tools and real systems such as:

- ChatGPT;
- Claude;
- Copilot;
- Gemini;
- Grok;
- Codex;
- Claude Code;
- aider;
- OpenClaw;
- local models;
- compilers;
- debuggers;
- profilers;
- disassemblers;
- containers;
- physical machines;
- multicore systems;
- GPUs;
- clusters/NRP-style systems;
- other useful current tools.

That authentic instructor stack is **visible pedagogy, not a student requirement**.

The ideal result is a course where students can see frontier tooling, serious systems, and ambitious workflows without being graded on access to any of them.

---

# The hard parts

Prompt 004 should treat these as the real engineering problems.

## Hard part 1 - Ten weeks must feel like one course

The easiest failure mode is to author weeks independently.

Do not.

Continuity is a first-class acceptance criterion.

The student should keep meeting familiar objects:

- the Week 5 designed machine;
- the Week 5 observable machine;
- one bounded RISC-V specimen/program family through Weeks 6-9;
- one bounded memory/data-access story through Weeks 10-11;
- one bounded workload family through Weeks 12-13;
- the same Machine Dossier throughout Weeks 5-14.

A week may introduce a new tool or model when needed, but the course should avoid the feeling that Monday erases Friday.

## Hard part 2 - Teach less Architecture so students understand more Architecture

This is not a compressed graduate survey.

Every author will discover tempting material that is true, important, and outside the course's useful depth.

The correct response is often to leave it out.

Use this test:

> **Does this concept help the student explain evidence, predict behavior, or defend a design decision in this semester's machine story?**

If not, it may belong in:

- optional enrichment;
- instructor background;
- a Friday Stack Showcase;
- a future course;
- nowhere this semester.

Coverage is not mastery.

## Hard part 3 - Labs must expose mechanisms, not merely execute commands

Prompt 003 proved the substrate.

Prompt 004 must turn that substrate into **experiences**.

A bad lab says:

> run this command, paste this screenshot, answer what cache is.

A good lab says:

> predict which workload will care about this constraint, change one bounded condition, measure the difference, plot it, then explain why the shape did or did not match the prediction.

The lab tool is not the lesson.

The receipt is not the lesson.

The **argument between the student's model and the machine's evidence** is the lesson.

## Hard part 4 - Do not overclaim what a benchmark proves

Prompt 003 deliberately preserved inconvenient evidence.

Examples already observed:

- cache/working-set curves are shaped by real hardware and environment noise;
- local scaling is not guaranteed to improve monotonically;
- the vectorized build can be slower than the non-vectorized build;
- the communication-delay harness models per-message waiting cost, not Internet hardware latency;
- the RISC-V interpreter exposes architectural state, not cycle-accurate microarchitecture timing.

Prompt 004 must preserve this epistemic honesty.

Do not clean up surprising evidence merely to make the slide prettier.

Teach the student to ask:

- what exactly did this experiment vary?
- what stayed fixed?
- what does this measurement directly show?
- what mechanism is plausible?
- what additional evidence would strengthen the claim?
- what would be an overclaim?

## Hard part 5 - The Machine Dossier must remain alive without becoming busywork

The dossier is the persistent artifact, but not every Friday needs a new dossier page.

For each week decide whether the dossier should:

- add evidence;
- add a plot/trace;
- revise a claim;
- correct a naive metric;
- preserve an earlier design choice with stronger evidence;
- note a limitation;
- or simply remain background context.

Do not force an artificial dossier update merely because a template has a blank box.

## Hard part 6 - The slide deck must teach, not archive

Monday is not a dump of everything the instructor knows.

The deck should support a recorded explanation with a clear narrative arc:

1. central question;
2. useful prior belief;
3. model/mechanism;
4. prediction;
5. worked trace/example;
6. setup for Wednesday's experiment;
7. unresolved question the machine gets to answer.

A deck should make the student curious about the lab.

Do not turn slides into textbook pages projected one at a time.

## Hard part 7 - Friday Stack Showcase must be authentic without becoming inaccessible

The Stack Showcase is not another required student lab.

Its job is to answer:

> **Where does this week's idea show up when an experienced person works with real systems and real tools?**

The professor may use hardware, services, premium AI, local infrastructure, GPUs, clusters, or current tools students do not own.

The showcase should always explicitly connect back to the week's transferable architecture idea.

Students should finish thinking:

> I cannot reproduce Jeremy's whole stack, but I understand what he was measuring/choosing/arguing about.

## Hard part 8 - AI integration must model judgment rather than product loyalty

AI Fluency is already mapped by week.

Prompt 004 should integrate it into Architecture work without creating "ChatGPT assignments."

Good uses include:

- ask multiple models for a prediction and compare disagreement;
- ask AI to explain a disassembly, then verify against the actual trace;
- ask AI to predict a cache curve, then measure it;
- ask AI for a hardware recommendation, then attack its metric;
- ask AI to explain why scaling stopped, then inspect evidence;
- use AI to propose an architecture decision, then require evidence that could prove it wrong.

The durable rule remains:

> **AI can propose. Evidence decides.**

## Hard part 9 - Current market evidence must stay current

Weeks 5 and 14 intentionally use real product/spec/price evidence.

Do not bake August 2026 prices into permanent doctrine.

Course-owned material teaches:

- how to compare;
- how to verify specs;
- how to distinguish market price from architecture property;
- how to choose a metric;
- how to critique that metric.

The actual shopping/spec snapshot is dated evidence and should be refreshable.

## Hard part 10 - Platform YELLOWs are real but should not hijack authoring

Prompt 003 passed the Linux substrate and left named YELLOWs for:

- WSL2 execution;
- actual Containerfile build/runtime validation;
- Podman;
- macOS;
- native Windows host observation.

Those YELLOWs do **not** block authoring.

Prompt 004 authors should:

- write against the stable lab contract;
- avoid Linux-only prose when the concept is portable;
- clearly label when a step depends on Linux/WSL behavior;
- preserve fallback evidence paths;
- report any newly discovered platform-specific assumption.

Available Mac and Windows machines can be used to burn down those YELLOWs during later validation, but do not let platform porting swallow the curriculum-authoring mission.

---

# Questions Prompt 004 must answer

1. **What does the student believe at the beginning of each week that the week is designed to refine, break, or deepen?**
2. **What is the smallest course-owned explanation that makes Wednesday's evidence interpretable?**
3. **What prediction should the student make before running the experiment?**
4. **What one architectural constraint or relationship is Wednesday trying to make perceptible?**
5. **What evidence is strong enough for the student to make a claim, and what would be an overclaim?**
6. **What belongs in the Machine Dossier this week, if anything?**
7. **What prior artifact/specimen/workload is intentionally reused so the week does not reset context?**
8. **What should the student Explain/Defend on Friday that cannot be answered by pasting raw output?**
9. **What authentic Stack Showcase would demonstrate the idea on a real instructor system/tool stack?**
10. **What open/free student-facing source actually helps, and what primary source verifies truth?**
11. **What fallback preserves the same reasoning ceiling if a student's machine does not expose the phenomenon cleanly?**
12. **What exact lab interface from Prompt 003 is used, and has that path actually been executed for this week's authored workload?**
13. **What is intentionally omitted because it would increase breadth without improving the accepted learning arc?**
14. **How does this week make Week 14's final architectural judgment better?**
15. **What remains uncertain after authoring and should be recorded as a YELLOW rather than silently guessed?**

If a week cannot answer these questions, it is not finished.

---

# Preconditions and inherited truth

Read before authoring:

## Course doctrine

- `AGENTS.md`
- `README.md`
- `course_metadata.yaml`
- `planning/fall-2026-course-design.md`
- `planning/fall-2026-spine.md`
- `planning/architecture-arc-map.md`
- `planning/block-map.md`
- `planning/machine-dossier.md`
- `planning/week-05.md` through `planning/week-14.md`
- `docs/grading-model.md`
- `sidecar/PLANNING.md`

## Source contract

- `sidecar/prompts/002_build_open_source_architecture_canon.md`
- `sidecar/reports/002_build_open_source_architecture_canon.md`
- `planning/open-source-resource-canon.md`
- `planning/open-source-resource-map.csv`

## Laboratory contract

- `sidecar/prompts/003_build_reproducible_architecture_lab.md`
- `sidecar/reports/003_build_reproducible_architecture_lab.md`
- `lab/README.md`
- `lab/CONTRACT.md`
- `lab/MEASUREMENT.md`
- `lab/validation/2026-08-16-native-linux-smoke.json`

Do not reopen settled choices merely because an author has a favorite textbook, simulator, plotting environment, notebook platform, or ISA.

---

# Frozen semester decisions

Do not reopen during Prompt 004 without implementation evidence showing a real contradiction.

- Official course modality is online/asynchronous.
- Monday/Wednesday/Friday is a production/release rhythm, not attendance.
- Weeks 5-14 are the entire technical Architecture runway.
- Week 14 ends Architecture technical instruction.
- Machine Dossier begins Week 5 and freezes Week 14.
- Checkpoints are Weeks 6, 9, and 14.
- RISC-V is the planning-leading teaching ISA.
- No required commercial textbook/zyBooks.
- No required paid AI.
- No required premium CLI agent.
- No required GPU/FPGA/Raspberry Pi.
- CPU-only required path.
- Required path has the same grading ceiling as optional premium/hardware paths.
- Prompt 002's source/reuse classifications stand.
- Prompt 003's lab interfaces stand.
- Matplotlib is the standard plotting instrument.
- LaTeX/PDF is the dossier publishing instrument.
- OpenMP is the required first-line multicore substrate.
- MPI is optional enrichment unless later evidence earns it a larger role.
- Week 16 is not an Architecture capstone or Checkpoint 4.

---

# Stable laboratory contract

Week authors may rely on:

```text
archlab doctor
archprobe [--out-dir DIR]
archlab run riscv
archlab run dependency
archlab run memory
archlab run scaling
archlab run communication
archlab run vector
archplot dependency|memory|scaling|communication|vector DATA.csv --out FIGURE.png
archlab dossier build --work-dir DIR [--figure FIGURE.png ...]
archlab smoke
```

Use these as common substrate.

Do not casually replace them with:

- one-off Jupyter notebooks;
- per-week Python environments;
- unrelated simulators;
- screenshot-only evidence;
- proprietary lab software;
- separate CSV conventions;
- new dossier generators.

If the lab substrate genuinely lacks something required for the learning objective, document the gap and make the smallest compatible extension. Do not fork the laboratory architecture by convenience.

---

# The course's persistent threads

Prompt 004 should explicitly manage these threads across weeks.

## Thread A - The Machine

Week 5 establishes two related objects:

1. the **student-designed machine**;
2. the **observable real machine**.

The designed machine supports compatibility, workload, budget, and architecture judgment.

The observable machine supports measurements and evidence.

They do not need to be the same machine.

Week 14 returns to the designed machine and asks what the student would now change or defend.

## Thread B - The Specimen program

Weeks 6-9 should reuse one small program/value story whenever practical.

Prompt 003 already proved a useful bounded specimen:

```c
int transform(int x) {
    int y = x + 2;
    if (y > 5) {
        y = y * 3;
    }
    return y;
}
```

The exact specimen may be refined if authoring evidence finds a clearly better one, but do not replace it casually.

A good specimen should be small enough to:

- reason about values;
- represent values in binary/hex;
- compile to understandable RISC-V;
- expose registers/stack/branching;
- trace through a bounded datapath;
- discuss dependency/overlap/performance;
- reuse during the Week 9 integration checkpoint.

## Thread C - The data-access story

Weeks 10-11 should reuse a common memory/data story when possible.

Week 10 asks what the physical hierarchy does to behavior.

Week 11 asks how hardware/OS mechanisms create the software-visible abstraction around memory and I/O.

Do not make Week 11 feel like the student accidentally enrolled in Operating Systems.

## Thread D - The workload-shape story

Weeks 12-13 should reuse a workload family from:

- shared-memory scaling;
- communication/synchronization sensitivity;
- scalar/vector/general/specialized execution.

The connective question is:

> **What shape of work does this machine organization reward or punish?**

## Thread E - The Metrics

Metrics should mature over the semester.

Week 5 may intentionally use naive metrics such as:

- dollars/GB;
- dollars/TB;
- dollars/core;
- clock rate;
- headline throughput.

Later weeks should complicate them.

Examples:

- Week 8: latency vs throughput, CPI/CPU time;
- Week 10: latency and bandwidth make capacity-only comparisons look childish;
- Week 12: more cores do not guarantee useful speedup;
- Week 13: theoretical/vector/accelerator capability does not guarantee workload speedup;
- Week 14: choose the metric that actually matters to the workload and defend why.

The student should be allowed to discover that an earlier metric was naive.

That is evidence of learning, not a grading trap.

## Thread F - The Evidence Grammar

Across all weeks:

> **Predict -> Perturb -> Run -> Measure -> Visualize -> Explain -> Revise**

Not every week must perform every verb with identical weight, but the grammar should become recognizable.

## Thread G - The Instructor Stack

Monday and Friday recordings should gradually model a professional Architecture workflow:

- ask a question;
- use AI/tools to generate hypotheses;
- inspect primary evidence;
- run commands/experiments;
- compare model disagreement;
- visualize data;
- update a judgment.

The course should make sophisticated tool use visible while keeping student requirements humane.

---

# Common technical week package

Every Week 5-14 must ultimately produce a coherent package, not merely a `week-NN.md` expansion.

Exact repository paths may follow existing Course Foundry conventions, but every week needs the following logical artifacts.

## 1. Week-at-a-Glance / central question

A student should be able to answer in under a minute:

- What question are we trying to answer?
- Why should I care?
- What will I make/measure this week?
- What evidence am I expected to keep?
- What prior artifact are we reusing?

## 2. Monday lecture digest

Course-owned explanation that is concise enough to read and strong enough to support the lab.

It should include:

- central question;
- prerequisite recall;
- bounded model/mechanism;
- worked trace/example;
- common misconception;
- prediction/setup for Wednesday;
- references/verification layer.

The digest is part of **the course becoming its own textbook**.

## 3. Monday slide deck

A real presentation deck, not the digest pasted into slides.

Target characteristics:

- visual hierarchy;
- diagrams/traces where they earn space;
- low text density;
- clear transitions;
- room for the instructor to explain;
- explicit prediction before the lab result is shown;
- optional speaker notes/recording cues.

## 4. Monday recording plan

Plan the screen-recorded teaching session.

Include:

- opening question/hook;
- slides/visual sequence;
- where to switch from slides to terminal/tool/browser/AI if useful;
- one or two moments where evidence corrects intuition;
- where to stop before giving away Wednesday's result;
- estimated scope, not an arbitrary fixed minute count.

Do not optimize for runtime at the expense of clarity.

## 5. Wednesday investigation

Student-facing lab/trace/build that uses the stable `archlab` substrate where relevant.

Must include:

- prediction;
- exact supported commands;
- what variable/condition changes;
- what stays controlled;
- receipt/data location;
- visualization path when useful;
- interpretation questions;
- limitation/overclaim warning;
- fallback evidence path.

## 6. Canonical instructor run

Execute the authored workload before declaring the week ready.

Preserve a concise validation receipt containing:

- environment;
- commands;
- result;
- expected shape/behavior;
- warnings/noise;
- commit/version.

Do not require student numbers to match the instructor's machine.

## 7. Friday Explain/Defend receipt

The recurring individual evidence receipt should usually require:

1. **Claim / question**;
2. **Evidence that matters**;
3. **Architecture mechanism**;
4. **Revision / limitation / tradeoff**.

The exact wording may change by week.

The receipt must not be answerable by raw output alone.

## 8. Friday Stack Showcase plan

Plan one authentic demonstration.

For each showcase state:

- the real system/tool/workflow;
- the architecture idea being amplified;
- what students should notice;
- what is optional/instructor-only;
- what claim should **not** be inferred from the demonstration.

## 9. Machine Dossier handoff

State explicitly:

- add;
- revise;
- consult;
- or no new dossier material.

When adding evidence, define where it belongs in Machine Map or Sensitivity Profile.

## 10. Source map

For each week's required source set identify:

- course-owned student explanation;
- primary/official truth source;
- optional student reinforcement;
- instructor background;
- license/reuse posture.

Consume Prompt 002. Do not conduct a fresh textbook hunt every week.

## 11. Assessment/rubric contract

Use `docs/grading-model.md`.

Author within the accepted categories:

- Weekly Architecture / investigation work;
- Weekly Explain / Defend receipt;
- Machine Dossier checkpoint when Week 6, 9, or 14.

Do not invent:

- due dates;
- late penalties;
- drop-lowest mechanics;
- resubmission mechanics;
- new weighted categories.

## 12. Accessibility/fallback

Every live measurement week must say what happens if:

- the tool is unavailable;
- the machine produces noisy evidence;
- the phenomenon is not cleanly visible;
- the student is on a supported fallback surface.

Fallback evidence retains the same reasoning ceiling.

## 13. Week validation receipt

A week is not green because prose exists.

Record:

- links checked;
- commands executed;
- lab run result;
- plot generated where applicable;
- dossier integration checked;
- references verified;
- unresolved YELLOWs.

---

# Lecture authoring doctrine

## Teach toward Wednesday

Monday should prepare a mental model and a prediction.

Do not resolve every interesting question before the student has a chance to interrogate the machine.

A useful Monday ending often sounds like:

> **If our model is right, changing X should make Y happen. Wednesday we get to find out whether the machine agrees.**

## Prefer one powerful diagram to six decorative diagrams

Where visuals are needed, author course-owned diagrams or use legally compatible/adaptable material according to Prompt 002.

Do not screenshot random internet diagrams into slides.

## Work examples all the way through

Prefer one trace/example that survives multiple slides over a series of unrelated mini-examples.

## State scope explicitly

Examples:

- "This is a teaching datapath, not a diagram of your Ryzen/Apple/Intel core."
- "This architectural-state interpreter does not model cycle timing."
- "This benchmark exposes one dependency pattern; it does not reveal physical pipeline depth directly."
- "This user-space communication delay models per-message waiting; it is not a measurement of the public Internet."

Scope is part of the lesson.

---

# Stack Showcase doctrine

The Stack Showcase is one of this course's unique advantages as an asynchronous course.

It should feel like the instructor opening the workshop door.

Good showcase candidates include:

- inspect the actual CPU/cache/storage topology of a real workstation;
- ask several AI models to explain a surprising disassembly and verify them against evidence;
- compare compiler optimization levels and inspect generated code;
- profile a real application or local model workload;
- show a GPU/accelerator path after students have already mastered the CPU-only reasoning path;
- run a scaling experiment on a larger machine and compare its shape to the student-scale experiment;
- show container/VM/host differences with `archprobe`;
- inspect a process through OS tools;
- use a real hardware buying/design decision and defend it from measurements;
- show current agent/tool workflows while explicitly verifying their claims.

Avoid showcases that are merely product tours.

The showcase should answer a course question with real evidence.

---

# AI Fluency integration map

The accepted AI Fluency sequence should be woven into the Architecture work, not appended as an unrelated banner.

## Week 5 - Lens 5: Select the Right Model

Use AI/model choice to expose that different questions need different tools/models and that hardware-buying advice can be confident but metric-dependent.

Possible move: compare multiple recommendations for the same workload/budget and identify what assumptions differ.

## Week 6 - Lens 6: Engineer the Prompt

Ask for an explanation/trace of representation or RISC-V, then improve the question until the answer becomes testable against actual disassembly/state.

## Week 7 - Lens 7: Research and Retrieve

Make source quality visible. Compare AI explanation to RISC-V/official references and the bounded teaching datapath.

## Week 8 - Lens 8: Reason

Use AI to predict dependency/throughput behavior before measurement. Require mechanism, not vibes.

## Week 9 - Lens 9: Generate

Let AI generate a trace/hypothesis/diagram candidate. Checkpoint 2 requires the student to prove the chain rather than trust generated continuity.

## Week 10 - Lens 10: Critique

Give AI a seductive but naive memory claim and make the measurement critique it.

## Week 11 - Lens 11: Verify

Verify claims about virtual memory/process behavior against observable OS evidence and primary docs.

## Week 12 - Lens 12: Revise

Make a scaling prediction, observe where it fails, revise the performance model.

## Week 13 - Lens 13: Decide

Ask which execution organization fits a workload, then compare the recommendation to measured data movement/setup/throughput evidence.

## Week 14 - Lens 14: Automate

Automate evidence collection/plotting/report assembly while explicitly refusing to automate the final design judgment.

---

# Professional Minds integration

Professional Minds is part of the weekly rhythm but should not become forced Architecture metaphor theater.

Use the mapped reading/theme to open a meaningful human/professional question, then let the Architecture work stand on its own.

Accepted map:

- Week 5 Wednesday: **The Art of Thinking Clearly**
- Week 5 Friday: **How Not to Be Wrong**
- Week 6 Wednesday: **Statistics Done Wrong**
- Week 6 Friday: **Understanding Statistics & Experimental Design**
- Week 7 Wednesday: **Understanding by Design**
- Week 7 Friday: **Rethinking Grading**
- Week 8 Wednesday: **The Pragmatic Programmer**
- Week 8 Friday: **Clean Code**
- Week 9 Wednesday: **Refactoring**; no normal Friday PM burden due Fall Break
- Week 10 Wednesday: **Software Engineering**
- Week 10 Friday: **Agile Software Development**
- Week 11 Wednesday: **Software Project Management**
- Week 11 Friday: **Growing Object-Oriented Software, Guided by Tests**
- Week 12 Wednesday: **Getting Things Done**
- Week 12 Friday: **Joy on Demand**
- Week 13 Wednesday: **97 Things Every Programmer Should Know**
- Week 13 Friday: **How to Win Friends and Influence People**
- Week 14 Wednesday: **Docs for Developers**
- Week 14 Friday: **Prompt Engineering for Generative AI**

Do not invent a second Architecture assignment for the Professional Minds strand.

---

# Week-by-week authoring briefs

These briefs define intent and boundaries. They are not scripts that forbid better evidence-backed authoring decisions.

---

## Week 5 - Build the Machine

### Central question

> **What should I build for this workload, what does each part buy me, and how should I compare choices?**

### Why this week matters

This is the reveal.

Weeks 2-4 secretly built the investigator, laboratory habits, and machine-observation tools. Week 5 tells the student what those tools are for.

This is where the course stops talking about how to investigate and hands the student a machine worth investigating.

### Required DNA

Preserve the historical PC-build pattern:

1. **Would It Run?**
   - compatibility;
   - socket/chipset/interface;
   - memory support;
   - storage/interface;
   - power/form factor/thermal constraints at bounded depth.
2. **Would It Be Fun / Fit the Workload?**
   - choose a real workload;
   - allocate budget;
   - identify likely bottlenecks;
   - explain tradeoffs.
3. **Dollars Per**
   - use naive but real derived metrics;
   - make them explicit enough to critique later.

### Machine Dossier

Create Dossier v0:

- designed machine;
- workload;
- dated component/spec/price evidence;
- observable machine `archprobe` snapshot;
- initial Machine Map;
- initial hierarchy ledger;
- initial metrics and assumptions.

### Important authoring challenge

Do not make this a shopping class.

Students should learn that a specification becomes meaningful only relative to workload and constraint.

### Open decisions 004 must nail

- exact budget/workload prompt shape;
- whether students choose from workload archetypes or define their own under guardrails;
- how PCPartPicker/equivalent evidence is captured without vendor lock-in;
- exact initial hierarchy ledger columns;
- how much current market research is reasonable;
- which real instructor machine makes the best Friday design showcase.

---

## Week 6 - Bits Become Instructions

### Central question

> **What must software and hardware agree on for a program to run?**

### Required conceptual bridge

Connect:

**meaning -> value -> representation -> instruction -> encoding/state -> observed result**

### Coverage boundary

Include only the representation/ISA material needed to make the chain real:

- binary/hex;
- fixed-width unsigned/signed integers;
- two's complement;
- overflow;
- floating-point approximation at useful conceptual depth;
- bytes/endianness where helpful;
- RISC-V registers/instructions/encoding;
- source/assembly/machine-visible state;
- ABI/calling convention only where the specimen forces it to matter.

### Lab substrate

Use `archlab run riscv` and the proven C -> RV32I specimen unless evidence supports a better bounded specimen.

### Checkpoint 1

This is intentionally a light rehearsal checkpoint.

Student follows one value/operation across several layers and demonstrates:

- coherent execution/trace;
- concept use;
- explanation;
- reproducibility/demonstrability.

### Open decisions 004 must nail

- exact instruction subset students must understand;
- exact amount of binary encoding by hand versus tool-assisted inspection;
- float depth;
- whether endianness becomes a live observation or a worked example;
- best Checkpoint 1 artifact shape.

---

## Week 7 - Crack Open the CPU

### Central question

> **What has to exist inside the CPU for one instruction to execute correctly?**

### Required model

One bounded RISC-V-flavored teaching datapath should make these pieces necessary:

- PC;
- instruction memory;
- register file;
- ALU;
- data memory;
- muxes;
- decode/control;
- writeback/state transition.

### Design rule

Do not import a full HDL/digital-logic course.

Use logic only when a datapath need creates a reason to care.

### Continuity

Trace an instruction already familiar from Week 6.

### Sensory goal

The student should be able to point at a control/data path and explain **why each piece exists for this instruction**, not memorize the canonical diagram.

### Open decisions 004 must nail

- exact teaching datapath diagram;
- whether students manipulate a lightweight simulator/worksheet/model;
- how much control-signal detail is useful;
- whether any tiny build component earns its complexity;
- best Friday real-CPU/microarchitecture showcase without pretending the teaching datapath is a modern core.

---

## Week 8 - Make It Fast Without Breaking It

### Central question

> **Why does overlap improve performance, and why does it create new problems?**

### Concepts

- latency vs throughput;
- CPU time/CPI at useful depth;
- pipeline stages;
- dependencies;
- structural/data/control hazards;
- forwarding/stalls/flushes;
- branch effects.

### Sensory lab

Use `archlab run dependency` and `archplot dependency` as the native evidence substrate.

The student should compare dependent work with more independent work while understanding the claim's scope.

A separate bounded teaching pipeline trace/model may be used to make hazards visible.

Do not claim the native benchmark directly measures physical pipeline depth.

### Dossier

First major Sensitivity Profile figure.

### Open decisions 004 must nail

- exact workload duration/iterations for ordinary student systems;
- how the native dependency experiment and teaching pipeline model divide responsibility;
- how much CPI arithmetic is enough;
- first plot-reading micro-lesson;
- strongest instructor profiling/compiler Stack Showcase.

---

## Week 9 - Follow the Program Down

### Central question

> **Can I follow one small program through the stack without hand-waving?**

### Role

This is an integration/checkpoint week during the shorter Fall Break week.

Do not respond to the shorter week by adding a new theory unit.

Reuse Weeks 5-8 evidence.

### Checkpoint 2

Student follows one bounded program across:

**source -> representation -> compiler/toolchain -> RISC-V -> processor/datapath/performance evidence**

The course-owned specimen is the integration object.

External sources verify pieces but should not become five separate readings students must stitch together.

### Open decisions 004 must nail

- exact checkpoint deliverable shape;
- how much Week 5 machine context belongs in the synthesis;
- whether the student submits one dossier section, narrated trace, technical brief, or another reproducible format;
- what counts as enough evidence without making the checkpoint enormous.

---

## Week 10 - Make the Memory Hierarchy Hurt

### Central question

> **Why do we need layers of memory, and what does crossing a layer feel like?**

### Concepts

- temporal/spatial locality;
- cache lines/blocks;
- mapping/associativity/replacement at useful depth;
- hit/miss behavior;
- AMAT as a useful model, not a memorization stunt;
- latency vs bandwidth;
- working-set size;
- dependent vs streaming access.

### Sensory lab

Use:

```text
archlab run memory
archplot memory ...
```

The student should experience:

- pointer-chase/dependent latency;
- streaming/bulk throughput;
- working-set growth;
- a machine-specific curve that may show cliffs/regions/noise.

### Dossier

Major Sensitivity Profile expansion.

Revisit Week 5 Dollars-Per with Time-Per/latency/bandwidth now available.

### Important epistemic rule

Do not grade the student on matching a canonical cache cliff.

Grade the quality of the controlled experiment and interpretation.

### Open decisions 004 must nail

- final working-set sweep and runtime sizing;
- exact default plots;
- how to pair `archprobe` cache topology with measured curves without overclaiming boundaries;
- exact AMAT depth;
- hierarchy ledger revision;
- whether storage enters this week or is held for Week 11.

---

## Week 11 - The Useful Lie of Memory

### Central question

> **What hardware mechanisms create the memory/process world software thinks it sees?**

### Concepts

Bounded introduction to:

- virtual vs physical addresses;
- page tables;
- TLB;
- protection/privilege;
- page faults;
- traps/exceptions/syscalls;
- interrupts;
- device/I/O path.

### Continuity

Take the memory-access story from Week 10 and move upward into the abstraction software sees.

### Experience

Prefer observable process evidence:

- `/proc`/maps or equivalent supported inspection;
- page/mapping observations;
- faults/counters where safely available;
- syscall/trap/interrupt traces where feasible;
- bounded storage/I/O observation if it clarifies the mechanism.

### Boundary

This is not Operating Systems in one week.

The goal is to reveal that useful software abstractions are created by hardware/OS mechanisms the student can partially observe.

### Open decisions 004 must nail

- exact live observation sequence;
- whether storage sequential/random behavior belongs here;
- how much page-table arithmetic is useful;
- whether a curated trace is better than a fragile live fault experiment;
- what can be made portable across WSL/Linux/macOS later.

---

## Week 12 - More Cores, More Problems

### Central question

> **When does adding workers help, and when does cooperation cost more than it buys?**

### Concepts

- thread/data parallelism;
- Amdahl's Law;
- shared memory;
- synchronization;
- cache coherence at useful conceptual depth;
- false sharing;
- workload grain;
- communication-to-computation ratio;
- waiting/coordination cost.

### Sensory substrate

Use both:

```text
archlab run scaling
archplot scaling ...

archlab run communication
archplot communication ...
```

The student should encounter two different reasons "more" can fail:

1. additional workers do not guarantee proportional speedup;
2. frequent dependent communication makes per-message waiting disproportionately painful.

### Chatterbox vs Freight Train

Preserve this contrast.

The same total payload can respond dramatically differently to per-message waiting because communication shape matters.

State clearly that the user-space delay is a controlled model of per-message waiting, not direct Internet/network hardware measurement.

### MPI

Optional enrichment only unless a later run proves it buys enough learning to justify the setup.

### Dossier

Add scaling/communication Sensitivity Profile evidence.

### Open decisions 004 must nail

- student-safe runtime/workload sizes;
- whether false sharing gets a live micro-experiment, trace, or conceptual demonstration;
- exact Amdahl quantitative depth;
- how to pair shared-memory scaling and communication sensitivity without turning Wednesday into two giant labs;
- best instructor MPI/NRP/multicore showcase.

---

## Week 13 - Different Machines for Different Work

### Central question

> **When does the workload justify a different kind of machine?**

### Concepts

- scalar execution;
- SIMD/vector;
- GPU/SIMT at conceptual depth;
- throughput-oriented design;
- memory bandwidth/data movement;
- setup/launch/transfer costs;
- accelerator/tensor/ML workload shapes;
- FP32/FP16/BF16/int8 where they clarify hardware tradeoffs.

### Required path

CPU-only.

Use:

```text
archlab run vector
archplot vector ...
```

Prompt 003 already produced a beautiful inconvenient result: the compiler reported vectorization while the vectorized/native build was slower in that validation run.

Do not force a fake speedup.

Use compiler/disassembly evidence plus repeated measurement to ask whether the expected specialization benefit materialized and why the evidence may be messy.

### Optional enrichment

GPU/accelerator demonstrations are welcome for the instructor Stack Showcase or capable students, but no grade ceiling changes.

### Continuity

Reuse a workload shape from Week 12 where practical so the question becomes general parallelism versus specialized execution, not a random CUDA week.

### Open decisions 004 must nail

- best common CPU workload for scalar/vector comparison;
- whether to expose compiler vectorization reports directly to students;
- exact precision-format depth;
- how much GPU memory/data-movement theory is useful without a required GPU;
- best optional GPU/local-model/accelerator showcase.

---

## Week 14 - Sit in the Architect's Chair

### Central question

> **Given my workload and constraints, what would I build now, and what evidence changed or strengthened my judgment?**

### Role

This is the Architecture finale.

Do not introduce a new technical unit.

Do not launch a future capstone.

Do not make the student prove they learned by adding more content.

Make them **decide**.

### Return to Week 5

Use the same or explicitly bounded:

- workload;
- budget;
- design goal.

Refresh time-sensitive product/spec/price evidence.

### Final decision dimensions

Students may draw from:

- compatibility;
- performance;
- latency;
- throughput;
- memory capacity;
- memory bandwidth;
- storage;
- cost;
- power/energy where responsibly supported;
- programmability;
- parallelism;
- specialization;
- reliability/security where useful;
- workload fit.

They should not be required to discuss every dimension.

They should choose the dimensions that actually matter and defend why.

### Checkpoint 3

For several important choices record:

- original choice;
- current choice;
- changed or deliberately unchanged;
- workload requirement;
- metric chosen;
- evidence from dossier;
- tradeoff accepted;
- limitation/uncertainty.

### AI Fluency

Automate evidence collection, plotting, source gathering, or report assembly where useful.

Do **not** automate final judgment.

### Dossier

Compile the final technical PDF and **freeze it here**.

### Stack Showcase

Jeremy defends one real machine/system/tool-stack decision using the same intellectual grammar students have earned.

### Open decisions 004 must nail

- final checkpoint format/rubric detail within accepted grading structure;
- minimum number of defended design choices;
- how market-refresh evidence is captured;
- dossier length expectations, if any;
- how to reward a well-defended "I would keep the same part" decision;
- final showcase machine/system choice.

---

# Authoring strategy: build in continuity waves

Do not dispatch all ten weeks blindly at once.

Prompt 004 should prefer **waves** so later weeks consume stable artifacts from earlier weeks.

## Wave 0 - Build the shared authoring kit

Before deep week authoring, establish common templates/conventions for:

- week-at-a-glance;
- lecture digest;
- slide/deck source;
- recording plan;
- lab handout;
- Explain/Defend receipt;
- Stack Showcase plan;
- reference map;
- validation receipt;
- dossier handoff.

Do not overengineer templates.

The goal is consistency, not bureaucracy.

## Wave 1 - Weeks 5-6

Build the machine and hardware/software contract.

Verify that Week 6 clearly grows from Week 5 rather than resetting into a number-systems chapter.

Checkpoint 1 closes the wave.

## Wave 2 - Weeks 7-9

Use one specimen to open the CPU, introduce performance/overlap, then integrate source-to-machine evidence.

Checkpoint 2 closes the wave.

## Wave 3 - Weeks 10-11

Use one memory/data story to move from physical hierarchy behavior to software-visible abstraction.

## Wave 4 - Weeks 12-13

Use one workload family to move from shared-memory/communication scaling to specialized execution.

## Wave 5 - Week 14

Return to Week 5.

No new theory.

Force architectural judgment.

## Wave 6 - Cross-week editorial pass

After all weeks exist, review the entire technical runway as one student would experience it.

Hunt for:

- repeated definitions;
- unexplained terminology introduced too early;
- continuity breaks;
- contradictory metrics;
- duplicate assignments;
- workload/specimen resets;
- labs that do not inform Friday's receipt;
- Friday receipts that are answerable without the lab;
- dossier updates that feel artificial;
- AI activities that are vendor-shaped rather than judgment-shaped;
- Stack Showcases that are cool but irrelevant;
- source links that became more important than course-owned explanation;
- accidental post-Week-14 content creep.

---

# Worker/agent dispatch doctrine

If multiple workers are used, do not treat them as independent course designers.

Give each worker:

- the week brief;
- prior/next continuity artifacts;
- lab contract;
- source canon slice;
- shared templates;
- explicit non-goals;
- expected validation path.

Prefer assignments shaped as:

- one week with clear upstream/downstream contract; or
- one sister pair where continuity is the main challenge.

Good pairings:

- 5 + 6;
- 7 + 8, with 9 integration authored after both;
- 10 + 11;
- 12 + 13;
- 14 separately as synthesis.

The helm owns cross-week coherence.

No worker may silently invent:

- a new lab runner;
- a new evidence format;
- a new grading category;
- a new required paid tool;
- a new required hardware platform;
- a new textbook dependency;
- a new checkpoint;
- a new technical week after Week 14.

---

# Grading contract

Use `docs/grading-model.md`.

The technical core already has its category structure:

- Weekly Architecture / investigation work: 30%
- Weekly Explain / Defend evidence receipt: 10%
- Machine Dossier checkpoints: 20% at Weeks 6, 9, 14

Do not invent new weight.

## Weekly investigation

Grade the bounded investigation and usable evidence, not expensive hardware performance.

## Explain / Defend

Protect the course from becoming command execution.

Require evidence interpretation in the student's own argument.

## Checkpoints

Use the accepted axes:

- Functions / Runs;
- Concept use;
- Explanation;
- Demonstrability / Reproducibility;
- real tradeoff where design comparison is involved.

## Unresolved operational mechanics

Prompt 004 must **not** silently decide:

- exact due dates;
- late penalties;
- drop-lowest mechanics;
- revision windows;
- resubmission mechanics;
- Canvas assignment-group implementation.

Record any authoring assumption that later operational work must resolve.

---

# Source doctrine

Prompt 002 is authoritative.

## Student surface

Prefer:

1. course-owned digest/diagram/trace;
2. small bounded open/free reinforcement;
3. primary/official reference for verification.

Do not make students tour five universities to understand one week.

## Reuse

- RISC-V specification/manual: CC BY 4.0, attribution required.
- MIT OCW: CC BY-NC-SA 4.0, deliberate attribution/noncommercial/share-alike handling.
- Berkeley CS61C 2026: link-only, no derivatives.
- Cornell/Cambridge: link-first unless rights are separately verified.
- Nand2Tetris instructional content: inspiration/link unless content rights are verified; tool code has separate licensing.
- vendor docs: cite/link as official reference.

## Red weeks

Prompt 002 deliberately classified Weeks 5, 9, and 14 as course-owned REDs.

Do not search for an external chapter to solve them.

Author them.

---

# Measurement doctrine

Consume `lab/MEASUREMENT.md`.

At minimum preserve:

- explicit units;
- raw receipts;
- repeated measurements;
- relevant parameters/tool versions;
- intentional compiler optimization settings;
- protection against dead-code elimination where relevant;
- awareness of scheduler/background/virtualization noise;
- within-machine comparisons over cross-student leaderboards;
- cautious causal claims;
- fallback data when the live machine does not cooperate.

The goal is not publication-grade benchmarking.

The goal is evidence honest enough to support architecture reasoning.

---

# Open questions that Prompt 004 is expected to settle

These are not defects in the planning. They are the authoring work.

## Course-wide

- exact repository/file package shape for completed weeks;
- final shared templates;
- approximate lecture/recording scope by week;
- exact balance of digest vs deck vs recording;
- how many external student links are useful before they become noise;
- exact format of the recurring Explain/Defend receipt;
- how much dossier prose is expected versus generated evidence;
- common accessibility language;
- when to use live data versus fallback data by default;
- which real systems make the strongest Stack Showcases.

## Technical depth

- exact RISC-V instruction subset;
- exact float/endianness depth;
- exact datapath/control detail;
- exact pipeline/CPI arithmetic depth;
- exact cache mapping/associativity depth;
- exact AMAT depth;
- exact VM/page-table arithmetic depth;
- exact coherence/false-sharing depth;
- exact Amdahl quantitative depth;
- exact SIMD/GPU/precision-format depth.

The answer should be governed by the accepted week question and evidence task, not by chapter completeness.

## Experiment tuning

- default iteration counts/runtime targets;
- working-set sizes;
- trial counts;
- plotting defaults;
- which surprising validation results to preserve as examples;
- where platform-specific behavior needs additional instructions;
- which 003 YELLOWs materially affect student-facing wording.

## Assessment shape

- exact Checkpoint 1 artifact;
- exact Checkpoint 2 artifact;
- exact Checkpoint 3 dossier/defense artifact;
- criterion language within the accepted grading model;
- evidence minimums that are rigorous without becoming paperwork.

Record decisions as they are made so future authors do not have to reconstruct them from chat history.

---

# Explicit non-goals

Prompt 004 does **not** authorize:

- production Canvas writes;
- Savnac writes;
- LMS enrollment changes;
- due/late/drop policy decisions;
- new grade weights/categories;
- a required commercial textbook;
- required zyBooks;
- required paid AI;
- required premium CLI agents;
- required GPU/FPGA/Raspberry Pi;
- required access to Jeremy's private systems;
- a Kubernetes/NRP student requirement;
- replacing RISC-V because another ISA has nicer slides;
- replacing the stable lab substrate by author preference;
- a giant custom CPU simulator without demonstrated need;
- a Week 16 Architecture capstone;
- a fourth technical checkpoint;
- new Architecture technical content after Week 14;
- fake cross-platform support claims.

---

# Required durable outputs when executed

Prompt 004 should create the complete technical teaching package for Weeks 5-14.

Exact paths may follow the repository's authoring/deployment conventions, but durable outputs must include:

## Shared authoring assets

- common week package/template or documented convention;
- common Explain/Defend receipt pattern;
- common validation receipt pattern;
- any shared course-owned diagrams/reference cards needed across weeks;
- any small compatible lab-substrate extensions proven necessary.

## For every Week 5-14

- Week-at-a-Glance;
- course-owned lecture digest;
- slide/deck source and rendered/validated form as appropriate;
- recording plan/speaker notes;
- AI Fluency integration;
- Professional Minds integration;
- student-facing investigation/lab/trace/build;
- exact stable lab commands where applicable;
- student evidence instructions;
- visualization/plotting path where useful;
- Explain/Defend receipt;
- Machine Dossier handoff;
- source/reference map;
- Friday Stack Showcase plan;
- rubric/check criteria inside accepted grading structure;
- fallback/accessibility path;
- execution/validation receipt;
- explicit remaining YELLOWs.

## Checkpoint packages

- Week 6 Checkpoint 1;
- Week 9 Checkpoint 2;
- Week 14 Checkpoint 3 / final Machine Dossier defense.

---

# Required execution report

Write:

`sidecar/reports/004_author_weeks_05_14_architecture_core.md`

The report must include:

## 1. Authoring architecture

- shared templates/conventions chosen;
- continuity threads actually used;
- major authoring decisions made;
- major tempting content deliberately omitted.

## 2. Week readiness matrix

For every Week 5-14 report:

- central question;
- lecture digest;
- deck;
- recording plan;
- AI Fluency;
- Professional Minds;
- open/free references;
- investigation/lab;
- canonical executed run;
- evidence receipt;
- plot/visualization where relevant;
- Machine Dossier role;
- Stack Showcase;
- grading/rubric;
- fallback/accessibility;
- validation status;
- commit/worker;
- remaining YELLOWs.

## 3. Cross-week continuity audit

Explicitly verify:

- Week 5 machine returns in Week 14;
- Week 6-9 specimen continuity;
- Week 10-11 memory/data continuity;
- Week 12-13 workload continuity;
- metrics mature over the semester;
- dossier is living, not ten worksheets;
- checkpoints synthesize rather than add unrelated work.

## 4. Lab integration audit

State:

- which `archlab` interfaces each week uses;
- any substrate extension required;
- exact week-level execution validation performed;
- platform caveats discovered;
- fallback datasets used/created.

## 5. Source/licensing audit

Confirm Prompt 002 compliance and record any new source/reuse decision.

## 6. Assessment audit

Confirm:

- categories unchanged;
- Checkpoint 1/2/3 only;
- Explain/Defend requires interpretation;
- no hardware/premium-tool grade advantage;
- due/late/drop mechanics remain explicitly unresolved unless a separate authorized decision exists.

## 7. Recording/showcase plan audit

For each week record the intended Monday recording shape and Friday Stack Showcase.

## 8. Remaining YELLOWs

Do not hide unfinished work.

Classify whether each YELLOW blocks:

- authoring;
- student release;
- Savnac imprint;
- production Canvas.

---

# Acceptance gates

Prompt 004 passes only when these gates are satisfied.

## Gate A - One course, not ten chapters

A student can trace persistent artifacts/workloads/questions across weeks.

## Gate B - Monday earns Wednesday

Lecture material provides the exact model needed to make a prediction and interpret the lab.

## Gate C - Wednesday exposes Architecture

The investigation materially reveals a mechanism/constraint rather than merely exercising tooling.

## Gate D - Friday requires judgment

Explain/Defend cannot be completed by pasting output.

## Gate E - Dossier remains alive

Each dossier update is justified and Week 14 can genuinely use earlier evidence.

## Gate F - Source path is humane

Required learning is no-paywall and does not outsource coherence to external sites.

## Gate G - Lab path is real

Authored commands have actually been executed in the supported substrate or are explicitly YELLOW.

## Gate H - Claims respect evidence scope

No benchmark is asked to prove more than it measures.

## Gate I - Fallback preserves reasoning

Hardware/tool variation does not lower the attainable grade ceiling.

## Gate J - Instructor stack remains pedagogy

Premium/frontier/private tooling may appear in recordings but is never a hidden student prerequisite.

## Gate K - Checkpoints synthesize

Weeks 6, 9, and 14 make students connect evidence across layers rather than complete a larger pile of disconnected tasks.

## Gate L - Week 14 really ends the course

No technical dependency is deferred into Weeks 15-17.

## Gate M - Cross-week editorial pass completed

The whole technical runway has been reviewed as a semester experience, not merely as ten individually accepted directories.

---

# Done when

Prompt 004 is done when Weeks 5-14 are no longer promises in a planning map.

They are a coherent, runnable, teachable Architecture course core in which a student can:

1. design a machine for a workload;
2. interrogate a real machine;
3. follow values into representation and instructions;
4. explain what must happen inside a CPU for an instruction to execute;
5. experience why dependency and overlap matter;
6. follow one program down through the stack;
7. make memory latency, bandwidth, locality, and working-set effects visible;
8. connect software-visible memory/process abstractions to underlying mechanisms;
9. measure where parallel scaling helps and where coordination hurts;
10. compare general and specialized execution without assuming optimization means faster;
11. accumulate evidence in one Machine Dossier;
12. revise naive metrics rather than merely replace them with new vocabulary;
13. use AI/tools as hypothesis generators while keeping evidence sovereign;
14. defend an architecture decision from evidence in Week 14.

And the instructor can teach that same arc through a deliberate asynchronous rhythm:

> **Monday: build the model.**  
> **Wednesday: make the machine argue with it.**  
> **Friday: explain the smoke, then open the workshop door.**

The real completion test is the Week 14 question:

> **What would you build now, and what evidence changed or strengthened your mind?**

If the student can answer that question with a dossier full of measurements they understand rather than specifications they memorized, Prompt 004 did its job.
