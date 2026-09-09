# Week 4 recap — Predict, then probe (the machine observation lab)

Sept. 9, 2026. Week 4's central question: **how do I ask the operating
system what this computer is and what it is doing?** Commands are
observation instruments, not trivia to memorize.

## The method

1. **Predict first.** Before running anything, write down what you already
   believe about your machine:
   - how much RAM it has, and how much is free right now;
   - how many CPU cores;
   - which process is busiest at this moment;
   - how long it has been up since boot.
   Predicting first is the point. It turns the exercise into a test of your
   model instead of a copy-paste.
2. **Find the one command that checks each belief.** On the required path
   that command is `archprobe`, which reports OS, installed/free RAM, CPU
   topology, boot time, and uptime in one small, inspectable block. On
   Linux the same questions are answered by `uname`, `lscpu`, `free`, `ps`,
   `file`, `od`. Either way you get to the same observation receipt.
3. **Score each prediction** against the output: correct, off, or "right
   number, wrong idea."

## What a real run showed

| You believed | Machine said | Verdict |
|---|---|---|
| ~32 GB RAM | 31.95 GiB installed | close |
| Windows using ~3 GB | ~13 GB in use (~42%) | way off |
| ~12 cores | **6 physical cores, 12 logical processors** | right number, wrong concept |
| Edge/Teams busiest | Edge was #1 in the sample | right |
| Up about a week | Up about 25 hours | off by ~6 days |

The best miss is the CPU one. "12" was a real number — it's the count of
**logical processors** (hardware threads), because this chip runs two
threads per core on 6 cores. Physical cores and logical processors are
reported separately on purpose; a prediction of "12 cores" is really a
prediction about threads.

## Habits we practiced

- **Predict before you measure.** An unchecked belief isn't evidence.
- **Separate observation from interpretation.** Quote the raw output, then
  say what it supports, then say what it does *not* establish.
- **No result is not proof of absence.** A check that finds nothing may
  have looked in the wrong place or swallowed its own error. Confirm it.
- **One broken line can void a whole script.** If a setup block has a parse
  error, none of its variables get set and everything after runs on blanks
  — even though nothing looked like it "crashed."
- **Keep the evidence.** The run writes a receipt (commands, output,
  interpretation) and commits it. If a step fails, the failure is part of
  the record, not something to hide.

## The observation receipt

Every machine claim this week fills the same six lines:

```
Question:
Instrument:
Observation (quote only the relevant raw output):
Interpretation (what does that observation support?):
Boundary (what does it not establish?):
Revision (how would you ask the question more precisely next time?):
```

## Setup (Windows required path)

```powershell
# from the repo directory, once per machine:
pwsh -NoProfile -File .\Install-ArchProbe.ps1
# close and reopen the terminal, then:
archprobe
```

Fill in your predictions file *before* you run the handoff script. If git
push fails, scroll up to read why — the git output isn't in the saved
receipt yet (a fix for that is coming).
