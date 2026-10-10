# Debian System Maintenance Script

A simple, safe Bash script that updates, cleans, and repairs packages on Debian and Debian-based Linux systems (Ubuntu, Linux Mint, Pop!_OS, etc.).

## Features

- Refreshes package lists and performs full system upgrades.
- Removes unused packages and cleans the package cache.
- Fixes broken package dependencies and interrupted `dpkg` states.
- Checks if a system reboot is required.
- Clear, color-coded output that auto-disables when piped.
- Fails fast with `set -euo pipefail` and reports the exact line on error.
- Safe to run repeatedly (idempotent).

## Prerequisites

- A Debian-based Linux distribution (Debian, Ubuntu, Mint, Pop!_OS, …)
- `sudo` or root privileges
- Bash 4.0 or newer (default on all modern Debian systems)

## Installation

```bash
git clone https://github.com/slopmanufacturer/debian-system-maintenance.git
cd debian-system-maintenance
chmod +x system-maintenance.sh
```

## Usage

Run with root privileges:

```bash
sudo ./system-maintenance.sh
```

## What It Does

The script runs these steps in order:

1. `apt update` — refresh the list of available packages
2. `apt upgrade -y` — install available upgrades
3. `apt full-upgrade -y` — handle upgrades requiring new/removed packages
4. `apt autoremove -y` — remove unused dependencies
5. `apt autoclean` — delete obsolete downloaded package files
6. `apt --fix-broken install -y` — repair broken dependencies
7. `dpkg --configure -a` — finish any interrupted package configuration
8. Check `/var/run/reboot-required` and warn if a restart is needed

## Example Output

```
--------------README---------------
[INFO]  ==> Made by slopmanufacturer
[INFO]  ==> Please check more of my scripts and code in https://github.com/slopmanufacturer
[SYS]   Thanks for using this! ( ˶⚈Ɛ⚈˵)
-----------------------------------
[INFO]  ==> Updating package lists...
[INFO]  ==> Upgrading packages...
[INFO]  ==> Full upgrade (handles new dependencies)...
[INFO]  ==> Removing unused packages...
[INFO]  ==> Cleaning package cache...
[INFO]  ==> Fixing broken packages...
[INFO]  ==> Fixing interrupted dpkg state...
[OK]    ==> No reboot required.
[SUCCESS] All done — no hiccups ✨
```

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.

## Author

**slopmanufacturer** — [github.com/slopmanufacturer](https://github.com/slopmanufacturer)

More scripts and projects: [github.com/slopmanufacturer](https://github.com/slopmanufacturer)
