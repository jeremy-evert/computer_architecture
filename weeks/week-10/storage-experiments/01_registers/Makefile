CC = gcc
CFLAGS = -std=c11 -O2 -Wall -Wextra

.PHONY: all run clean asm
all: 01_registers
01_registers: 01_registers.c
	$(CC) $(CFLAGS) -o $@ $<
run: 01_registers
	@./01_registers
asm:
	$(CC) -std=c11 -S -O2 -Wall -Wextra 01_registers.c -o 01_registers.s
clean:
	rm -f 01_registers 01_registers.s
