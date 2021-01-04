#!/bin/sh
# Run as root with sudo

# Add kodi ppa
add-apt-repository ppa:team-xbmc/ppa
apt-get update

# Packages
apt-get install debconf-utils
debconf-set-selections vdr-debconf.txt
cat packages.txt | xargs apt-get -y install

# Install config mods
systemctl stop vdr.service
cp 00-vdr.conf /etc/vdr/conf.d/
cp setup.conf /var/lib/vdr/setup.conf
cp S90.lifeguard /etc/vdr/shutdown-hooks/
cp S95.acpi-wakeup /etc/vdr/shutdown-hooks/
ln -s /etc/vdr/shutdown-hooks/S90.lifeguard /usr/share/vdr/shutdown-hooks/
ln -s /etc/vdr/shutdown-hooks/S95.acpi-wakeup /usr/share/vdr/shutdown-hooks/
cp vdr /etc/default/
cp ngene_18.fw /lib/firmware/

# Add user and configure
adduser tvglotzer
echo tvglotzer:ninahagen | chpasswd
cp shutdown-for-dock.desktop /home/tvglotzer/.local/share/applications/
USERID=$(id -u tvglotzer)
sudo -u tvglotzer DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/${USERID}/bus gsettings set org.gnome.shell favorite-apps "[ 'firefox.desktop', 'org.gnome.Nautilus.desktop', 'rhythmbox.desktop', 'yelp.desktop', 'org.gnome.Terminal.desktop', 'kodi.desktop', 'org.gnome.tweaks.desktop', 'shutdown-for-dock.desktop']"
sudo -u tvglotzer DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/${USERID}/bus gsettings set org.gnome.shell enabled-extensions ['hidetopbar@mathieu.bidon.ca']
mkdir -p /home/tvglotzer/.local/share/gnome-shell/extensions/hidetopbar@mathieu.bidon.ca/schemas/
install -o tvglotzer -g tvglotzer /usr/share/gnome-shell/extensions/hidetopbar@mathieu.bidon.ca/schemas/gschemas.compiled /home/tvglotzer/.local/share/gnome-shell/extensions/hidetopbar\@mathieu.bidon.ca/schemas/
sudo -u tvglotzer DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/${USERID}/bus gsettings -schemadir ~/.local/share/gnome-shell/extensions/hidetopbar@mathieu.bidon.ca/schemas/ set org.gnome.shell.extensions.hidetopbar mouse-sensitive true
sudo -u tvglotzer DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/${USERID}/bus gsettings -schemadir ~/.local/share/gnome-shell/extensions/hidetopbar@mathieu.bidon.ca/schemas/ set org.gnome.shell.extensions.hidetopbar enable-active-window false

exit
