# Week 9 Monday - Follow the Program Down

## Question

> **Can I follow one small program through the stack without losing the evidence chain?**

## Integration is an evidence problem

A source statement, a disassembly line, a register-state receipt, a datapath trace, and a performance plot answer **different** questions. Integration means connecting them without claiming that one artifact proves all the others.

## Persistent specimen

The same `transform()` function remains the object. Nothing new to decipher.

## Layer map

1. source meaning;
2. fixed-width representation;
3. compiler output / RV32I instruction;
4. architectural register/memory state;
5. bounded datapath/control meaning;
6. dependency/performance implication;
7. resulting program behavior.

For every arrow ask: **what artifact lets another person verify this handoff?**

## Boundaries

- You do not explain compiler optimization passes.
- The Week 7 datapath is not suddenly cycle accurate.
- The Week 8 native timing is not welded into a fake exact CPI for the RV32I interpreter.

## AI Fluency

Have AI generate a candidate trace, diagram, or explanation. Mark unsupported handoffs and scope mismatches. Your job is to **repair the chain with evidence**.

## Checkpoint strategy

Reuse evidence, repair gaps, and write one coherent narrative. Bigger is not better; connected is better.