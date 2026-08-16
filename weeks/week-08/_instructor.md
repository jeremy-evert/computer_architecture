# Week 8 instructor / recording plan

Start with Week 7's correct one-instruction path, then overlap several instructions. Use one five-stage timing diagram, one hazard/forwarding example, and the native dependency experiment.

## Canonical path

```bash
./lab/bin/archlab run dependency --updates 12000000 --out-dir dossier/evidence/week08-dependency
./lab/bin/archlab plot dependency dossier/evidence/week08-dependency/dependency.csv --out dossier/evidence/week08-dependency/dependency.png
```

Prompt 003 reference observation: about 1.10 ns/update dependent versus 0.273 ns/update independent4 on that surface. Do not present those as expected student values.

## Stack Showcase

Use profiler/timing plus compiler/disassembly on a real workload. Optional hardware counters are instructor evidence only.