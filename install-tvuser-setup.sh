#!/bin/sh
# Run as tvglotzer after 1st gnome login

# Install Kodi, Tweaks and Power button in dock
mkdir -p /home/tvglotzer/.local/share/applications/
cp shutdown-for-dock.desktop /home/tvglotzer/.local/share/applications/
gsettings set org.gnome.shell favorite-apps "[ 'firefox.desktop', 'google-chrome.desktop', 'org.gnome.Nautilus.desktop', 'rhythmbox.desktop', 'yelp.desktop', 'org.gnome.Terminal.desktop', 'kodi.desktop', 'org.gnome.tweaks.desktop', 'shutdown-for-dock.desktop' ]"

# Configure top bar autohide (only appears when mouse hits top)
gsettings set org.gnome.shell disable-user-extensions false
mkdir -p /home/tvglotzer/.local/share/gnome-shell/extensions/hidetopbar@mathieu.bidon.ca/schemas/
cp /usr/share/gnome-shell/extensions/hidetopbar@mathieu.bidon.ca/schemas/gschemas.compiled /home/tvglotzer/.local/share/gnome-shell/extensions/hidetopbar\@mathieu.bidon.ca/schemas/
gsettings set org.gnome.shell enabled-extensions "[ 'hidetopbar@mathieu.bidon.ca' ]"
gsettings --schemadir /home/tvglotzer/.local/share/gnome-shell/extensions/hidetopbar@mathieu.bidon.ca/schemas/ set org.gnome.shell.extensions.hidetopbar mouse-sensitive true
gsettings --schemadir /home/tvglotzer/.local/share/gnome-shell/extensions/hidetopbar@mathieu.bidon.ca/schemas/ set org.gnome.shell.extensions.hidetopbar enable-active-window false
gsettings --schemadir /home/tvglotzer/.local/share/gnome-shell/extensions/hidetopbar@mathieu.bidon.ca/schemas/ set org.gnome.shell.extensions.hidetopbar shortcut-toggles false
gsettings --schemadir /home/tvglotzer/.local/share/gnome-shell/extensions/hidetopbar@mathieu.bidon.ca/schemas/ set org.gnome.shell.extensions.hidetopbar enable-intellihide false

exit
