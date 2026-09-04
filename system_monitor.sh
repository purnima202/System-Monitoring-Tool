#!/bin/bash
#system_monitor.sh
#This scripts monitors disk usage, memory usage and top resources consuming processes

set -o pipefail
LOG_FILE="system_monitoring.log"
exec > >(tee -a "$LOG_FILE") 2>&1
echo "======= System Monitoring Started: $(date '+%y-%m-%d %H:%M:%S') ======="

#Disk Monitoring
DISK_THRESHOLD=80
disk_usage=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')

if [ $? -ne 0 ]; then
	echo "ERROR: Failed to check disk usage"
	exit 1
fi

echo "Disk Usage is : $disk_usage"

if [ "$disk_usage" -ge "$DISK_THRESHOLD" ]; then
    echo "ALERT: Disk usage is at ${disk_usage}% , threshold is at ${DISK_THRESHOLD}%"
else
    echo "OK: Disk usage is at ${disk_usage}%"
fi

#Memory Monitoring
MEMORY_THRESHOLD=80
memory_usage=$(free | grep Mem | awk '{print ($3/$2*100)}' | cut -d. -f1)

if [ $? -ne 0 ]; then
	echo "ERROR: Failed to check memory usage"
	exit 1
fi

echo "Memory Usage is : $memory_usage"

if [ "$memory_usage" -ge "$MEMORY_THRESHOLD" ]; then
    echo "ALERT: Memory usage is at ${memory_usage}% , threshold is at ${MEMORY_THRESHOLD}%"
else
    echo "OK: Memory usage is at ${memory_usage}%"
fi

#CPU Monitoring
CPU_THRESHOLD=80
cpu_usage=$(top -bn1 | grep "Cpu" | awk '{print (100-$8)}' | cut -d. -f1)

if [ $? -ne 0 ]; then
	echo "ERROR: Failed to check cpu usage"
	exit 1
fi

echo "CPU Usage is : $cpu_usage"

if [ "$cpu_usage" -ge "$CPU_THRESHOLD" ]; then
    echo "ALERT: CPU usage is at ${cpu_usage}% , threshold is at ${CPU_THRESHOLD}%"
else
    echo "OK: CPU usage is at ${cpu_usage}%"
fi

#top CPU-consuming processes
echo "Top 5 CPU-consuming processes"
ps aux --sort=-%cpu | head -n 6
