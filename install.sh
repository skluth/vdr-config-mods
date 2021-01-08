#!/bin/sh
# Run as root with sudo

# Add kodi ppa (broken dependencies as of Jan 2021)
# add-apt-repository -y -u ppa:team-xbmc/ppa

# Packages
apt-get -y install debconf-utils
debconf-set-selections vdr-debconf.txt
cat packages.txt | xargs apt-get -y install
debconf-set-selections libdvd-pkg-debconf.txt
apt-get -y install libdvd-pkg
dpkg-reconfigure libdvd-pkg

# Googlechrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb

# Install vdr config mods
./install-config-mods.sh

# Add tvuser, configuration after 1st gnome login with
# install-tvuser-setup.sh
TVUSERNAME=$(cat tvusername.txt)
adduser --gecos "" --disabled-password $TVUSERNAME
echo $TVUSERNAME:ninahagen | chpasswd

exit
