# Week 11 — The Memory Illusion II: Virtual Memory, Protection, I/O + OS Support (Oct 26–30)

## Status
Accepted spine; exact process/address-space/syscall/I/O investigation still needs authoring and validation.

## Weekly Focus
What hardware does an operating system need in order to create the private, protected world a process sees? Connect virtual/physical addressing, translation, protection/privilege, traps/exceptions/syscalls, interrupts, and basic I/O mechanisms.

This is the second half of the **Memory Reality + Memory Illusion** sister pair with Week 10.

## Monday — Oct 26 — Frame
Begin with Week 10's messy physical hierarchy and ask how software can nevertheless experience a clean address space and controlled access to devices/resources.

## Wednesday — Oct 28 — Inspect / Build / Measure
Inspect a real process address space and one OS-facing hardware mechanism. Candidate evidence includes mappings, page/address observations, syscall/trap traces, privilege boundaries, or an interrupt/I/O path where supported and safe.

## Friday — Oct 30 — Explain / Defend
Explain one useful software abstraction and identify the hardware mechanisms that make the illusion safe and practical.

## Evidence this week
An evidence-backed explanation connecting a software-visible abstraction to at least one concrete hardware/OS mechanism.

## Open authoring notes
Do not turn this into a full Operating Systems course. The focus is the architecture support that makes OS abstractions possible.
