# 07: round-trip distance

## Question

How much time does a request and reply take inside one process, between processes, and over loopback TCP?

## Prediction

My prediction: ______

## Run

Run `make` then `./07_network` for the local measurements. The optional client mode requires both explicit flags: `./07_network --host server-name-or-address --port 9000`. Start a server separately with `./07_network --serve --port 9000`; it binds only to `127.0.0.1`. For a controlled remote demonstration, add `--bind` followed by the server machine’s IPv4 address on the intended interface. The server accepts four connections from one benchmark client process (one warm-up and three timed trials). Remote mode is never selected implicitly.

## What to look at

The in-process method performs 100,000,000 function calls per trial so its timed region is long enough to measure. Pipes and TCP each perform 100,000 one-byte round trips. All methods have three timed trials and a median; the output reports nanoseconds per call or round trip. Compare nanoseconds per call for the function pointer and nanoseconds per round trip for pipes and TCP. The optional server is intended for an instructor-controlled second machine; the client resolves IPv4 hostnames and addresses.

## Expected shape

An in-process call should usually be cheapest. Pipes add process scheduling and kernel communication. Loopback TCP adds protocol processing. Repeated trials show how scheduling and other activity move the measurements.


On april (`../receipts/april/07_network_run*.txt`): an in-process call costs about 0.6 ns (a few cycles; read it as "under a nanosecond"); a round trip through two pipes between two processes about 2.7 microseconds; a loopback TCP round trip about 6.5 to 6.8 microseconds. Only the ordering and the thousands-of-times gap should be trusted. No second machine was used.

## What would surprise us / falsify the idea

If pipes or TCP appear faster than the function call, noise, scheduling, or timer effects may dominate this run. Re-run and compare medians. Similar loopback and pipe times do not show that a real network has no cost.

## Caveat

No student data is sent. Loopback is not a real network: there is no wire, switch, or remote machine. A real second machine adds a distance floor because information cannot travel faster than light, plus routing and queueing delays. Timings include OS scheduling and TCP stack work.
