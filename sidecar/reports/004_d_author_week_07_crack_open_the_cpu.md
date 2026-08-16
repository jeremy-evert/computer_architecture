# Sidecar Report 004_d - Week 7: Crack Open the CPU

**Status:** IMPLEMENTED WITH NAMED YELLOWS  
**Implementation:** `weeks/week-07/`

Week 7 reuses the Week 6 specimen and builds a **course-owned bounded datapath from the instruction's needs**, avoiding the classic finished-spaghetti-diagram failure mode.

## Decisions closed

- datapath: PC -> fetch/decode -> register/immediate -> ALU -> optional data memory -> write-back/next PC;
- students trace a provided bounded model rather than build HDL;
- control depth stays semantic (source, ALU operation, memory, write-back, register-write, next PC);
- one contrasting load/store or branch trace makes control/path selection visible;
- ISA-visible state is explicitly separated from implementation detail;
- the Week 6 disassembly is the persistent artifact carried into Week 8.

The Friday task requires correcting a deliberate trace error, so component naming alone cannot pass.

Both student and instructor-notes decks compiled in the campaign validation pass.

**Disposition: 004_d IMPLEMENTED WITH NAMED YELLOWS; 004_e unblocked.**