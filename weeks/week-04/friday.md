# Friday - Observation is not interpretation

Choose the strongest machine claim from Wednesday and defend it.

## Explain / Defend receipt

1. **Question:** what were you trying to know?
2. **Instrument:** which command/tool produced the observation?
3. **Observation:** quote only the evidence that matters.
4. **Interpretation:** what does that observation support?
5. **Boundary:** what does it not establish?
6. **Revision:** how would you ask the question more precisely next time?

## Fast-thinking trap

A familiar command can tempt us to skip from output directly to a story. Resist that jump.

A good Architecture investigator can point to the exact observation and say why the explanation follows, while keeping virtualization, containers, permissions, and evidence scope in view.

Week 5 will use these instruments to begin the Machine Dossier. The goal this week is to arrive there knowing how to look before you claim.

## Worked example (model, not the assignment)

A third claim, distinct from Wednesday's worked examples, so it does not
hand you the assignment answer:

1. **Question:** is this machine's `/bin/sh` a genuinely separate program,
   or an alias for another shell?
2. **Instrument:** `file /bin/sh`
3. **Observation:** `file` printed `/bin/sh: symbolic link to dash`.
4. **Interpretation:** on this machine, invoking `/bin/sh` runs the `dash`
   binary, not a distinct POSIX-shell implementation.
5. **Boundary:** this does not establish that every script that says
   `#!/bin/sh` behaves identically on another machine — `/bin/sh` is a
   distro-configurable symlink, and another system could point it at
   `bash`, `busybox`, or a different shell entirely.
6. **Revision:** to ask the question more precisely, follow the symlink
   target's own `--version` output, and check whether the behavior a script
   depends on is POSIX-guaranteed or `dash`-specific.

Notice the fast-thinking trap this resists: "it's called `sh`, so it's `sh`
everywhere" is exactly the jump from a familiar name to an unverified story.
