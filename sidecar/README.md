# Computer Architecture Sidecar

Project-local workbench for Jeremy, Piper, Flo, Wandas/workers, and other agents working **about** Computer Architecture.

The repository outside `sidecar/` is the course itself: durable course content, planning, policy, and decisions. It should describe the course without narrating the agent/human process that produced it.

## Current launch surface

Initiative 009 is in final deployment reconciliation. The active execution surface is deliberately small:

- [`PLANNING.md`](PLANNING.md) — current Architecture launch truth and gates;
- [`FLO_BURN.md`](FLO_BURN.md) — the two remaining bounded Flo jobs;
- [`jobs/009_architecture_preflight_to_green_to_write.md`](jobs/009_architecture_preflight_to_green_to_write.md) — current executable job;
- [`jobs/009_architecture_production_closeout.md`](jobs/009_architecture_production_closeout.md) — production job, only after accepted preflight + fresh human authorization;
- [`launch_flo.sh`](launch_flo.sh) — fresh scoped Flo launcher;
- [`reports/009_piper_ready_to_ship_preparation.md`](reports/009_piper_ready_to_ship_preparation.md) — Piper's current-truth/ship-prep receipt;
- `reports/` and `runs/` — execution/validation receipts;
- `prompts/` — historical bounded work orders and design provenance, including the original 009 d05–d08/009e decomposition;
- `questions/` — genuine unresolved human/vendor decisions when one actually exists.

## Commands

Current preflight, with **no SWOSU production write authority**:

```bash
./sidecar/launch_flo.sh
```

After preflight is promoted with exact verdict `GREEN TO WRITE`, the separate fresh human gate is:

```bash
./sidecar/launch_flo.sh production
```

The production launcher checks canonical `origin/main` for the accepted preflight verdict before granting the bounded write authority to fresh Flo.

## Boundary rule

Use the Sidecar for process truth:

- what still needs doing;
- who/what should investigate it;
- unresolved questions;
- execution receipts and reports;
- temporary planning that has not yet become course doctrine.

Promote accepted course truth out of the Sidecar into the appropriate durable source such as `planning/`, `docs/`, lessons, labs, assignments, or `course_metadata.yaml`.

## Deployment doctrine

- **Git is authoritative.**
- **Savnac is the inspection/dogfood surface.**
- **SWOSU Canvas is the production endgame.** It is not an experiment surface.
- Reuse Course Foundry / Imprint instead of creating course-specific LMS write machinery.
- The exact production course id must be freshly discovered and verified; historical ids are not proof.
- Production mutation requires an accepted current semantic diff plus the fresh explicit production launcher invocation.
- Do not invent unresolved grading, due-date, vendor, production configuration, or acceptance facts merely to make a deployment look complete.
- Jeremy is not the message bus. Flo dispatches and inspects workers herself until DONE or a genuine stop condition.

## Legacy note

The repository-root `prompts/` and `reports/` directories predate this Sidecar convention. They remain valid historical course-development provenance. The original Sidecar 009 prompt chain also remains valid provenance, but the **active dispatch surface is `FLO_BURN.md` + `jobs/` + `launch_flo.sh`**, not manual traversal of old prompts.