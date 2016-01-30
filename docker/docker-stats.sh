#!/bin/bash


#ls /sys/fs/cgroup/cpu/docker/ -l | grep "^d" | rev | awk '{print $1}' | rev

function memory_stat() {
    container=$1
    pids=`cat /sys/fs/cgroup/cpu/docker/${container}/cgroup.procs`
    pids=`echo $pids | tr " " "|"`
    ps aux | awk "\$2 ~ \"^($pids)\$\" {SUM += \$6} END {print SUM}"

}

