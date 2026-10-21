CC ?= cc
CFLAGS ?= -std=c11 -O2 -Wall -Wextra
.PHONY: all run clean
all: 07_network
07_network: 07_network.c
	$(CC) $(CFLAGS) -DFLAGS='"$(CFLAGS)"' -o $@ $<
run: 07_network
	./07_network
clean:
	rm -f 07_network
