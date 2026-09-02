# System Monitoring Tool

A Bash script that monitors key system resources and alerts when
predefined thresholds are crossed. Simulates basic monitoring automation
used in DevOps operations.

## Features (so far)

- **Disk usage monitoring** — checks disk usage and prints an alert if it
  crosses a configurable threshold (default: 80%).

## Usage

```bash
chmod +x system_monitor.sh
./system_monitor.sh
```

## Configuration

Threshold is currently set inside the script:

```bash
DISK_THRESHOLD=80   # percent
```

## Sample Output

```
System Monitoring script starting....
Disk Usage is : 38
OK: Disk usage is at 38%
```