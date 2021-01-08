#!/bin/sh
# Install config mods
systemctl stop vdr.service
install -d -o vdr -g vdr /srv/vdr/video
cp 00-vdr.conf /etc/vdr/conf.d/
cp setup.conf /var/lib/vdr/
cp channels.conf /var/lib/vdr/
cp S90.lifeguard /etc/vdr/shutdown-hooks/
cp S95.acpi-wakeup /etc/vdr/shutdown-hooks/
ln -sf /etc/vdr/shutdown-hooks/S90.lifeguard /usr/share/vdr/shutdown-hooks/
ln -sf /etc/vdr/shutdown-hooks/S95.acpi-wakeup /usr/share/vdr/shutdown-hooks/
cp vdr /etc/default/
cp ngene_18.fw /lib/firmware/
systemctl start vdr.service
exit
