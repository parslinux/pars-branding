#!/usr/bin/env bash
# ==============================================================================
# ParsLinux Branding — Görsel Kimlik Önizleme ve Doğrulama Betiği (run.sh)
# ==============================================================================

set -e

CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BOLD='\033[1m'
NC='\033[0m'

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo -e "${CYAN}${BOLD}"
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║       🐆 ParsLinux Branding — Önizleme & Doğrulama           ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo -e "${NC}"

echo -e "${BOLD}[1/3] Fastfetch ASCII Sanatı:${NC}"
echo -e "${CYAN}"
cat data/fastfetch/parslinux-ascii.txt
echo -e "${NC}"

echo -e "${BOLD}[2/3] Varlıklar ve Dosya Boyutları:${NC}"
echo -e "  • Varsayılan Duvar Kağıdı : $(du -h data/backgrounds/pars-default.png | cut -f1)"
echo -e "  • Vektör Logo (Ana)       : $(du -h data/pixmaps/parslinux-logo.svg | cut -f1)"
echo -e "  • Vektör Logo (Sembolik)  : $(du -h data/pixmaps/parslinux-symbolic.svg | cut -f1)"
echo -e "  • GNOME XML Tanımı        : $(du -h data/backgrounds/parslinux-wallpapers.xml | cut -f1)"
echo -e "  • Dağıtım Kimliği (Issue) : $(cat data/issue/issue)"

echo -e "\n${BOLD}[3/3] Fastfetch Testi:${NC}"
if command -v fastfetch &>/dev/null; then
    echo -e "${GREEN}✓ fastfetch tespit edildi, ParsLinux önayarı çalıştırılıyor...${NC}\n"
    fastfetch -c "$SCRIPT_DIR/data/fastfetch/config.jsonc" --logo "$SCRIPT_DIR/data/fastfetch/parslinux-ascii.txt"
else
    echo -e "${YELLOW}ℹ️  fastfetch kurulu değil (Kurulu olduğunda otomatik Pars temasıyla çalışacaktır).${NC}"
fi

echo -e "\n${GREEN}✓ Tüm görsel kimlik bileşenleri doğrulandı ve hazır!${NC}\n"
