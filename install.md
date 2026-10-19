# 📦 ParsLinux Branding — Kurulum ve Dağıtım Kılavuzu (`install.md`)

Bu kılavuz, **`pars-branding`** paketinin çalışan bir sisteme nasıl kurulacağını, `.deb` paketinin nasıl derleneceğini ve ParsLinux canlı ISO kalıbına (`live-build`) nasıl dahil edileceğini açıklar.

---

## 🛠️ Gereksinimler

- **Masaüstü Ortamı:** GNOME (veya XFCE)
- **Paket Yöneticisi:** `dpkg` / `apt`
- **Yardımcı Araçlar (İsteğe bağlı):** `fastfetch`, `gtk-update-icon-cache`

---

## 🚀 1. Yöntem: Doğrudan Kurulum Sihirbazı (Geliştirici Modu)

Herhangi bir `.deb` derlemesine ihtiyaç duymadan, dosyaları doğrudan sisteme bağlamak için:

```bash
# Proje kök dizininde:
sudo ./install.sh
```

### Kurulumda Ne Yapılır?
1. Duvar kağıtları `/usr/share/backgrounds/parslinux/` dizinine yerleştirilir.
2. GNOME Ayarlar XML şeması `/usr/share/gnome-background-properties/` altına yazılır.
3. Vektör logolar `/usr/share/pixmaps/parslinux/` ve sistem hicolor ikon dizinine işlenir.
4. `update-alternatives` ile masaüstü arka plan alternatifi ParsLinux olarak güncellenir.
5. Fastfetch ParsLinux yapılandırması `/etc/fastfetch/` dizinine bağlanır.

---

## 📦 2. Yöntem: Debian (.deb) Paketi ile Kurulum

### Adım 1: Paketi Üretin
```bash
./package.sh
```
Çıktı konumu: `build/pars-branding_1.0.0_all.deb`

### Adım 2: Paketi Sisteme Kurun
```bash
sudo dpkg -i build/pars-branding_1.0.0_all.deb
sudo apt-get install -f   # Eksik bağımlılıkları tamamlar
```

---

## 💿 3. Yöntem: Canlı ISO Kalıbına (`live-build`) Entegrasyon

ParsLinux resmi ISO kalıbı derlenirken bu paketin varsayılan gelmesi için:

1. Üretilen `pars-branding_1.0.0_all.deb` paketini `live-images/config/packages.chroot/` dizinine kopyalayın:
   ```bash
   cp build/pars-branding_1.0.0_all.deb /path/to/live-images/config/packages.chroot/
   ```
2. Veya yerel APT deposuna (`reprepro`) ekleyerek `package-lists` dosyasına şu satırı ekleyin:
   ```text
   pars-branding
   ```

---

## 🗑️ Sistemden Kaldırma

Sistemden tamamen temizlemek için:
```bash
# Betik ile:
sudo ./uninstall.sh

# Veya paket yöneticisi ile:
sudo apt purge pars-branding
```
