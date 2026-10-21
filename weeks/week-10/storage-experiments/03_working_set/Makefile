CC = gcc
CFLAGS ?= -std=c11 -O2 -Wall -Wextra
.PHONY: all run clean
all: 03_working_set
03_working_set: 03_working_set.c
	$(CC) $(CFLAGS) -DFLAGS='"$(CFLAGS)"' -o $@ $<
run: 03_working_set
	@./03_working_set
clean:
	rm -f 03_working_set
