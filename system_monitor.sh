#!/bin/bash
#system_monitor.sh
#Thos scripts monitors disk usage, memory usage and top resources consuming processes

set -o pipefail
echo "System Monitoring script starting...."

DISK_THRESHOLD=80
disk_usage=$(df -h | grep -v Filesystem | awk '{print $6}' | tr -d '%')
echo "Disk Usage is : $disk_usage"

if [ "$disk_usage" -ge "$DISK_THRESHOLD" ]; then
    echo "ALERT: Disk usage is at ${disk_usage}% , threshold is at ${DISK_THRESHOLD}%"
else
    echo "OK: Disk usage is at ${disk_usage}%"
fi
