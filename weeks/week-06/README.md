# Week 6 - Bits Become Instructions

> **Central machine question:** What must software and hardware agree on for a program to run?

## Week at a Glance

**Prior belief we are testing:** source code has one obvious meaning all the way down.

**Prediction before evidence:** for `transform(4)`, predict the final return value and name one place where width, signedness, encoding, or register convention matters.

**AI Fluency:** Lens 6 - Engineer the Prompt.  
**Professional Minds:** Wednesday - *Statistics Done Wrong*; Friday - *Understanding Statistics and Experimental Design*.  
**Checkpoint:** Machine Dossier Checkpoint 1.

| Day | Mode | What happens | Evidence |
|---|---|---|---|
| Monday | Think / Frame | Meaning becomes fixed-width bits; instructions are encoded agreements. | prediction + representation model |
| Wednesday | Investigate | Run the bounded RV32I specimen and connect source, disassembly, and register state. | `riscv-receipt.json` + disassembly |
| Friday | Explain / Defend | Defend how one operation survives the trip into machine state and state the model's limit. | bounded evidence receipt |

## Continuity

The Week 5 machine remains the **workload/design context**. Week 6 starts the persistent Weeks 6-9 **ISA teaching context** using one course-owned specimen:

```c
int transform(int x) {
    int y = x + 2;
    if (y > 5) {
        y = y * 3;
    }
    return y;
}
```

Do not imply that a student's proposed desktop literally becomes a RISC-V physical machine. RISC-V is the clean lens we use to inspect the ISA contract.

## Machine Dossier handoff

**Action: ADD**

Add a compact representation/ISA trace and Checkpoint 1 evidence. Do not add binary-conversion worksheets to the dossier.

## Student path

1. Work through [`monday.md`](monday.md) and record the prediction before running the lab.
2. Complete [`wednesday.md`](wednesday.md).
3. Complete [`friday.md`](friday.md).
4. Complete [`checkpoint.md`](checkpoint.md) using the same evidence.
5. Use [`references.md`](references.md) to verify/deepen claims.

## Equity / required path

CPU-only, zero-cost, no paid AI, no premium agent, no GPU, no private infrastructure. The course-owned RV32I path is deliberately bounded so no QEMU/Spike/RARS installation is required.

## Scope

Teach binary/hex, fixed width, signedness, overflow, a humane floating-point taste, RV32I basics, bounded instruction encoding, and the ABI details the specimen actually exposes. Do not turn this into Digital Logic or Compiler Construction.