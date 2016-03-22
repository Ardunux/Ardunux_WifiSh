#!/bin/sh -e
rm -rf /var/lib/wifish
rm -f /usr/local/bin/wifish
if [ -d /etc/sv/wpa_supplicant ];then
	echo "Uninstalling /etc/sv/wpa_supplicant service"
	rm -rf /etc/sv
fi
echo ".. Wifish is uninstalled .."
