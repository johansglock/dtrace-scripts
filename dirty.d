#!/usr/sbin/dtrace -s

#pragma D option quiet

BEGIN
{
    printf("Monitoring TXG syncs (dirty data) for %s\n", $$1)
}

txg-syncing
{
        this->dp = (dsl_pool_t *)arg0;
}

txg-syncing
/this->dp->dp_spa->spa_name == $$1/
{
        printf("%Y : %4dKB of %4dMB used\n", walltimestamp, this->dp->dp_dirty_total / 1024,
            `zfs_dirty_data_max / 1024 / 1024);
}
