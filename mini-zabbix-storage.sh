#!/bin/bash

if [ "$(id -u)" -ne 0 ]; then
    echo "You are not running this script as root. Attempting to re-run as sudo..."
    echo "This may fail!"
    sudo "$0" "$@"
    exit 0
fi

source /opt/mini-zabbix/config.sh
set -eu

if mountpoint -q $MOUNTPOINT; then
	echo "$MOUNTPOINT is already mounted!"
	exit 0
fi


if [ ! -d "$MOUNTPOINT" ]; then
	# Don't attemp to create the folder, exit with error
	exit 1
	#mkdir -p  $MOUNTPOINT
	#chown -r zabbix $MOUNTPOINT
	#chattr +i $MOUNTPOINT
fi

mount -t tmpfs -o size=64M,mode=1777 mini-zabbix $MOUNTPOINT
echo "Mounted!:"
mount | grep $MOUNTPOINT


