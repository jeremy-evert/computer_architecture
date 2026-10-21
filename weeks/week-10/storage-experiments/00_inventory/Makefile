CC = gcc
CFLAGS ?= -std=c11 -O2 -Wall -Wextra
.PHONY: all run clean
all: 00_inventory
00_inventory: 00_inventory.c
	$(CC) $(CFLAGS) -DFLAGS='"$(CFLAGS)"' -o $@ $<
run: 00_inventory
	@./00_inventory
clean:
	rm -f 00_inventory
