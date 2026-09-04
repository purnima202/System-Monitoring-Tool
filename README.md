# System Monitoring Tool

A Bash script that monitors key Linux system resources and alerts when predefined thresholds are crossed. Simulates basic monitoring automation used in DevOps operations.

## Features

* **Disk usage monitoring** — checks disk usage and alerts if it crosses the configured threshold.
* **Memory usage monitoring** — checks memory usage against a configured threshold.
* **CPU usage monitoring** — checks CPU usage against a configured threshold.
* **Top CPU-consuming processes** — displays the top 5 processes consuming CPU.
* **Top memory-consuming processes** — displays the top 5 processes consuming memory.
* **Error handling** — checks whether monitoring commands execute successfully.
* **Timestamped logging** — saves monitoring output to a log file with timestamps.

## Usage

Make the script executable:

```bash
chmod +x system_monitor.sh
```

Run the monitoring script:

```bash
./system_monitor.sh
```

## Configuration

Monitoring thresholds are configured inside the script:

```bash
DISK_THRESHOLD=80
MEMORY_THRESHOLD=80
CPU_THRESHOLD=80
```

The values represent percentage thresholds.

## Logging

The script saves monitoring output to:

```text
system_monitor.log
```

The log file is excluded from Git using `.gitignore` because it is generated runtime data.

## Sample Output

```text
===== System Monitoring Started: 2026-09-04 14:30:15 =====

Disk Usage is : 38
OK: Disk usage is at 38%

Memory Usage is : 11
OK: Memory usage is at 11%

CPU Usage is : 5
OK: CPU usage is at 5%

Top 5 CPU-consuming processes:
USER       PID  %CPU  %MEM  COMMAND
...

Top 5 Memory-consuming processes:
USER       PID  %CPU  %MEM  COMMAND
...
```

## Technologies Used

* Linux
* Bash Shell Scripting
* Git
* GitHub

## DevOps Concepts Practiced

* Linux system monitoring
* Bash scripting
* Variables and conditional statements
* Command substitution
* Pipes and text processing
* Exit status and error handling
* Process monitoring
* Logging
* Git branching
* Git merge conflict resolution
* GitHub SSH authentication

## Project Purpose

This project was created as a hands-on DevOps practice project to understand Linux system monitoring, Bash scripting, Git workflows, and basic monitoring automation.
