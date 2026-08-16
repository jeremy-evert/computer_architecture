# Week 5 authoring / execution validation receipt

**Status:** YELLOW - student-facing authoring + Linux/container Observatory path validated; final STF 320 showcase inventory and broad platform validation remain later work

**Validation date:** 2026-08-16  
**Authored commit:** `e50b78dec20e164db4a70ecb1d9ecb99db12ac6d`  
**Validator:** ChatGPT / current helm  
**Execution platform:** x86_64 Debian GNU/Linux 13 container-visible validation surface

## Authoring checks

- [x] No unresolved `REPLACE`, `Week NN`, or `WEEK TITLE` placeholders remain in authored student/instructor files.
- [x] `README.md` central question matches Monday/Wednesday/Friday.
- [x] Monday digest and deck share the same prior belief, workload-first model, $1,500 constraint, synthetic metric example, controlled reallocation, prediction, and scope.
- [x] AI Fluency integration matches Lens 5: Select the Right Model.
- [x] Professional Minds integration matches the accepted block map without creating a duplicate Architecture assignment.
- [x] Reference map follows Prompt 002 licensing/source doctrine.
- [x] Machine Dossier action is explicit: `ADD` Dossier v0.
- [x] Friday receipt cannot be completed by pasting raw output or a parts list.
- [x] Work stays inside Weekly Architecture / investigation + Explain/Defend categories; no due/late/drop mechanics were invented.

## Current-source / market-path checks

- [x] AMD official processor specification surface was reachable on 2026-08-16.
- [x] Intel official product specification/compare surface was reachable on 2026-08-16.
- [x] NVIDIA official GeForce specification/compare surface was reachable on 2026-08-16.
- [x] No specific retail price was hard-coded into the durable student lesson as timeless truth.
- [x] Price evidence is explicitly date/source stamped.
- [x] PCPartPicker is optional convenience, not course truth or a required path.
- [x] Automated retrieval of `https://pcpartpicker.com/list/` returned HTTP 403 during authoring validation; manual/equivalent workflow is therefore preserved intentionally.

## Execution checks

### Observatory command actually run

From the Prompt 003 laboratory implementation:

```bash
cd /path/to/computer_architecture
./lab/bin/archprobe --out-dir /tmp/week05-archprobe
```

Observed result shape:

```text
SWOSU Architecture Observatory
Scope: container-visible
OS: Debian GNU/Linux 13 (trixie)
Architecture: x86_64
CPU: AMD EPYC 9V74 80-Core Processor
Logical processors: 5
Visible memory: 5.9 GiB
Cache records: 4
Accelerator visible: False
NOTE: Running inside a container; CPU/memory/storage visibility may differ from the physical host.
```

Artifacts generated:

- `machine.json` - privacy-safe structured receipt;
- `machine.txt` - friendly summary.

The exact repository-root command used in the student handout was also executed successfully (`./lab/bin/archprobe --out-dir ...`).

The receipt correctly labeled the evidence `container-visible` and explicitly warned that visible CPU/memory/storage may differ from the physical host.

- [x] Required Week 5 executable tool path ran on the named Linux surface.
- [x] Evidence scope/context is explicit.
- [x] No root/admin, paid AI, private host, GPU, or purchase became a hidden requirement.
- [x] A course-owned fallback snapshot is committed for students unable to run the live Observatory path.

## Deck build

Student deck command:

```bash
latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=build monday.tex
```

Instructor notes command:

```bash
pdflatex -interaction=nonstopmode -halt-on-error \
  -jobname=monday-notes -output-directory=build \
  "\\def\\shownotes{1}\\input{monday.tex}"
```

- [x] Week 5 student deck compiled: 13 pages, 78,949 bytes, SHA-256 `b162f50c12243c13771d1ddd7b03577dfc984aca1ca751317bcab6053ebdf744` on the validation surface.
- [x] Week 5 instructor-notes deck compiled: 13 pages, 97,406 bytes, SHA-256 `63b9a65ef0147589363bdd94064a9d84b3beacea43586718f1f9847cb1fd3708`; title, hierarchy, claims-boundary, and handoff slides were visually spot-checked with no clipping/overlap observed.
- [x] Speaker notes are authored on all concept frames where they materially help the recording.
- [x] Slides are a visual storyboard rather than copied digest paragraphs.

## Fallback / equity

- [x] Builder website is optional.
- [x] Observable-machine fallback has the same reasoning ceiling.
- [x] Hypothetical fixed budget removes purchasing-power advantage.
- [x] Custom workload is guarded rather than requiring gaming/GPU interest.
- [x] No benchmark expertise is assumed in Week 5.

## Dossier continuity

- [x] Week 5 preserves original dated evidence rather than asking students to rewrite history later.
- [x] Week 6 can consume the workload/machine context without requiring a new design.
- [x] Week 14 can directly refresh the same budget/workload/design argument and compare against original evidence.

## Remaining YELLOWs

| Yellow | Why it remains | Blocks authoring? | Blocks student release? | Owner / next proof |
|---|---|---|---|---|
| STF 320 Bill inventory/showcase capture | real Windows machine inventory not executed in this pass | no | blocks final instructor showcase recording only | Jeremy + 004_m / recording prep |
| WSL2 Observatory path | Prompt 003 platform YELLOW remains | no | yes if WSL2 advertised as fully supported | 004_m on real Bill |
| macOS Observatory/chamber path | Prompt 003 platform YELLOW remains | no | only if macOS advertised as supported | 004_m on real Mac |
| commercial builder UI drift | external service may change/block access | no | no; manual manufacturer+retailer path is complete | week-level link check near release |

## Validation judgment

**Genuinely ready:** Week 5's intellectual/student path, free-source strategy, $1,500 design constraint, Dossier v0 contract, controlled tradeoff, deck/notes builds, fallback evidence, and Linux/container Observatory behavior.

**Do not yet claim:** that PCPartPicker is always reachable, that WSL/macOS are fully green, or that STF 320 Bill's current hardware inventory has been verified for the final showcase.
