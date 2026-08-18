# Initiative 009 d04 Savnac re-baseline receipt

## Scope and inputs

- Work order: `sidecar/prompts/009_d_04_rebaseline_savnac.md`
- Architecture branch: `golem/009-d04-savnac-rebaseline`
- Architecture launch SHA: `7ce6cd6b591aa29fc05d114b0afb1c224f4f2222`
- Target: existing Savnac Computer Architecture course `8` only
- Mode: read-only inventory and guarded dry-run; no `push`, `--confirm-live`, prune, or production Canvas access

| checkout | SHA consumed | preflight dirt |
| --- | --- | ---: |
| `computer_architecture` | `7ce6cd6b591aa29fc05d114b0afb1c224f4f2222` | 0 |
| `course_foundry` | `22b895a593ef72d0787882b5f40d8463b36db981` | 673 status entries |
| `semester_kickoff_week` | `94d8591369c350996f6984b05d0a9d50cee764a8` | 0 |
| `ai_fluency` | `022262cf207c28a9504425779a24247ddcf66884` | 0 |
| `professional_minds` | `af54438aeb4bddbbceed4524bc10379b0b9d5a3c` | 0 |

The dirty Course Foundry checkout was read-only and unchanged. Explicit source-root overrides were used for every compiler input.

## Current desired-state build

- Course: `Computer Architecture`, id `8`
- Modules: `21`; desired module items: `229`
- Desired types: `81 Page`, `32 File`, `116 Assignment`
- Assignment groups: `11`, total weight `100%`
- `drop_lowest=1`: AI Fluency, Professional Minds Wednesday, Professional Minds Friday, Weekly Architecture, Weekly Explain/Defend
- Machine Dossier checkpoints: only Weeks 6, 9, 14
- A6: Week 14 update and Week 15 submission; A7: Week 17 final reflection; course evaluation: Week 17
- Week 16: recurring content remains present but no graded recurring work or checkpoint
- Desired unresolved `{{link:...}}` tokens: `0`
- Desired duplicate titles: none in a module; no undeclared omissions

## Savnac read-back

Read-only API inventory identified course `8` as `Computer Architecture (COMSC-3013)`, workflow `available`.

- Modules: `21`, positions 1–21, canonical titles/order; module-item total `229`
- Live module-item types: `81 Page`, `32 File`, `116 Assignment`
- Assignments: `116` across pagination; all `116` reported `has_submitted_submissions=false`
- Module-local duplicate titles: none
- Assignment groups: 12 live groups. The extra `Assignments` group has weight `0` and no drop rule; it is the known unused historical default group. The 11 desired named groups match current doctrine and total `100%`.
- Enrollments: active `StudentViewEnrollment` / `Test Student`, and active `TeacherEnrollment` / `Jeremy (jevert)` only
- No student submissions or enrollment mutation was requested or performed

## Guarded dry-run

Command shape:

```text
PYTHONPATH=/mnt/brandy_nvme/jevert/git/course_foundry:/mnt/brandy_nvme/jevert/git/imprint \
course_foundry/.venv/bin/python -m course_foundry.savnac_deploy dry-run \
  --course architecture \
  --architecture-root /tmp/computer_architecture-009-d04 \
  --kickoff-root /mnt/brandy_nvme/jevert/git/semester_kickoff_week \
  --ai-root /mnt/brandy_nvme/jevert/git/ai_fluency \
  --professional-minds-root /mnt/brandy_nvme/jevert/git/professional_minds
```

Result: `0 create / 7 update / 233 unchanged / 0 delete`; exit status `0`.

The seven counted updates are body changes in:

- Week 02 — Week at a Glance;
- Week 03 — Week at a Glance;
- Week 04 — Week at a Glance;
- A6 — Professional Pathway (Week 14 Update);
- A6 — Professional Pathway (Week 15 Submission);
- Week 16 — Week at a Glance;
- Week 16 — Explain / Defend.

Existing module metadata refreshes are emitted by the reconciler but are explicitly excluded from the summary tally. All 11 desired assignment groups were skipped unchanged. No create, delete, kind change, duplicate-triggering collision, or prune-scope request was present.

The seven body changes are expected current-main deltas: `git diff 36c339f..HEAD` shows the six source files containing the corresponding accepted post-Prompt-006/current-doctrine changes. They are student-facing material updates, so d05 is required if the Foreman authorizes the bounded follow-up.

## Validation

- `python3 scripts/validate_savnac_launch_source.py`: completed; receipt `sidecar/runs/architecture_savnac_source_validation_20260818T143157Z.md` (green with named host-capability yellows).
- `course_foundry/.venv/bin/python -m pytest ...test_architecture_desired_course.py ...test_savnac_deploy.py`: `16 passed`.
- `git diff --check`: pass.
- `make task-check`: unavailable, exact result `make: *** No rule to make target 'task-check'. Stop.`
- `make check`: unavailable, exact result `make: *** No rule to make target 'check'. Stop.`

No live Savnac write, production Canvas access/write, shared-repository mutation, JTT traversal, or d05/d06 execution occurred.
