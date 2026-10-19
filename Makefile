PREFIX ?= /usr
SYSCONFDIR ?= /etc
DATADIR ?= $(PREFIX)/share

all:
	@echo "ParsLinux Branding varlıkları hazır."

install:
	# Duvar kağıtları
	install -d $(DESTDIR)$(DATADIR)/backgrounds/parslinux
	install -m 644 data/backgrounds/pars-default.png $(DESTDIR)$(DATADIR)/backgrounds/parslinux/
	install -d $(DESTDIR)$(DATADIR)/gnome-background-properties
	install -m 644 data/backgrounds/parslinux-wallpapers.xml $(DESTDIR)$(DATADIR)/gnome-background-properties/

	# Pixmaps ve Vektör Logolar
	install -d $(DESTDIR)$(DATADIR)/pixmaps/parslinux
	install -m 644 data/pixmaps/parslinux-logo.svg $(DESTDIR)$(DATADIR)/pixmaps/parslinux/
	install -m 644 data/pixmaps/parslinux-symbolic.svg $(DESTDIR)$(DATADIR)/pixmaps/parslinux/
	install -d $(DESTDIR)$(DATADIR)/icons/hicolor/scalable/apps
	install -m 644 data/pixmaps/parslinux-logo.svg $(DESTDIR)$(DATADIR)/icons/hicolor/scalable/apps/parslinux-logo.svg

	# Fastfetch & ASCII Sanatı
	install -d $(DESTDIR)$(DATADIR)/parslinux/ascii
	install -m 644 data/fastfetch/parslinux-ascii.txt $(DESTDIR)$(DATADIR)/parslinux/ascii/
	install -d $(DESTDIR)$(SYSCONFDIR)/fastfetch
	install -m 644 data/fastfetch/config.jsonc $(DESTDIR)$(SYSCONFDIR)/fastfetch/parslinux.jsonc

	# Sistem Dağıtım Kimliği
	install -d $(DESTDIR)$(DATADIR)/parslinux/distro
	install -m 644 data/issue/issue $(DESTDIR)$(DATADIR)/parslinux/distro/issue
	install -m 644 data/issue/issue.net $(DESTDIR)$(DATADIR)/parslinux/distro/issue.net
	install -m 644 data/issue/os-release $(DESTDIR)$(DATADIR)/parslinux/distro/os-release

uninstall:
	rm -rf $(DESTDIR)$(DATADIR)/backgrounds/parslinux
	rm -f $(DESTDIR)$(DATADIR)/gnome-background-properties/parslinux-wallpapers.xml
	rm -rf $(DESTDIR)$(DATADIR)/pixmaps/parslinux
	rm -f $(DESTDIR)$(DATADIR)/icons/hicolor/scalable/apps/parslinux-logo.svg
	rm -rf $(DESTDIR)$(DATADIR)/parslinux
	rm -f $(DESTDIR)$(SYSCONFDIR)/fastfetch/parslinux.jsonc

clean:
	rm -rf build debian/.debhelper debian/pars-branding* debian/files debian/*.substvars *.deb
