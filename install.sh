#!/bin/sh
# Run as root with sudo

# Add kodi ppa
add-apt-repository ppa:team-xbmc/ppa
apt-get update

# Packages
apt-get install debconf-utils
debconf-set-selections vdr-debconf.txt
cat packages.txt | xargs apt-get -y install
dpkg-reconfigure libdvd-pkg

# Install config mods
./install-config-mods.sh

# Add user and configure
adduser tvglotzer
echo tvglotzer:ninahagen | chpasswd
install -o tvglotzer -g tvglotzer shutdown-for-dock.desktop /home/tvglotzer/.local/share/applications/
USERID=$(id -u tvglotzer)
sudo -u tvglotzer DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/${USERID}/bus gsettings set org.gnome.shell favorite-apps "[ 'firefox.desktop', 'org.gnome.Nautilus.desktop', 'rhythmbox.desktop', 'yelp.desktop', 'org.gnome.Terminal.desktop', 'kodi.desktop', 'org.gnome.tweaks.desktop', 'shutdown-for-dock.desktop']"
sudo -u tvglotzer DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/${USERID}/bus gsettings set org.gnome.shell enabled-extensions ['hidetopbar@mathieu.bidon.ca']
mkdir -p /home/tvglotzer/.local/share/gnome-shell/extensions/hidetopbar@mathieu.bidon.ca/schemas/
install -o tvglotzer -g tvglotzer /usr/share/gnome-shell/extensions/hidetopbar@mathieu.bidon.ca/schemas/gschemas.compiled /home/tvglotzer/.local/share/gnome-shell/extensions/hidetopbar\@mathieu.bidon.ca/schemas/
sudo -u tvglotzer DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/${USERID}/bus gsettings -schemadir ~/.local/share/gnome-shell/extensions/hidetopbar@mathieu.bidon.ca/schemas/ set org.gnome.shell.extensions.hidetopbar mouse-sensitive true
sudo -u tvglotzer DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/${USERID}/bus gsettings -schemadir ~/.local/share/gnome-shell/extensions/hidetopbar@mathieu.bidon.ca/schemas/ set org.gnome.shell.extensions.hidetopbar enable-active-window false

exit
