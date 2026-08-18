# Prompt 009a — Report current Computer Architecture launch truth

**Status:** READY TO EXECUTE  
**Initiative charter:** `sidecar/prompts/009_architecture_launch_readiness_lifecycle.md`  
**Mode:** evidence-only reconnaissance; no implementation and no live LMS writes  
**Worksite:** `computer_architecture`

## Mission

Reconstruct the actual Fall 2026 Computer Architecture state from current source and accepted evidence before planning any new work.

This is deliberately a report stage. Do not repair stale navigation, author new curriculum, alter Course Foundry/Harbor, touch Brandy, or write to Savnac/production Canvas. The purpose is to distinguish:

- work that is genuinely incomplete;
- work that is already implemented but described by stale status files;
- launch-readiness work that has never been done;
- non-blocking platform or dogfood yellows;
- shared-infrastructure concerns that belong to a later owner.

The report must be capable of proving the Initiative 009 charter wrong.

## Read first — Computer Architecture

At minimum inspect the current default branch and:

- `AGENTS.md`
- `README.md`
- `course_metadata.yaml`
- `docs/grading-model.md`
- `docs/professional-pathway.md`
- `planning/block-map.md`
- `planning/week-01.md` through `planning/week-17-finals.md` as needed
- `planning/machine-dossier.md`
- `planning/technical-core-continuity.md`
- `weeks/README.md`
- `lab/README.md`
- `lab/PLATFORM_SUPPORT.md`
- `sidecar/README.md`
- `sidecar/PLANNING.md`
- `sidecar/prompts/README.md`
- `sidecar/questions/001_zybooks_decision_for_architecture.md`
- `sidecar/questions/002_zybooks_isa_product_and_course_role.md`
- `sidecar/questions/003_assessment_and_grading_contract.md`
- accepted reports for Prompts 001–006 and any available receipts/evidence for 007/008
- the newest relevant commits after Prompt 006, including accepted professional-pathway work

Do not assume a missing sidecar report means the work never happened. Trace accepted evidence and cross-repository receipts when the owning prompt intentionally wrote them elsewhere.

## Comparison evidence — sibling launch pattern

Read the minimum useful current CS1 launch evidence, especially:

- `computer_science_1/START_HERE.md`
- `computer_science_1/sidecar/prompts/102_cs1_online_launch_recon_and_target_lock.md`
- `computer_science_1/sidecar/reports/102_cs1_online_launch_recon_and_target_lock.md`
- the existence/role of CS1 Prompts 103 and 104.

Classify which parts are reusable family launch discipline and which are CS1-specific.

## Shared compiler/deployment boundary — read only

Inspect enough current `course_foundry` source/evidence to establish the Architecture compilation/deployment contract without changing it, including:

- `course_foundry/architecture_desired_course.py`;
- the Architecture Savnac/deployment path referenced by accepted Prompt 006 evidence;
- current tests/reports only where needed to understand known yellows or ownership.

Treat `course_foundry`, `harbor`, Brandy, and all shared repositories as read-only during this stage.

## Required report

Write:

`sidecar/reports/009_a_report_architecture_launch_readiness.md`

The report must contain the following sections.

### 1. Repository identity and evidence point

Record:

- repository identity;
- branch/default branch;
- current HEAD used for the report;
- latest relevant accepted work;
- the source files/reports used.

If the execution seat cannot inspect a local working tree, say so rather than inventing cleanliness.

### 2. Current-truth matrix

Classify each major area as:

- `GREEN_IMPLEMENTED`
- `GREEN_PROVEN`
- `YELLOW_EVIDENCE_LIMIT`
- `YELLOW_STALE_STATUS`
- `RED_BLOCKER`
- `UNKNOWN_REQUIRES_LIVE_RECON`

Cover at minimum:

- course identity/calendar/modality;
- Week 1 shared kickoff;
- Weeks 2–4 investigator runway;
- Weeks 5–14 technical core;
- Week 15 wind-down/professional pathway;
- Week 16 Farkle + ML/dead-days posture;
- Week 17 final reflection;
- grading groups/weights;
- drop-lowest;
- due-date convention;
- late/resubmission ownership;
- Machine Dossier;
- open/free required-material path;
- lab substrate and platform support claims;
- desired-course compiler;
- Savnac fixed point/read-back;
- production Canvas target identity;
- desired-vs-production semantic diff;
- professor/student-view dogfood;
- final production publish/launch closeout.

Cite concrete repository evidence for every material classification.

### 3. Stale-truth inventory

Identify files whose status prose materially disagrees with later accepted evidence. For each one state:

- stale claim;
- newer evidence;
- whether the mismatch could misdispatch a Foreman/worker;
- whether the repair is repo-local and safe.

Do not repair the files in this stage.

### 4. Savnac truth

Reconstruct what Prompt 006 actually proved, including:

- course id used;
- object/module/assignment/group evidence;
- idempotency/fixed-point proof;
- defects found and repaired during migration;
- remaining yellows;
- what Prompt 006 explicitly did not prove.

Do not equate Savnac success with production deployment.

### 5. Production-launch gap

Compare Architecture's evidence to the CS1 102/103/104 pattern and identify exactly what Architecture still lacks before production launch.

At minimum determine whether the following are already proven or still absent:

1. exact production Canvas target lock;
2. current Git desired-state dry run at a known source SHA;
3. read-only desired-vs-production semantic diff;
4. bounded production reconcile contract;
5. independent post-write student-view/read-back closeout.

Do not guess a Canvas course id from section metadata alone.

### 6. Shared-infrastructure collision boundary

Name any Architecture work that would require mutation in `course_foundry`, `harbor`, shared content repositories, or Brandy. During the active CS1 run, classify such work as a later owned unit rather than performing it.

A known shared defect or stale test is not automatically a launch blocker. Explain the evidence needed to decide.

### 7. Minimum next-map questions

End with the exact questions `009_b_map_architecture_launch_ready_shape.md` must answer. The questions should describe desired relationships and acceptance surfaces, not prescribe implementation prematurely.

## Acceptance criterion

009a is acceptable only if a fresh Foreman can read the report and answer all three questions without reconstructing tonight's chat:

1. What is already real and proven in Computer Architecture?
2. What status/navigation material is lying by age rather than by intent?
3. What concrete evidence is still missing between today's repo and a safely launched production course?

## Stop condition

Stop after the report is durable and reviewed. Do not edit stale files, author `009_b`, repair shared infrastructure, or make any LMS write in this prompt.
