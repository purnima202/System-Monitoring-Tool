#!/bin/bash
#system_monitor.sh
#This scripts monitors disk usage, memory usage and top resources consuming processes

set -o pipefail
echo "System Monitoring script starting...."

#Disk Monitoring
DISK_THRESHOLD=80
disk_usage=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')
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

#CPU Monitoring
CPU_THRESHOLD=80
cpu_usage=$(top -bn1 | grep "Cpu(S)" | awk '{print (100-$8)}' | cut -d. -f1)
echo "CPU Usage is : $cpu_usage"

if [ "$cpu_usage" -ge "$CPU_THRESHOLD" ]; then
    echo "ALERT: CPU usage is at ${cpu_usage}% , threshold is at ${CPU_THRESHOLD}%"
else
    echo "OK: CPU usage is at ${cpu_usage}%"
fi