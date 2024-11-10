#!/bin/bash

source /opt/mini-zabbix/config.sh
set -eu

if ! mountpoint -q $MOUNTPOINT; then
	echo "$MOUNTPOINT is not mounted!"
	exit 0
fi


/opt/mini-zabbix/zabbix_proxy -c /opt/mini-zabbix/zabbix_proxy.conf
