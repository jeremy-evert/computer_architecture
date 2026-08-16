# Week 11 Wednesday - Observe the useful lie

## Professional Minds

*Software Project Management*. Let the strand coexist; do not force a page-table/project-management metaphor.

## Linux/WSL live observations

```bash
getconf PAGESIZE
cat /proc/self/maps
```

Use a short excerpt only.

## Procedure

1. Record the visible page size or use the course fallback context.
2. Capture a short `/proc/self/maps` excerpt.
3. For two representative mappings identify range, permissions, and file-backed path if visible.
4. Label which facts are **direct observations**.
5. Work one small virtual-address split into virtual page number + offset.
6. Explain which VM mechanisms are models/inferences: page table, TLB, protection, privilege.
7. Compare two process/mapping examples and explain why similar virtual ranges do not prove shared physical state.
8. Verify one AI claim against Linux kernel documentation or the RISC-V privileged specification.
9. Revise the Week 10 memory model.

## Overclaim warning

Do not claim `/proc/<pid>/maps` reveals exact physical frames, cache residency, or universal OS behavior. Do not require `/proc/pagemap`, root, or privileged tracing.

## Fallback

Use the course-owned process-map/translation trace on unsupported platforms. Same observation/inference/limitation task and grading ceiling.