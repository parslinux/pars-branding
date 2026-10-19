# CLAUDE.md — ParsLinux Branding AI Asistan Rehberi

Bu dosya, bu depoda çalışan yapay zekâ asistanları (Claude, Gemini, Antigravity vb.) için proje bağlamını, mimari kurallarını ve geliştirme iş akışını içerir.

---

## 📌 Proje Özeti

**`pars-branding`**, ParsLinux işletim sisteminin görsel kimlik katmanını (Branding) ve Aşama 3 Katmanlı Meta Paket mimarisinin çekirdek görünüm temelini oluşturan resmi pakettir.

- **Paket Adı:** `pars-branding`
- **Sürüm:** `1.0.0`
- **Mimari:** `all` (Debian mimariden bağımsız paket)
- **Kategori:** `metapackages` / `utils`
- **Marka Standardı:** Kesinlikle Pardus veya Debian eski markaları kullanılmamalı; **ParsLinux** (`parslinux`, `pars`) standartlarına sadık kalınmalıdır.

---

## 📁 Dizin Yapısı

```
pars-branding/
├── data/
│   ├── backgrounds/                     # Masaüstü duvar kağıtları
│   │   ├── pars-default.png             # Full HD 1080p varsayılan arka plan
│   │   └── parslinux-wallpapers.xml     # GNOME arka plan seçici tanımı
│   ├── fastfetch/                       # Terminal kimliği
│   │   ├── config.jsonc                 # Fastfetch JSON şeması ve modülleri
│   │   └── parslinux-ascii.txt          # Nokta/gölge geçişli özel 'P' logosu
│   ├── issue/                           # TTY ve Dağıtım Kimliği
│   │   ├── issue / issue.net            # TTY açılış karşılama metinleri
│   │   └── os-release                   # Dağıtım kimlik değişkenleri
│   └── pixmaps/                         # Vektörel marka varlıkları
│       ├── parslinux-logo.svg           # Renkli ana vektör logo
│       └── parslinux-symbolic.svg       # Sembolik tema logosu
├── debian/                              # Debian paket standartları
│   ├── control                          # Meta paket bağımlılıkları ve meta veri
│   ├── changelog                        # Sürüm geçmişi
│   ├── rules                            # dh $@ derleme kuralları
│   ├── postinst                         # Kurulum sonrası tetikleyiciler
│   └── postrm                           # Kaldırma tetikleyicileri
├── install.sh                           # Doğrudan sistem kurulumu (root)
├── uninstall.sh                         # Sistemden temizleme (root)
├── package.sh                           # Otomatik .deb paketleme betiği
├── run.sh                               # Önizleme ve doğrulama aracı
├── Makefile                             # GNU Make kurulum kuralları
├── progress.md                          # Geliştirme ilerleme takibi
├── install.md                           # Detaylı kurulum ve entegrasyon kılavuzu
└── README.md                            # Genel depo tanıtımı
```

---

## 🛠️ Komutlar & Geliştirme İş Akışı

### 1. Önizleme ve Doğrulama
```bash
./run.sh
```
ASCII 'P' logosunu ve fastfetch entegrasyonunu yerel ortamda anında test eder.

### 2. Debian Paketi Üretme
```bash
./package.sh
```
`dpkg-buildpackage` veya dahili `dpkg-deb` yöntemiyle `build/pars-branding_1.0.0_all.deb` çıktısı üretir.

### 3. Doğrudan Kurulum ve Test
```bash
sudo ./install.sh
# Kaldırmak için:
sudo ./uninstall.sh
```

---

## ⚠️ Geliştirici & AI Kuralları

1. **Görsel Bütünlük:** Logolar ve arka planlar `/usr/share/backgrounds/parslinux/` ve `/usr/share/pixmaps/parslinux/` yollarına sadık kalmalıdır.
2. **Meta Paket Bağımlılıkları:** `debian/control` içindeki `parslinux-gnome-settings`, `parslinux-grub-theme` gibi kardeş paket referansları korunmalıdır.
3. **Temiz Çıkış:** `package.sh` ve `Makefile` `DESTDIR` parametresine tam uyumlu kalmalı, paket derlenirken host sisteme kalıntı bırakmamalıdır.
