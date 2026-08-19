# 009 Flo preflight — source SHA table

| checkout | SHA consumed | notes |
| --- | --- | ---: |
| computer_architecture | c3f795f53e35763578ff4206d4a8dd3bbf4ad9d5 | clean, == origin/main |
| course_foundry (base) | 50801ff5a5786bb4c797c03c87b9798bcd064a41 | clean, == origin/main at start |
| course_foundry (after repair) | 969b50aa7f07dedb96049103f52b8bcc9fa0ac5c | promoted to origin/main by Flo |
| imprint | 7745fe1c1819a2c39c1b3ef488cde450a3ba8cf0 | clean |
| semester_kickoff_week | ca9d60f62da10d7789c68e398c41670a07a0e00d | clean; drift vs d04's 94d8591 is Monday Beamer deck + new sidecar doc/script only, not monday/wednesday/friday.md source used by Architecture Week 1 build |
| ai_fluency | 022262cf207c28a9504425779a24247ddcf66884 | clean, same as d04 |
| professional_minds | af54438aeb4bddbbceed4524bc10379b0b9d5a3c | clean, same as d04 |
| harbor (local) | 5d69e3ede4b6f1ab4cb32cf003faea79f7df8cc0 | dirty/diverged shared checkout preserved untouched; used read-only via harbor.client/harbor.api only |
| harbor (origin) | 91c1e400ce21b89f96b2697e9d1ae9d716694442 | not consumed; local read-only API surface (client.get/get_course) is stable across this drift |

Isolated worktree used for all Course Foundry compiler/test/deploy execution: `/mnt/brandy_nvme/jevert/git/course_foundry-flo009-preflight` (created via `git worktree add --detach origin/main`, later given branch `golem/009-flo-architecture-production-id-fix` for the repair commit). The shared `course_foundry` checkout at `/mnt/brandy_nvme/jevert/git/course_foundry` was pre-existing dirty (uncommitted DSCT/submission-listener changes, 673+ status/report files) and diverged from origin (2 ahead / 3 behind at observation). That dirt was preserved untouched; only its `.venv` was reused (gitignored, not git state).
