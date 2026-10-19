#!/usr/bin/env bash
# ==============================================================================
# ParsLinux Branding — Sistemden Kaldırma Betiği (uninstall.sh)
# ==============================================================================

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
BOLD='\033[1m'
NC='\033[0m'

echo -e "${YELLOW}${BOLD}"
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║        🗑️ ParsLinux Branding — Sistemden Kaldırma            ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo -e "${NC}"

if [ "$EUID" -ne 0 ]; then
    echo -e "${YELLOW}ℹ️  Sistemden kaldırma için root ayrıcalığı gerekiyor. Sudo isteniyor...${NC}"
    exec sudo bash "$0" "$@"
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo -e "${BOLD}[1/3] Makefile ile dosyalar siliniyor...${NC}"
make uninstall DESTDIR=

echo -e "\n${BOLD}[2/3] Masaüstü arka plan alternatifi kaldırılıyor...${NC}"
if command -v update-alternatives &>/dev/null; then
    update-alternatives --remove desktop-background /usr/share/backgrounds/parslinux/pars-default.png || true
fi

echo -e "\n${BOLD}[3/3] İkon önbelleği yenileniyor...${NC}"
if command -v gtk-update-icon-cache &>/dev/null; then
    gtk-update-icon-cache -q -t -f /usr/share/icons/hicolor || true
fi

echo -e "\n${GREEN}${BOLD}✓ ParsLinux Branding bileşenleri sistemden temizlendi.${NC}\n"
