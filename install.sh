#!/usr/bin/env bash
# ==============================================================================
# ParsLinux Branding — Sistem Kurulum Betiği (install.sh)
# ==============================================================================
# Bu betik ParsLinux duvar kağıtlarını, logolarını, fastfetch yapılandırmasını
# ve görsel kimlik varlıklarını sisteme kurar.
# ==============================================================================

set -e

# Renk tanımları
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
BOLD='\033[1m'
NC='\033[0m'

echo -e "${CYAN}${BOLD}"
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║        🐆 ParsLinux Branding — Kurulum Sihirbazı             ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo -e "${NC}"

# Root yetkisi kontrolü
if [ "$EUID" -ne 0 ]; then
    echo -e "${YELLOW}ℹ️  Sistem genelinde kurulum için root ayrıcalığı gerekiyor. Sudo isteniyor...${NC}"
    exec sudo bash "$0" "$@"
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo -e "${BOLD}[1/4] Makefile ile dosyalar sisteme yükleniyor...${NC}"
make install DESTDIR=

echo -e "\n${BOLD}[2/4] İkon önbelleği güncelleniyor...${NC}"
if command -v gtk-update-icon-cache &>/dev/null; then
    gtk-update-icon-cache -q -t -f /usr/share/icons/hicolor || true
    echo -e "${GREEN}✓ İkon önbelleği güncellendi.${NC}"
fi

echo -e "\n${BOLD}[3/4] Masaüstü arka plan alternatifleri ayarlanıyor...${NC}"
if command -v update-alternatives &>/dev/null; then
    update-alternatives --install /usr/share/images/desktop-base/desktop-background \
        desktop-background /usr/share/backgrounds/parslinux/pars-default.png 90 || true
    echo -e "${GREEN}✓ Varsayılan masaüstü arka planı ParsLinux olarak kaydedildi.${NC}"
fi

echo -e "\n${BOLD}[4/4] Fastfetch terminal kimliği bağlanıyor...${NC}"
if [ ! -f /etc/fastfetch/config.jsonc ] && [ -f /etc/fastfetch/parslinux.jsonc ]; then
    mkdir -p /etc/fastfetch
    cp -n /etc/fastfetch/parslinux.jsonc /etc/fastfetch/config.jsonc || true
    echo -e "${GREEN}✓ Fastfetch ParsLinux şablonu aktif edildi.${NC}"
fi

echo -e "\n${GREEN}${BOLD}══════════════════════════════════════════════════════════════${NC}"
echo -e "${GREEN}${BOLD}🎉 ParsLinux Branding başarıyla kuruldu!${NC}"
echo -e "${GREEN}${BOLD}══════════════════════════════════════════════════════════════${NC}"
echo -e "Yüklenen varlıklar:"
echo -e "  • Duvar Kağıtları: ${CYAN}/usr/share/backgrounds/parslinux/${NC}"
echo -e "  • GNOME Seçici   : ${CYAN}/usr/share/gnome-background-properties/parslinux-wallpapers.xml${NC}"
echo -e "  • Logolar        : ${CYAN}/usr/share/pixmaps/parslinux/${NC}"
echo -e "  • Terminal ASCII : ${CYAN}/usr/share/parslinux/ascii/parslinux-ascii.txt${NC}"
echo -e "  • Test komutu    : ${CYAN}fastfetch -c /etc/fastfetch/parslinux.jsonc${NC}\n"
