# Week 11 - The Useful Lie of Memory

> **Central machine question:** What hardware mechanisms create the memory/process world software thinks it sees?

## Week at a Glance

**Prior belief:** when my program uses an address, it is basically naming a place in physical RAM.

**Prediction:** if two processes show similar virtual address ranges, does that mean they must be using the same physical memory?

**AI Fluency:** Lens 11 - Verify.  
**Professional Minds:** Wednesday - *Software Project Management*; Friday - *Growing Object-Oriented Software, Guided by Tests*.

Week 10 made physical hierarchy behavior visible. Week 11 begins from one memory access and asks what the program's address actually means.

## Required concepts

Virtual vs physical address, pages/page tables, TLB, protection/privilege, page faults, traps/exceptions/syscalls, interrupts, and a bounded device/I/O relationship. This is not an Operating Systems survey.

## Machine Dossier

**Action: REVISE.** Add only the VM/protection/process evidence that improves the persistent memory model.

## Required live path

On Linux/WSL where supported:

```bash
getconf PAGESIZE
cat /proc/self/maps
```

Use a short privacy-safe excerpt, not an environment dump. A curated trace is the equal-ceiling fallback on other surfaces.

## Scope

`/proc/<pid>/maps` is direct evidence about virtual mappings/permissions. It is **not** a complete physical-memory map. Root-only physical-frame archaeology is not required.