# code-ladder (Week 10)

The same job (sum 1,000,000 integers) written at different levels, to see what each level costs.

- `sum_array.py`: Python, one interpreted loop.
- `sum_array.c`: the same loop in C. Build: `gcc -O0 -o sum_array sum_array.c` (and `gcc -O3 -o sum_array_o3 sum_array.c`).
- `sum_array.s`: the assembly `gcc -S` produced, to read the loop at the instruction level.
- Generated binaries and `cachegrind.out.*` are ignored; regenerate with `valgrind --tool=cachegrind ./sum_array`.

Measured on morgan (WSL2). Describe regions and shapes, never claim exact cache sizes (Week 10 overclaim rule).
