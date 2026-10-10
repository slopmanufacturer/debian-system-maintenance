#!/usr/bin/env bash
#
# FOR DEBIAN / DEBIAN-BASED SYSTEMS!!
# System Maintenance - slopmanufacturer
#

set -euo pipefail
export DEBIAN_FRONTEND=noninteractive

#color
if [[ -t 1 ]]; then
  RED=$'\033[0;31m'; NC=$'\033[0m'; BLUE=$'\033[0;34m'
  YELLOW=$'\033[1;33m'; PURPLE=$'\033[0;35m'; PINK=$'\033[38;5;213m';
  GREEN=$'\033[0;32m'
else
  RED=''; NC=''; BLUE=''; YELLOW=''; PURPLE=''; PINK=''; GREEN='';
fi

#message
info()  { printf "${BLUE}[INFO]${NC}  %s\n" "$*"; }
error() { printf "${RED}[ERROR]${NC} %s\n" "$*" >&2; }
warn() { printf "${YELLOW}[WARNING]${NC} %s\n" "$*" >&2; }
ok() { printf "${PURPLE}[OK]${NC} %s\n" "$*"; }
yay() { printf "${PINK}[SYS]${NC} %s\n" "$*"; }
success() { printf "${GREEN}[SUCCESS]${NC} %s\n" "$*"; }

#runs checks
if [[ $EUID -ne 0 ]]; then
  error "Please run as root: sudo $0"
  exit 1
fi

if ! command -v apt-get >/dev/null 2>&1; then
    error "apt-get not found. This script is for Debian-based operating systems"
    exit 1
fi

#banner
printf "${YELLOW}--------------README---------------${NC}\n"
info "==> Made by ${RED}slopmanufacturer${NC}"
info "==> Please check more of my scripts and code in https://github.com/slopmanufacturer"
yay "Thanks for using this! ${PINK}( ˶⚈Ɛ⚈˵)${NC}"
printf "${YELLOW}-----------------------------------${NC}\n"

#Reports errors
trap 'error "Aborted on line $LINENO"' ERR

info "[$(date -Is)] starting maintenance"

#the updating part
info "==> Fixing the dpkg state"
dpkg --configure -a

info "==> Grabbing the new package lists"
apt-get update

info "==> Fixing any broken files or packages"
apt-get --fix-broken install -y

info "==> Fully upgrading the system"
apt-get full-upgrade -y


info "==> Removing useless ahh files"
apt-get autoremove --purge -y

info "==> Taking out cache from the packages"
apt-get autoclean


if [[ -f /var/run/reboot-required ]]; then
  if [[ -f /var/run/reboot-required.pkgs ]]; then
    warn "==> Reboot required for: ${RED}$(tr '\n' ' ' < /var/run/reboot-required.pkgs)${NC}"
  else
    warn "==> Reboot required."
  fi
else
  ok "==> No reboot required."
fi


success "Maintenance completed with no errors."

printf "${YELLOW}--------------README---------------${NC}\n"

info "==> System update is over."
info "==> Find more scripts in ${PINK}https://github.com/slopmanufacturer${NC}"
yay "Thanks for using this! ${PINK}( ˶⚈Ɛ⚈˵)${NC}"
