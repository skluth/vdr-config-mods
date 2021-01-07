#!/bin/sh
# Run as root with sudo

# Remove (purge) installed packages
cat packages.txt | xargs apt-get -y purge
apt-get autoremove

add-apt-repository -y --remove ppa:team-xbmc/ppa

deluser --remove-home tvglotzer

rm /lib/firmware/ngene_18.fw

exit
