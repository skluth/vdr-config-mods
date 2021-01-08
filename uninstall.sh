#!/bin/sh
# Run as root with sudo

# Remove (purge) installed packages
cat packages.txt | xargs apt-get -y purge
apt-get -y purge libdvd-pkg
apt-get -y purge google-chrome-stable
apt-get -y autoremove

# add-apt-repository -y --remove ppa:team-xbmc/ppa

# Remove tvuser
TVUSERNAME=$(cat tvusername.txt)
deluser --remove-home $TVUSERNAME

# Remove the extra firmware
rm /lib/firmware/ngene_18.fw

exit
