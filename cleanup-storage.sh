#!/bin/bash

# We reset the DB once it gets over 50 MB 
THRESHOLD=50000
TMP_SIZE=64000
MOUNTPOINT=/opt/mini-zabbix/tmp

DU=$(du $MOUNTPOINT --max-depth=0 | cut -f 1)
echo "Current folder size: $DU KB"

if [[ $DU > $THRESHOLD ]]; then
	echo "Resetting mini-zabbix DB"
	systemctl stop mini-zabbix-proxy
	umount $MOUNTPOINT
	systemctl start mini-zabbix-storage
	#sqlite3 ${MOUNTPOINT}/zabbix_proxy.sqlite < ${MINI_ZABBIX_ROOT}/zabbix_proxy.sqlite
	chown zabbix ${MOUNTPOINT}/zabbix_proxy.sqlite 
	systemctl start mini-zabbix-proxy
fi
