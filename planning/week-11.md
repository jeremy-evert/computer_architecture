# Week 11 - The Useful Lie of Memory (Oct 26-30)

## Status
Accepted focus; exact VM/I/O observation path still needs authoring and platform validation.

## Weekly Focus
**What hardware mechanisms create the memory/process world software thinks it sees?**

Move from Week 10's physical hierarchy to the abstractions hardware and the OS jointly provide.

## Monday - Think / Frame / Lecture
**AI Fluency Lens 11: Verify.**

Lecture: **The Useful Lie of Memory.**

Coverage at introductory architecture depth:

- virtual versus physical addresses;
- page tables and TLB;
- protection/privilege;
- page faults;
- traps/exceptions/syscalls;
- interrupts;
- basic device/I/O path.

## Wednesday - Investigate / Break / Measure
**Professional Minds: _Software Project Management_ - How do projects become reliable products?**

Inspect one or more observable mechanisms:

- process address-space information;
- page/storage behavior;
- syscall/trap transition;
- sequential versus random storage/I/O behavior where portable and useful.

The lab should connect a software-visible abstraction to observable underlying mechanisms.

## Friday - Explain / Defend / Stack Showcase
**Professional Minds: _Growing Object-Oriented Software, Guided by Tests_ - How do projects become reliable products?**

Verify one abstraction with evidence: what software appears to see, what hardware/OS machinery helps create that appearance, and what observation supports the explanation.

**Stack Showcase:** trace a real process/syscall/I/O path with Jeremy's system tools where safe.

## Evidence this week
A verified mechanism explanation with command/trace/measurement evidence.

## Machine Dossier role
Add VM/protection/I/O evidence that explains what the earlier physical-machine map hides from normal software.

## Online-delivery note
M/W/F are asynchronous anchors. Avoid privileged-only required tooling.

## Open authoring notes
Do not turn Week 11 into an operating-systems survey. Choose mechanisms that clarify Architecture's role in creating software abstractions.
