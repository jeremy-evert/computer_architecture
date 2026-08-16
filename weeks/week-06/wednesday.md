# Week 6 Wednesday - Investigate / Break / Measure

> **Question:** What must software and hardware agree on for a program to run?

## Professional Minds

*Statistics Done Wrong*. Use the strand to improve evidence interpretation, not to create a second assignment.

## Experimental grammar

**Predict -> Perturb -> Run -> Measure -> Visualize -> Explain -> Revise**

## Supported path

```bash
./lab/bin/archlab run riscv --out-dir dossier/evidence/week06-riscv
```

## Expected evidence

- `dossier/evidence/week06-riscv/riscv-receipt.json`
- `dossier/evidence/week06-riscv/source-to-cpu.disassembly.txt`

## Procedure

1. Predict `transform(4)` and identify where you expect the result to appear.
2. Run the supported RV32I path.
3. Locate enough of `transform` in the disassembly to connect source operations to instruction behavior.
4. Use `riscv-receipt.json` to confirm final architectural state.
5. Explain one interpretation example such as 8-bit `0xff` unsigned versus signed.
6. Inspect one 32-bit instruction encoding and identify the opcode and the operand/register fields requested by the course. Do not encode the whole program by hand.
7. Revise the original explanation.
8. State explicitly what the interpreter proves and what it does not prove.

## Overclaim warning

The interpreter proves bounded architectural instruction/state behavior. It does not prove cycle timing, pipeline depth, cache behavior, or the implementation of a modern CPU.

## Fallback

If the live path is unavailable, use the validated course RISC-V receipt/trace and complete the same reasoning task. Same grading ceiling.

## Dossier handoff

**ADD** the compact representation/ISA trace and Checkpoint 1 evidence.