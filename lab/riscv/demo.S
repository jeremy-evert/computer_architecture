.globl _start
_start:
    addi a0, x0, 7
    addi a1, x0, 5
    add  a2, a0, a1
    addi a3, a2, 3
    ebreak
