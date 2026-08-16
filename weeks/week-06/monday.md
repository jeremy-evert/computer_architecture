# Week 6 Monday - Bits Become Instructions

## The machine question

> **What must software and hardware agree on for a program to run?**

### Prediction before evidence

> For `transform(4)`, predict the final return value and name one place where width, signedness, encoding, or register convention matters.

Record the prediction before Wednesday. Being wrong is useful if the correction is evidence-backed.

## Meaning needs a representation

Humans reason about values and operations. Hardware stores fixed-width bit patterns. Interpretation decides whether the same bits represent an unsigned integer, signed integer, instruction, or bytes.

## Fixed width is a constraint

Use a few 8-bit examples to make signed/unsigned interpretation and overflow visible, then move to RV32I's 32-bit integer-register world. For example, `0xff` can be 255 under an 8-bit unsigned interpretation and -1 under an 8-bit two's-complement interpretation. The bits did not change; the interpretation did.

## Hex is a viewing tool

Hex compresses long bit strings and aligns with four-bit groups. Students only need enough binary/hex fluency to read evidence, not a conversion marathon.

## The persistent specimen

```c
int transform(int x) {
    int y = x + 2;
    if (y > 5) {
        y = y * 3;
    }
    return y;
}
```

The laboratory's source-to-CPU case runs this specimen with input 4 and expects `x10/a0 = 18`, preserving the same result in `x11/a1 = 18`.

## Instructions are encoded agreements

An instruction identifies an operation and operands in a format the processor agrees to decode. Inspect real RV32I disassembly and one or two bounded encodings; do not memorize the entire opcode map.

## ABI only where it earns its keep

Introduce `a0/x10` as the return-value register because the specimen makes it observable. Save deeper calling-convention detail for Week 9.

## Floating point gets a taste, not the week

Many decimal fractions are approximations in binary floating point. The learning goal is that representation is a contract with tradeoffs, not manual IEEE-754 archaeology.

## Scope

The course-owned interpreter proves architectural instruction/state behavior for a bounded RV32I subset. It is deliberately **not cycle accurate** and does not establish pipeline, cache, or modern superscalar behavior.

## AI Fluency move

**Lens 6 - Engineer the Prompt.** Ask for an explanation, identify vague claims, rewrite the prompt around the exact specimen/value, then verify against disassembly and state.

## Wednesday handoff

Monday ends when you can name the model you believe, the exact specimen/value being tested, and the evidence that could force revision.