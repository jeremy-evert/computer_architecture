# tools

Helpers that are not experiments. Nothing here is built by the top-level `make`.

## cost_ladder.py

A rough map of the memory/storage layer cake: typical latency against dollars per GB.
The latencies are order-of-magnitude teaching values, not measurements; replace them
with your own numbers from `03_working_set` and `06_disk`. Prices are a dated snapshot
(the date is in the script and in the output).

Run it from this folder, because it writes its outputs into the current directory:

```
cd tools
./cost_ladder.py --cpu-price 120
```

It prints the table, writes `cost_ladder.csv`, and writes `cost_ladder.png` if
`matplotlib` is installed (`sudo apt install python3-matplotlib`). Both outputs are
git-ignored (`tools/.gitignore`).
