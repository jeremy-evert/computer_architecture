# Sidecar Report 004_h - Week 11: The Useful Lie of Memory

**Status:** IMPLEMENTED WITH NAMED YELLOWS

Week 11 is implemented as the continuation of Week 10's memory story, not an Operating Systems reset.

## Decisions closed

- live evidence: unprivileged page-size plus `/proc/self/maps` observation on Linux/WSL;
- page-table arithmetic: one bounded VPN/offset example only;
- TLB/protection/faults/traps/syscalls/interrupts taught at architecture-explanatory depth;
- storage remains a relationship/file-backed mapping concept, not a new benchmark unit;
- no root/pagemap/physical-frame requirement;
- non-Linux path uses a curated trace with equal reasoning ceiling.

Current primary Linux and RISC-V privileged documentation was reverified. Both deck variants compile.

**Disposition: 004_h IMPLEMENTED WITH NAMED YELLOWS; memory act complete enough for Week 12.**