#!/usr/sbin/dtrace -s

#pragma D option quiet
#pragma D option defaultargs
#pragma D option switchrate=10hz
#pragma D option strsize=1024
#pragma D option dynvarsize=16m

dtrace:::BEGIN
{
        printf("%-20s %-16s %1s %4s %6s %s\n", "TIME", "PROCESS",
            "D", "KB", "ms", "FILE");
        min_ns = $1 * 1000000;
}

fbt::zfs_freebsd_write:entry
{
        self->path = "";
        self->vp = args[0]->a_vp;

        /* Initial lookup */
        self->ncp = self->vp && (&((self->vp)->v_cache_dst)) != NULL ? (&((self->vp)->v_cache_dst))->tqh_first : 0;
        self->path = self->ncp ? strjoin(self->ncp->nc_name != 0 ? stringof(self->ncp->nc_name) : "<unknown>", self->path) : self->path;
        self->vp = self->ncp ? self->ncp->nc_dvp : 0;
        /* Level 2 nesting */
        self->ncp = self->vp && (&((self->vp)->v_cache_dst)) != NULL ? (&((self->vp)->v_cache_dst))->tqh_first : 0;
        self->path = self->ncp ? strjoin(strjoin(self->ncp->nc_name != 0 ? stringof(self->ncp->nc_name) : "<unknown>", "/"), self->path) : self->path;
        self->vp = self->ncp ? self->ncp->nc_dvp : 0;
        /* Level 3 nesting */
        self->ncp = self->vp && (&((self->vp)->v_cache_dst)) != NULL ? (&((self->vp)->v_cache_dst))->tqh_first : 0;
        self->path = self->ncp ? strjoin(strjoin(self->ncp->nc_name != 0 ? stringof(self->ncp->nc_name) : "<unknown>", "/"), self->path) : self->path;
        self->vp = self->ncp ? self->ncp->nc_dvp : 0;
        /* Level 4 nesting */
        self->ncp = self->vp && (&((self->vp)->v_cache_dst)) != NULL ? (&((self->vp)->v_cache_dst))->tqh_first : 0;
        self->path = self->ncp ? strjoin(strjoin(self->ncp->nc_name != 0 ? stringof(self->ncp->nc_name) : "<unknown>", "/"), self->path) : self->path;
        self->vp = self->ncp ? self->ncp->nc_dvp : 0;
        /* Level 5 nesting */
        self->ncp = self->vp && (&((self->vp)->v_cache_dst)) != NULL ? (&((self->vp)->v_cache_dst))->tqh_first : 0;
        self->path = self->ncp ? strjoin(strjoin(self->ncp->nc_name != 0 ? stringof(self->ncp->nc_name) : "<unknown>", "/"), self->path) : self->path;
        self->vp = self->ncp ? self->ncp->nc_dvp : 0;
        /* Level 6 nesting */
        self->ncp = self->vp && (&((self->vp)->v_cache_dst)) != NULL ? (&((self->vp)->v_cache_dst))->tqh_first : 0;
        self->path = self->ncp ? strjoin(strjoin(self->ncp->nc_name != 0 ? stringof(self->ncp->nc_name) : "<unknown>", "/"), self->path) : self->path;
        self->vp = self->ncp ? self->ncp->nc_dvp : 0;
        /* Level 7 nesting */
        self->ncp = self->vp && (&((self->vp)->v_cache_dst)) != NULL ? (&((self->vp)->v_cache_dst))->tqh_first : 0;
        self->path = self->ncp ? strjoin(strjoin(self->ncp->nc_name != 0 ? stringof(self->ncp->nc_name) : "<unknown>", "/"), self->path) : self->path;
        self->vp = self->ncp ? self->ncp->nc_dvp : 0;
        /* Level 8 nesting */
        self->ncp = self->vp && (&((self->vp)->v_cache_dst)) != NULL ? (&((self->vp)->v_cache_dst))->tqh_first : 0;
        self->path = self->ncp ? strjoin(strjoin(self->ncp->nc_name != 0 ? stringof(self->ncp->nc_name) : "<unknown>", "/"), self->path) : self->path;
        self->vp = self->ncp ? self->ncp->nc_dvp : 0;
        /* Level 9 nesting */
        self->ncp = self->vp && (&((self->vp)->v_cache_dst)) != NULL ? (&((self->vp)->v_cache_dst))->tqh_first : 0;
        self->path = self->ncp ? strjoin(strjoin(self->ncp->nc_name != 0 ? stringof(self->ncp->nc_name) : "<unknown>", "/"), self->path) : self->path;
        self->vp = self->ncp ? self->ncp->nc_dvp : 0;
        /* Level 10 nesting */
        self->ncp = self->vp && (&((self->vp)->v_cache_dst)) != NULL ? (&((self->vp)->v_cache_dst))->tqh_first : 0;
        self->path = self->ncp ? strjoin(strjoin(self->ncp->nc_name != 0 ? stringof(self->ncp->nc_name) : "<unknown>", "/"), self->path) : self->path;
        self->vp = self->ncp ? self->ncp->nc_dvp : 0;
        /* Level 11 nesting */
        self->ncp = self->vp && (&((self->vp)->v_cache_dst)) != NULL ? (&((self->vp)->v_cache_dst))->tqh_first : 0;
        self->path = self->ncp ? strjoin(strjoin(self->ncp->nc_name != 0 ? stringof(self->ncp->nc_name) : "<unknown>", "/"), self->path) : self->path;
        self->vp = self->ncp ? self->ncp->nc_dvp : 0;
        /* Level 12 nesting */
        self->ncp = self->vp && (&((self->vp)->v_cache_dst)) != NULL ? (&((self->vp)->v_cache_dst))->tqh_first : 0;
        self->path = self->ncp ? strjoin(strjoin(self->ncp->nc_name != 0 ? stringof(self->ncp->nc_name) : "<unknown>", "/"), self->path) : self->path;
        self->vp = self->ncp ? self->ncp->nc_dvp : 0;
        /* Level 13 nesting */
        self->ncp = self->vp && (&((self->vp)->v_cache_dst)) != NULL ? (&((self->vp)->v_cache_dst))->tqh_first : 0;
        self->path = self->ncp ? strjoin(strjoin(self->ncp->nc_name != 0 ? stringof(self->ncp->nc_name) : "<unknown>", "/"), self->path) : self->path;
        self->vp = self->ncp ? self->ncp->nc_dvp : 0;
        /* Level 14 nesting */
        self->ncp = self->vp && (&((self->vp)->v_cache_dst)) != NULL ? (&((self->vp)->v_cache_dst))->tqh_first : 0;
        self->path = self->ncp ? strjoin(strjoin(self->ncp->nc_name != 0 ? stringof(self->ncp->nc_name) : "<unknown>", "/"), self->path) : self->path;
        self->vp = self->ncp ? self->ncp->nc_dvp : 0;
        /* Level 15 nesting */
        self->ncp = self->vp && (&((self->vp)->v_cache_dst)) != NULL ? (&((self->vp)->v_cache_dst))->tqh_first : 0;
        self->path = self->ncp ? strjoin(strjoin(self->ncp->nc_name != 0 ? stringof(self->ncp->nc_name) : "<unknown>", "/"), self->path) : self->path;
        self->vp = self->ncp ? self->ncp->nc_dvp : 0;

        /* Add mount point */
        self->path = args[0]->a_vp->v_mount ? strjoin(strjoin(stringof(args[0]->a_vp->v_mount->mnt_stat.f_mntonname), "/"), self->path) : self->path;

        self->kb = args[0]->a_uio->uio_resid / 1024;
        self->start = timestamp;
}

fbt::zfs_freebsd_write:return
/self->start && (timestamp - self->start) >= min_ns/
{
        self->iotime = (timestamp - self->start) / 1000000;
        self->dir = probefunc == "zfs_freebsd_read" ? "R" : "W";
        printf("%-20Y %-16s %1s %4d %6d %s\n", walltimestamp,
            execname, self->dir, self->kb, self->iotime,
            self->path != NULL ? stringof(self->path) : "<null>");
}

fbt::zfs_freebsd_write:return
{
        self->path = 0; self->kb = 0; self->start = 0; self->vp = 0; self->ncp = 0; self->iotime = 0; self->dir = 0;
}
