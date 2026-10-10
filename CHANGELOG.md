# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Nothing yet.

### Changed
- Nothing yet.

### Fixed
- Nothing yet.


## [1.0.0] - 2026-10-09

### Added
- Initial release.
- System package update via `apt update` and `apt upgrade -y`.
- Full upgrade handling new/removed dependencies via `apt full-upgrade -y`.
- Removal of unused packages via `apt autoremove -y`.
- Package cache cleanup via `apt autoclean`.
- Broken dependency repair via `apt --fix-broken install -y`.
- Interrupted `dpkg` state recovery via `dpkg --configure -a`.
- Reboot-required detection using `/var/run/reboot-required`.
- Color-coded terminal output with automatic disabling when piped.
- Error trapping with line-number reporting via `trap ERR`.
- Root privilege check with a clear error message.
- Strict mode enabled (`set -euo pipefail`) for safe execution.


[Unreleased]: https://github.com/your-username/your-repo/compare/v1.0.0...HEAD
[1.0.0]: https://github.com/your-username/your-repo/releases/tag/v1.0.0
