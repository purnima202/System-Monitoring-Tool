#!/bin/bash
#system_monitor.sh
#This scripts monitors disk usage, memory usage and top resources consuming processes

set -o pipefail
echo "System Monitoring script starting...."

#Disk Monitoring
DISK_THRESHOLD=80
disk_usage=$(df -h | grep -v Filesystem | awk '{print $6}' | tr -d '%')
echo "Disk Usage is : $disk_usage"

if [ "$disk_usage" -ge "$DISK_THRESHOLD" ]; then
    echo "ALERT: Disk usage is at ${disk_usage}% , threshold is at ${DISK_THRESHOLD}%"
else
    echo "OK: Disk usage is at ${disk_usage}%"
fi

#Memory Monitoring
MEMORY_THRESHOLD=80
memory_usage=$(free | grep Mem | awk '{print ($3/$2*100)}' | cut -d. -f1)
echo "Memory Usage is : $memory_usage"

if [ "$memory_usage" -ge "$MEMORY_THRESHOLD" ]; then
    echo "ALERT: Memory usage is at ${memory_usage}% , threshold is at ${MEMORY_THRESHOLD}%"
else
    echo "OK: Memory usage is at ${memory_usage}%"
fi