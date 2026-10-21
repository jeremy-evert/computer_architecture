# 07: round-trip distance

## Question

How much time does a request and reply take inside one process, between processes, and over loopback TCP?

## Prediction

My prediction: ______

## Run

Run `make` then `./07_network` for the local measurements. The optional client mode requires both explicit flags: `./07_network --host server-name-or-address --port 9000`. Start a server separately with `./07_network --serve --port 9000`. The server accepts four connections from one benchmark client process (one warm-up and three timed trials). Remote mode is never selected implicitly.

## What to look at

Each method performs 100,000 one-byte round trips, with three timed trials and a median. Compare nanoseconds per round trip for the function pointer, two processes connected by pipes, and TCP. The optional server is intended for an instructor-controlled second machine; the client resolves IPv4 hostnames and addresses.

## Expected shape

An in-process call should usually be cheapest. Pipes add process scheduling and kernel communication. Loopback TCP adds protocol processing. Repeated trials show how scheduling and other activity move the measurements.


On april (`../receipts/april/07_network_run*.txt`): an in-process call costs about 1 ns (0.7 to 1.4 ns; below the timer's useful precision, so read it as "about a nanosecond"); a round trip through two pipes between two processes about 2.6 to 2.7 microseconds; a loopback TCP round trip about 6.6 to 6.8 microseconds. Only the ordering and the thousands-of-times gap should be trusted. No second machine was used.

## What would surprise us / falsify the idea

If pipes or TCP appear faster than the function call, noise, scheduling, or timer effects may dominate this run. Re-run and compare medians. Similar loopback and pipe times do not show that a real network has no cost.

## Caveat

No student data is sent. Loopback is not a real network: there is no wire, switch, or remote machine. A real second machine adds a distance floor because information cannot travel faster than light, plus routing and queueing delays. Timings include OS scheduling and TCP stack work.
