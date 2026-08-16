# Computer Architecture Sidecar

Project-local workbench for Jeremy, ChatGPT, the Foreman, golems, and other agents working **about** Computer Architecture.

The repository outside `sidecar/` is the course itself: durable course content, planning, policy, and decisions. It should describe the course without narrating the agent/human process that produced it.

## Current shape

- [`PLANNING.md`](PLANNING.md) — active deployment/readiness board: accepted direction, worldwide curriculum benchmarks, workstreams, gates, and Foreman queue.
- [`questions/`](questions/) — genuine unresolved ambiguities or policy/vendor decisions that need Jeremy's explicit resolution before dependent work can be finalized.
- [`prompts/`](prompts/) — bounded project-local Foreman work orders. Workers do not self-certify completion.
- `reports/` — execution reports, validation evidence, and Foreman-reviewed outcomes as work lands.

## Boundary rule

Use the sidecar for process truth:

- what still needs doing;
- who/what should investigate it;
- unresolved questions;
- execution receipts and reports;
- temporary planning that has not yet become course doctrine.

Promote accepted course truth out of the sidecar into the appropriate durable source such as `planning/`, `docs/`, lessons, labs, assignments, or `course_metadata.yaml`.

## Deployment doctrine

- **Git is authoritative.**
- **Savnac is the inspection/dogfood surface.**
- Production SWOSU Canvas is a later explicit deployment target, not the default place to experiment.
- Reuse Course Foundry / Imprint instead of creating course-specific LMS write machinery.
- Do not invent unresolved grading, due-date, vendor, or production configuration facts merely to make a deployment look complete.

## Legacy note

The repository-root `prompts/` and `reports/` directories predate this sidecar convention. They remain valid historical course-development provenance; new deployment orchestration belongs here unless a task is explicitly continuing an older root-level prompt/report contract.
