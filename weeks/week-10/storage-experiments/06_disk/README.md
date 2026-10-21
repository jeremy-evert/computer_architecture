# 06: disk writes and reads

Linux only (WSL2 works).

## Question

How do buffering and sync calls change the speed we see when writing a file?

## Prediction

My prediction: ______

## Run

From this directory, run `make`, then `./06_disk`. The default is a 256 MiB file in a fresh `/tmp` directory. To choose a scratch directory and file size in bytes, run `./06_disk /path/to/scratch 268435456`. It creates a uniquely named scratch file and removes it when finished. A directory you provide is never removed; the program removes its own temporary directory when it created one.

## What to look at

Compare write MB/s for buffered writes, one final `fsync`, and an `fsync` after each 4 MiB chunk. Read rates and the post-`posix_fadvise`/warm ratio follow. Each row includes an advice status; if the kernel rejects the request, that read is labeled `advice_failed_not_cold` and must not be interpreted as a cold read. The program also reports the average time for each of 2,000 4 KiB writes followed by `fdatasync`.

## Expected shape

Buffered writes may look fast because they mostly copy into the operating system page cache. Syncing waits for the storage stack to accept durable data, so it often lowers throughput; syncing every chunk adds repeated waits. Warm reads often come from cache. The post-advice read asks the kernel to discard cached pages, then measures another read; if the advice call fails, its status marks that row as not a cold read. There are three `trial` rows per method, each followed by a `median` row (the median of each column; the `trial` field is empty there). Every data row has the same eight fields, and the first, `kind`, is `trial` or `median`. On a `median` row the ratio is the median of the three per-trial ratios, and `advice_status` is `advice_accepted` only if all three trials were accepted.


On april (`../receipts/april/06_disk_run*.txt`, ext4 on an NVMe SSD, 256 MiB): buffered write about 7.3 to 7.4 GB/s, one fsync at the end about 4.0 to 4.4 GB/s, fsync after every 4 MiB about 2.2 to 2.4 GB/s, and a 4 KiB write plus `fdatasync` about 0.7 ms each. Warm read about 17.7 to 18 GB/s (page cache); read after `posix_fadvise(DONTNEED)` ("cold", column `post_fadvise_read_MB_s`) about 6.9 to 7.0 GB/s, a ratio near 2.6 (advice was accepted in every row). Caveat on that ratio: a cold read at about 7 GB/s is near this SSD's rated speed, so the page cache does look dropped, but without root we cannot prove it. Buffered write speed is mostly the speed of copying into RAM, not of the SSD.

### How to read this output
Sample (ext4 home directory on a WSL2 machine, 32 MiB; your numbers will differ):

```
kind,trial,method,write_MB_s,warm_read_MB_s,post_fadvise_read_MB_s,post_fadvise_warm_ratio,advice_status
trial,1,buffered,4575.18,9326.88,1545.12,6.036,advice_accepted
trial,2,buffered,4339.73,10530.50,1840.89,5.720,advice_accepted
trial,3,buffered,3906.99,9408.74,1721.46,5.466,advice_accepted
median,,buffered,4339.73,9408.74,1721.46,5.720,advice_accepted
median,,one_fsync,930.64,10945.81,1545.53,7.234,advice_accepted
```

The one number to look at is `write_MB_s` on the `median` rows: buffered versus `one_fsync` versus `fsync_each_4MiB`. The gap between buffered and synced writes is the price of "safely written".

## What would surprise us / falsify the idea

If durable write rates match buffered rates across repeated runs, buffering may not explain much on this machine, or the device may have a fast cache. If the cold read is as fast as the warm read, the cache advice did not create a meaningfully cold read.

## Caveat

The program prints the filesystem type from `statfs` and warns when it recognizes tmpfs. tmpfs is RAM, not disk. `POSIX_FADV_DONTNEED` is a request, and Linux may keep cached pages; the program reports when the call fails and notes when an accepted request still does not make the read clearly slower. Rates depend on the filesystem, device cache, and background activity. The scratch file is deleted afterward.

On WSL2, your home directory (`~`) is ext4 on a virtual disk, but `/mnt/c`, `/mnt/d` and other `/mnt/<letter>` paths are Windows drives shared over 9p. The program names 9p and prints a warning there: speed is often limited by the file-sharing layer, and `post_fadvise` reads may not be cold (on one WSL2 machine they matched warm reads at about 250 MB/s).
