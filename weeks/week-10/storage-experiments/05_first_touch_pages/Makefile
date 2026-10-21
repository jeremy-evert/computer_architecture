CC = gcc
CFLAGS ?= -std=c11 -O2 -Wall -Wextra

.PHONY: all run clean
all: 05_first_touch_pages

05_first_touch_pages: 05_first_touch_pages.c
	$(CC) $(CFLAGS) -o $@ $<

run: 05_first_touch_pages
	./05_first_touch_pages

clean:
	rm -f 05_first_touch_pages
