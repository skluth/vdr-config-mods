#!/bin/sh
# Run as tvusername after 1st gnome login

# Install browsers, terminal, Kodi, Tweaks and Power button in dock
mkdir -p ${HOME}/.local/share/applications/
cp shutdown-for-dock.desktop ${HOME}/.local/share/applications/
chmod +x ${HOME}/.local/share/applications/shutdown-for-dock.desktop
gsettings set org.gnome.shell favorite-apps "[ 'kodi.desktop', 'firefox_firefox.desktop', 'org.gnome.tweaks.desktop', 'org.gnome.Ptyxis.desktop', 'org.gnome.Nautilus.desktop', 'shutdown-for-dock.desktop' ]"

exit
