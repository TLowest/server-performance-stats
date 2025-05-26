# Server Performance Stats

This project provides a lightweight Bash script, `server-stats.sh`, that analyzes and displays basic performance statistics of a Linux server. It is designed to help users quickly understand system resource usage and identify resource-heavy processes.

---
## Project Overview
> This Project is inspired by [roadmap.sh](https://roadmap.sh/projects/server-stats)

The goal is to develop a resuable shell script to monitor and report key server metrics, giving insight into CPU, memory, and disk usage, as well as highlighting top resource-consuming processes. 

### Features
The script outputs the following information: 
- 🔧 Total CPU Usage
- 💾 Memory Usage (Free vs. Used, including percentage)
- 🗄️ Disk Usage (Free vs. Used, including percentage)
- 🧠 Top 5 Processes by Memory Usage
- ⚙️ Top 5 Processes by CPU Usage

Additional system details include:
- 🖥️ OS Version and Kernel Information
- ⏲️ System Uptime and Load Average
- 👥 Logged-in Users
- ❌ Failed Login Attempts

### Usage
1. Download the script:
```BASH
wget https://raw.githubusercontent.com/TLowest/server-performance-stats/refs/heads/main/server-stats.sh
```
2. Make the script executable:
```BASH
chmod +x server-stats.sh
```
3. Run the script:
```BASH
./server-stats.sh
```
> You may need to run the script with elevated privileges (e.g., `sudo ./server-stats.sh`) to access logs such as failed login attempts.

### Notes & Best Practices
- Portability:
  - The script uses only standard Unix/Linux utitlies (`top`,`df`,`ps`, etc.) ensuring compatibility across most distributions.
- Dependency Check:
  - Before running, it checks if required commands are installed to prevent runtime errors.
- Security Conscious:
  - No use of `sudo` or root-only commands unless required by the user.
  - Protects against intrruptions using `trap`.
  - Uses `awk`,`head`, and `grep` for safe output parsing.
