# Podman at the Podium — Incubator Charter

**Status:** Locked-in working direction  
**Incubator home:** `jeremy-evert/computer_architecture/podcast/`  
**Established:** 2026-08-27  
**Future:** May become its own repository/project after the show proves what it is

## Decision

*Podman at the Podium* begins inside the Computer Architecture course.

That is intentional.

Computer Architecture already provides the machines, experiments, Podman/container work, measurement doctrine, production rhythm, and immediate student audience needed to discover whether this idea actually works. The course can absorb the mechanical experimentation without requiring the show to know its final shape today.

The podcast does **not** need to remain a Computer Architecture artifact forever.

If the show develops a stable identity, repeatable production system, cross-disciplinary audience, meaningful guest pipeline, or material that increasingly belongs outside COMSC-3013, it should be allowed to graduate into its own durable home.

Do not move it merely because the idea is exciting. Move it when the work has developed boundaries worth preserving.

## What we are building

This is not only a podcast about Podman.

It is a show about **figuring things out in the presence of powerful machines**.

Computer Architecture is the first laboratory because architecture gives us wonderful mysteries:

- Why did more cores fail to make the program faster?
- What disappeared into the cache?
- Why did the same container behave differently on different iron?
- Where is the bottleneck?
- What part of the machine is doing the waiting?
- When does a clean abstraction leak?
- When does software fail to use hardware it technically owns?
- When does "the computer" stop being one box and become a network, cluster, or national platform?

The recurring doctrine remains:

> **The machine is powerful. You are the multiplier.**

## Three professors

The working show model has three teaching voices.

### Professor 1 — Jeremy

The builder, host, experimenter, and learner in public.

Jeremy does the homework required to bring a real question and a real phenomenon into the room. He is allowed to make mistakes. He is not allowed to pretend a mistake did not happen when it changes the explanation.

### Professor 2 — Professor Podman

The recurring interrogator and co-teacher.

Professor Podman asks whether the experimental chamber is honest:

- What changed?
- What did we hold constant?
- What are we measuring?
- Is that the host or the container?
- Can the program actually use the hardware we are bragging about?
- How do we know?

Warren Akers is the preferred first human model for this role. See `PROFESSOR_PODMAN.md`.

### Professor 3 — The guest

The guest brings another way of seeing.

The guest does not need to be a computer scientist and does not need to teach the syllabus. Mathematicians, storytellers, educators, humanists, finance faculty, kinesiology faculty, librarians, community leaders, research-computing experts, networking experts, and infrastructure builders can all make a machine mystery richer.

See `GUEST_GARDEN.md`.

## Collaboration is a feature, not a reward at the end

A major source of energy in this project is the opportunity to spend serious time with remarkable people Jeremy already knows through SWOSU, Oklahoma cyberinfrastructure, regional networks, national research computing, Internet2, ACCESS, the National Research Platform, and other communities.

That collaborative joy is not a distraction from the project. It is one of the reasons to build a production system durable enough to support it.

But collaboration must not become an excuse to skip preparation.

> **The machine earns the guest.**

Find something worth showing first.

## The mechanics-first phase

There is no need to rush guest production.

The current Computer Architecture videos can serve as the development laboratory for the show.

Jeremy + microphone + machine + Podman is enough to practice:

- capturing good audio;
- capturing terminal/screen evidence clearly;
- switching between face, machine, plot, and code without losing the story;
- creating transcripts;
- producing verified text recaps;
- creating audio-friendly cuts;
- finding chapter boundaries;
- preserving experiment receipts;
- editing a long exploration into a short useful story;
- discovering what demonstrations actually make a viewer lean toward the screen;
- building a repeatable publication path without making one SaaS platform the source of truth.

The solo recordings are not lesser episodes. They are the test bench that earns later collaboration.

## The screen-lean test

Before spending a guest's time, look for a phenomenon that creates some version of:

> **Holy shit. Look at that.**

