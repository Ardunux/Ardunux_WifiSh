#!/bin/sh -e

SUDO=""
if [ $(id -u) -ne 0 ]; then
        SUDO="sudo"
fi

$SUDO install -D -m0644 awk/wscanparse.awk /var/lib/wifish/wscanparse.awk
$SUDO install -D -m0644 awk/wlistparse.awk /var/lib/wifish/wlistparse.awk
$SUDO install -D -m0644 awk/wscan2menu.awk /var/lib/wifish/wscan2menu.awk
$SUDO install -D -m0644 awk/iwparse.awk /var/lib/wifish/iwparse.awk
$SUDO install -D -m0755 wifish /usr/local/bin

# check it is Arch Linux
_os_arch=""
if [ -e /etc/os-release ]; then
        _os_arch=$(cat /etc/os-release | grep "Arch Linux")
fi

# work on any linux (not for archlinux)
if [ -z "$_os_arch" ]; then
	if [ ! -d /etc/sv/wpa_supplicant ];then
		echo "Installing /etc/sv/wpa_supplicant service"
		$SUDO install -D -d -m0755 /etc/sv/wpa_supplicant
		$SUDO install -D -m0644 sv/wpa_supplicant/conf /etc/sv/wpa_supplicant/conf
		$SUDO install -D -m0755 sv/wpa_supplicant/run /etc/sv/wpa_supplicant/run
		$SUDO install -D -m0755 sv/wpa_supplicant/log/run /etc/sv/wpa_supplicant/log/run
	fi
fi
echo ".. Wifish is installed .."
