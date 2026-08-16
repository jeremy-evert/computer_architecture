.globl _start
_start:
    addi a0, x0, 4
    jal  ra, transform
    addi a1, a0, 0
    ebreak