The published language can be gentler when appropriate. The internal test is emotional and simple: did the machine do something that made the investigator genuinely want to show another intelligent person?

That reaction is a signal that there may be a story.

## The guest preparation contract

Before a technical guest session, Jeremy should arrive with:

1. **A question** worth discussing.
2. **A phenomenon** that has already been observed.
3. **A reproducible or inspectable artifact**: experiment, graph, trace, system, dataset, code path, hardware, or failure.
4. **Receipts** showing what was actually done.
5. **An initial explanation** that may be wrong.
6. **Known uncertainty** where the guest can genuinely contribute.

The purpose of preparation is not to control the guest's answer.

> **Do enough discovery to find the good question. Then leave room for the guest to surprise you.**

## People-first interviews

For recurring collaborators, especially Warren, begin with conversations about the human being before turning them into a show role.

Learn where they came from, what they care about, how they think, what makes them curious, what they do when they are wrong, and what questions they cannot resist following.

The show should reveal real people rather than manufacture expert-shaped characters.

## Mistakes become story arcs

A wrong prediction is not automatically a blooper.

If a guest asks a question Jeremy cannot answer responsibly, preserve it as **Professor's Homework**.

Do the work later and return with evidence.

That creates a recurring narrative pattern:

```text
question
  -> prediction
  -> experiment
  -> surprise
  -> "I don't know"
  -> professor's homework
  -> new evidence
  -> revised explanation
```

This models something more valuable than polished certainty: what capable people do after discovering the limits of what they know.

## The show is not bound to the semester

COMSC-3013 provides the launchpad, but the show may follow questions beyond the weekly syllabus.

A strong episode can be used in a course without being born from a week's assignment. A strong guest conversation can matter to students in multiple majors. A story about MPI, research networking, archives, human learning, finance, or the National Research Platform may outlive the semester that first created an excuse to record it.

The curriculum should benefit from the show without imprisoning it.

## Platform doctrine

No publication platform owns the intellectual project.

- **Git** owns the durable, non-sensitive source, experiment contract, outlines, corrections, and publication references.
- **Protected/institutional storage** owns raw or student-bearing recordings and transcripts when privacy requires it.
- **Institutional video tools** may provide capture, transcription, recap, and derivative-generation mechanics.
- **Canvas or another approved course surface** provides dependable required student access.
- **Public video/audio/community platforms** may carry sanitized derivatives and conversation when useful.

The show must remain recoverable even if a platform changes licensing, retention, features, or branding.

## Spin-out criteria

Consider moving *Podman at the Podium* to its own repository when several of these become true:

- episodes regularly serve audiences beyond Computer Architecture;
- guest planning becomes substantial enough to deserve its own lifecycle;
- production tooling is reusable across courses and public episodes;
- the show has a stable identity independent of COMSC-3013;
- episode seasons no longer map primarily to the Architecture semester;
- outside collaborators need a clean project boundary;
- publication, rights, release, branding, or archival needs deserve their own governance;
- the Computer Architecture repository starts carrying more show infrastructure than course truth.

Until then, **do not prematurely optimize the org chart.**

Build the good stuff here.

## Current durable artifacts

- `README.md` — show concept, episode grammar, season possibilities, channel architecture, and pilot.
- `PROFESSOR_PODMAN.md` — the co-teacher role, Warren-first discovery process, questioning grammar, and Professor's Homework.
- `GUEST_GARDEN.md` — people and possible story angles, captured without turning relationships into a ranked booking list.
- `INCUBATOR_CHARTER.md` — why the show starts in Computer Architecture, how the mechanics-first phase works, and when it may grow into its own home.

## The promise

We are not trying to manufacture polished experts talking at students.

We are trying to put interesting people beside interesting machines and let disciplined curiosity do some work.

> **These people do not need to know everything. They need to know how to find out.**

And when the machine gives us something worth seeing:

> **You need to come see this.**
