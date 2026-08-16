# Instructor plan - Week 5: Build the Machine

This file is not student-facing by default.

## Monday recording spine

**Target shape:** about 20-30 minutes of deliberate explanation, not a shopping livestream.

1. Open with the machine question: “What should I build for this workload?”
2. Put a seductive spec sheet / “bigger numbers” instinct on screen.
3. Flip the order: workload -> constraint -> resource -> component.
4. Walk the bounded compatibility checklist.
5. Introduce capacity vs latency vs bandwidth without numerical memorization.
6. Work the synthetic CPU A/CPU B $/core example and show how correct arithmetic creates a weak conclusion.
7. Show the $1,500 budget-share idea.
8. Model one controlled $150 reallocation.
9. Use AI/model disagreement as a hypothesis generator, then verify one exact spec claim against a manufacturer page.
10. Stop with the Wednesday prediction. Do not reveal “the best build.”

**Live tools / demonstrations:** browser + one current manufacturer spec page + optional AI recommendation comparison + course repository.

**AI/tool verification moment:** ask for two recommendations under different workload framing. Pick one confident spec/compatibility claim and verify it independently rather than debating rhetoric.

**Likely editing/capture needs:** browser zoom readable; avoid showing private accounts or checkout carts; use a deliberately synthetic arithmetic example on slides so recorded prices do not become doctrine.

## Wednesday canonical run

The shopping/design portion is browser-based and current by design. The executable course tool is the Observatory.

From repository root:

```bash
rm -rf /tmp/week05-archprobe
./lab/bin/archprobe --out-dir /tmp/week05-archprobe
cat /tmp/week05-archprobe/machine.txt
python3 -m json.tool /tmp/week05-archprobe/machine.json | head -120
```

**Expected shape, not exact values:**

- a privacy-safe JSON receipt plus friendly text summary;
- explicit evidence scope (`host-visible`, `WSL-visible`, `container-visible`, or other limited scope);
- CPU/architecture, visible processor topology, memory, cache records where exposed, visible storage scope, accelerator presence/absence with caveat.

**Known noise/failure modes:**

- container/WSL visibility differs from physical-host inventory;
- physical storage model may not be exposed;
- accelerator absence is not proof the physical host lacks one;
- non-Linux paths remain platform YELLOW until 004_m validation;
- builder sites may change UI or block automation.

**Fallback receipt:** `lab/fallback_data/week05-machine-reference.json` plus companion text summary.

## Friday Stack Showcase

**Course question:** What should I build for this workload, what does each part buy me, and what did I trade away?

**Preferred real system:** the STF 320 Windows machine (“Bill”).

**Why Bill:** it is an ordinary real instructional machine with institutional/use-case constraints, not a trophy build. That makes compromise visible.

**Evidence/action demonstrated:**

1. inventory what the machine actually exposes;
2. identify CPU, memory, storage and accelerator/graphics path;
3. reconstruct or estimate the workload/design intention;
4. ask where the budget or institutional constraints appear to have gone;
5. identify one choice that makes sense and one choice we would question today;
6. distinguish current market replacement price from the architecture properties already present.

**Connection to the student investigation:** same workload -> constraint -> compatibility -> budget allocation -> evidence -> limitation grammar.

**Intentionally beyond the required student path:** physical access to STF hardware, any administrator credentials, paid AI/frontier tools used in the recording, and any internal procurement history.

**One takeaway:** a real computer is a history of decisions. Architecture starts when we can explain what those decisions bought and what they made harder.

### Recording prerequisite / YELLOW

Before recording, capture a current STF 320 Bill inventory. If that machine is unavailable or produces a poor demonstration, use April as the backup system and keep the same intellectual grammar.

This hardware capture blocks the final showcase recording, **not** the student-facing Week 5 package.
