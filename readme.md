# physmem

This repo is the version of module cloned from  linux/drivers/char/mem.c and compatible at least 
with kernel version 4.6

The module was modified to allow access to all physical
memory without rebuilding the whole kernel (w/ disabled CONFIG_STRICT_DEVMEM).

This module creates /dev/physmem device working similar 
to /dev/mem but without restriction on any memory
access.
