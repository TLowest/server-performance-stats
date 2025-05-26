# Server Performance Stats

This project provides a lightweight Bash script, `server-stats.sh`, that analyzes and displays basic performance statistics of a Linux server. It is designed to help users quickly understand system resource usage and identify resource-heavy processes.

---
## Project Overview
> This Project is inspired by [roadmap.sh](https://roadmap.sh/projects/server-stats)

The goal is to develop a resuable shell script to monitor and report key server metrics, giving insight into CPU, memory, and disk usage, as well as highlighting top resource-consuming processes. 

## Features
The script outputs the following information: 
- 🔧 Total CPU Usage
- 💾 Memory usage (Free vs. Used, including percentage)
- 🧠 Top 5 processes by memory usage
- ⚙️ Top 5 processes by CPU usage

Additional system details include:
- 🖥️ OS version and kernel info
- ⏲️ System uptime and load average
- 👥 Logged-in users
- ❌ Failed login attempts
