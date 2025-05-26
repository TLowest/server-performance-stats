#!/bin/bash

# server-stats.sh - Analyze and display basic server performance statistics securely

# Ensure the script is run with bash
[ -z "$BASH_VERSION" ] && { echo "Please run this script with bash."; exit 1; }

# Trap for interrupt/exit
trap 'echo "Script interrupted or terminated."; exit 1' INT TERM

# Check required commands
REQUIRED_CMDS=(top free df ps uname uptime who last awk grep head sort)
for cmd in "${REQUIRED_CMDS[@]}"; do
    command -v "$cmd" >/dev/null 2>&1 || {
        echo "Error: Required command '$cmd' is not installed." >&2
        exit 1
    }
done
 
echo "===== SERVER PERFORMANCE STATS ====="
echo

# OS Version and Kernel
echo "OS & Kernel:"
uname -a
echo

# Uptime and Load Average
echo "Uptime & Load Average:"
uptime
echo

# CPU Usage
echo "CPU Usage:"
top -b -n1 | grep "Cpu(s)" | awk '{used = $2 + $4; idle = $8; printf("Used: %.2f%% | Idle: %.2f%%\n", used, idle)}'
echo

# Top 5 Processes by CPU Usage
echo "Top 5 Processes by CPU Usage:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
echo

# Memory Usage
echo "Memory Usage:"
free -m | awk '/^Mem:/ {
    used=$3; free=$4; total=$2;
    usage=(used/total)*100;
    printf("Used: %dMB | Free: %dMB | Usage: %.2f%%\n", used, free, usage)
}'
echo

# Top 5 Processes by Memory Usage
echo "Top 5 Processes by Memory Usage:"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6
echo

# Disk Usage
echo "Disk Usage (root partition):"
df -h / | awk 'NR==2 {

    printf("Used: %s | Free: %s | Usage: %s\n", $3, $4, $5)
}'
echo

# Logged In Users
echo "Logged-In Users:"
who
echo

# Failed Login Attempts (requires sudo or auditd)
echo "Failed Login Attempts:"
if command -v lastb >/dev/null 2>&1; then
    if [ -r /var/log/btmp ]; then
        lastb | head -n 5
    else
        echo "Permission denied to read /var/log/btmp. Try running with sudo."
    fi
else
    echo "'lastb' not available. Install 'util-linux' package if needed."
fi

echo

echo "Report generated on: $(date)"
