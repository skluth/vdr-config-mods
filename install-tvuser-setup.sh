#!/bin/sh
# Run as tvglotzer after 1st gnome login

# Get the username
TVUSERNAME=$(cat tvusername.txt)

# Install Kodi, Tweaks and Power button in dock
mkdir -p ${HOME}/.local/share/applications/
cp shutdown-for-dock.desktop ${HOME}/.local/share/applications/
gsettings set org.gnome.shell favorite-apps "[ 'firefox.desktop', 'google-chrome.desktop', 'org.gnome.Nautilus.desktop', 'rhythmbox.desktop', 'yelp.desktop', 'org.gnome.Terminal.desktop', 'kodi.desktop', 'org.gnome.tweaks.desktop', 'shutdown-for-dock.desktop' ]"

# Configure top bar autohide (only appears when mouse hits top)
gsettings set org.gnome.shell disable-user-extensions false
mkdir -p ${HOME}/.local/share/gnome-shell/extensions/hidetopbar@mathieu.bidon.ca/schemas/
cp /usr/share/gnome-shell/extensions/hidetopbar@mathieu.bidon.ca/schemas/gschemas.compiled ${HOME}/.local/share/gnome-shell/extensions/hidetopbar\@mathieu.bidon.ca/schemas/
gsettings set org.gnome.shell enabled-extensions "[ 'hidetopbar@mathieu.bidon.ca' ]"
gsettings --schemadir ${HOME}/.local/share/gnome-shell/extensions/hidetopbar@mathieu.bidon.ca/schemas/ set org.gnome.shell.extensions.hidetopbar mouse-sensitive true
gsettings --schemadir ${HOME}/.local/share/gnome-shell/extensions/hidetopbar@mathieu.bidon.ca/schemas/ set org.gnome.shell.extensions.hidetopbar enable-active-window false
gsettings --schemadir ${HOME}/.local/share/gnome-shell/extensions/hidetopbar@mathieu.bidon.ca/schemas/ set org.gnome.shell.extensions.hidetopbar shortcut-toggles false
gsettings --schemadir ${HOME}/.local/share/gnome-shell/extensions/hidetopbar@mathieu.bidon.ca/schemas/ set org.gnome.shell.extensions.hidetopbar enable-intellihide false

exit
