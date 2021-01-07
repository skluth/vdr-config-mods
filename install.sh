#!/bin/sh
# Run as root with sudo

# Add kodi ppa
# add-apt-repository -y -u ppa:team-xbmc/ppa

# Packages
apt-get -y install debconf-utils
debconf-set-selections vdr-debconf.txt
cat packages.txt | xargs apt-get -y install
debconf-set-selections libdvd-pkg-debconf.txt
apt-get -y install libdvd-pkg
dpkg-reconfigure libdvd-pkg

# Install vdr config mods
./install-config-mods.sh

# Add user and configure
adduser tvglotzer
adduser --gecos "" --disabled-password tvglotzer
echo tvglotzer:ninahagen | chpasswd

exit
