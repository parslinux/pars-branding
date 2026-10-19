# 🐆 ParsLinux Branding (`pars-branding`)

ParsLinux işletim sisteminin kurumsal görsel kimliğini, duvar kağıtlarını, GNOME arka plan tanımlarını, vektör logolarını ve terminal kimliğini sağlayan temel meta paket deposudur.

---

## 📦 Paket İçeriği ve Varlıklar

| Bileşen | Konum | Açıklama |
| :--- | :--- | :--- |
| **Duvar Kağıtları** | `/usr/share/backgrounds/parslinux/` | ParsLinux 1080p varsayılan arka planı |
| **GNOME XML** | `/usr/share/gnome-background-properties/` | GNOME Ayarlar menüsünden duvar kağıdı seçimi |
| **Logolar & İkonlar** | `/usr/share/pixmaps/parslinux/` | ParsLinux resmi vektör SVG logoları |
| **Uygulama İkonu** | `/usr/share/icons/hicolor/scalable/apps/` | `parslinux-logo.svg` sistem ikonu |
| **Fastfetch Yapılandırması** | `/etc/fastfetch/parslinux.jsonc` | Terminal sistem bilgisi için özel Pars teması |
| **Terminal ASCII Sanatı** | `/usr/share/parslinux/ascii/` | ParsLinux ASCII terminal logosu |
| **Dağıtım Kimliği** | `/usr/share/parslinux/distro/` | `os-release`, `issue` ve `issue.net` tanımları |

---

## 🧱 Bağımlılıklar (Meta Paket Rolü)

Bu paket kurulduğunda sistemin ParsLinux görsel kimliğini eksiksiz yansıtması için şu paketleri çağırır:

- **`parslinux-gnome-settings`**: Pars GTK teması, ikon seti ve varsayılan panel/dock ayarları.
- **`parslinux-grub-theme`**: ParsLinux Full HD önyükleme açılış teması.
- **`desktop-base`**: Debian/Pardus masaüstü taban entegrasyonu.
- *(Önerilen)* **`adw-gtk3-theme`**, **`fonts-ubuntu`**, **`fastfetch`**, **`parslinux-about`**.

---

## 🚀 Hızlı Başlangıç & Kullanım

### 1. Önizleme ve Doğrulama
Varlıkları ve terminal ASCII sanatını yerel olarak test etmek için:
```bash
./run.sh
```

### 2. Debian Paketi (.deb) Üretme
Tüm bağımlılıkları ve varlıkları içeren `.deb` paketini oluşturmak için:
```bash
./package.sh
```
Oluşan paket `build/pars-branding_1.0.0_all.deb` dizininde yer alacaktır.

### 3. Doğrudan Sisteme Kurma
Geliştirme ortamında root yetkisiyle doğrudan kurmak için:
```bash
sudo ./install.sh
```

### 4. Sistemden Temizleme
```bash
sudo ./uninstall.sh
```

---

## 📄 Lisans
GPL-3.0 / Pars Linux Developers.
