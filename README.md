# Dtrace scripts for FreeBSD 10.2-RELEASE

## Handy besides dtrace, CPU performance counters
kldload hwpmc
pmcstat -TS instructions -w1
