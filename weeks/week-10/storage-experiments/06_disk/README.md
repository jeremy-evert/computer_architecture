# 06: disk writes and reads

## Question

How do buffering and sync calls change the speed we see when writing a file?

## Prediction

My prediction: ______

## Run

From this directory, run `make`, then `./06_disk`. The default is a 256 MiB file in a fresh `/tmp` directory. To choose a scratch directory and file size in bytes, run `./06_disk /path/to/scratch 268435456`. It creates a uniquely named scratch file, removes it when finished, and removes the directory too if it is empty.

## What to look at

Compare write MB/s for buffered writes, one final `fsync`, and an `fsync` after each 4 MiB chunk. Read rates and the cold/warm ratio follow. The program also reports the average time for each of 2,000 4 KiB writes followed by `fdatasync`.

## Expected shape

Buffered writes may look fast because they mostly copy into the operating system page cache. Syncing waits for the storage stack to accept durable data, so it often lowers throughput; syncing every chunk adds repeated waits. Warm reads often come from cache. The cold read asks the kernel to discard cached pages, then measures another read. There are three measurements per method and a median can be compared from the individual rows.


On april (`../receipts/april/06_disk_run*.txt`, ext4 on an NVMe SSD, 256 MiB): buffered write about 7.2 to 7.3 GB/s, one fsync at the end about 4.0 to 4.4 GB/s, fsync after every 4 MiB about 2.3 GB/s, and a 4 KiB write plus `fdatasync` about 0.7 ms each. Warm read about 17.6 to 18 GB/s (page cache); "cold" read about 6.8 to 7.0 GB/s, a ratio near 2.6. Caveat on that ratio: a cold read at about 7 GB/s is near this SSD's rated speed, so the page cache does look dropped, but without root we cannot prove it. Buffered write speed is mostly the speed of copying into RAM, not of the SSD.

## What would surprise us / falsify the idea

If durable write rates match buffered rates across repeated runs, buffering may not explain much on this machine, or the device may have a fast cache. If the cold read is as fast as the warm read, the cache advice did not create a meaningfully cold read.

## Caveat

The program prints the filesystem type from `statfs` and warns when it recognizes tmpfs. tmpfs is RAM, not disk. `POSIX_FADV_DONTNEED` is a request, and Linux may keep cached pages; the program reports the measured ratio and notes when the cold read is not clearly slower. Rates depend on the filesystem, device cache, and background activity. The scratch file is deleted afterward.
