CC = gcc
CFLAGS ?= -std=c11 -O2 -Wall -Wextra

.PHONY: all run clean
all: 04_sequential_vs_random

04_sequential_vs_random: 04_sequential_vs_random.c
	$(CC) $(CFLAGS) -o $@ $<

run: 04_sequential_vs_random
	./04_sequential_vs_random

clean:
	rm -f 04_sequential_vs_random
