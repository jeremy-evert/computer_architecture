CC = gcc
CFLAGS ?= -std=c11 -O2 -Wall -Wextra
.PHONY: all run clean
all: 02_cache_line_stride
02_cache_line_stride: 02_cache_line_stride.c
	$(CC) $(CFLAGS) -DFLAGS='"$(CFLAGS)"' -o $@ $<
run: 02_cache_line_stride
	@./02_cache_line_stride
clean:
	rm -f 02_cache_line_stride
