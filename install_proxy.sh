#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi


source config.sh

echo "Creating zabbix user"

addgroup --system --quiet zabbix
adduser --quiet --system --disabled-login --ingroup zabbix --home ${MOUNTPOINT} --no-create-home zabbix

echo "Creating mini-zabbix tmp mount point"

if mountpoint $MOUNTPOINT; then
	echo "$MOUNTPOINT already mounted. Skip creation!"
else
	mkdir -p $MOUNTPOINT 
	chown -R zabbix $MINI_ZABBIX_ROOT
	chattr +i $MOUNTPOINT
fi


if [ "$(pwd)" != "${MINI_ZABBIX_ROOT}" ]; then
	echo "Script was not run from ${MINI_ZABBIX_ROOT}"
	echo "Copying the content of this folder"
	if rsync --help > /dev/null; then
		rsync -arv . /opt/mini-zabbix
	else
		echo "Please install rsync!"
		exit 1
	fi
fi


echo "Fixing fping permissions"
chown root /opt/mini-zabbix/fping
chattr +s /opt/mini-zabbix/fping

echo "Installing and enabling systemd services"

cp *.service *.timer /etc/systemd/system
systemctl enable mini-zabbix-storage-cleanup.timer --now
systemctl enable mini-zabbix-proxy.service --now
