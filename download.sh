#!/bin/bash
set -eu
source config.sh


if [ ! -d zabbix-${ZABBIX_VERSION} ]; then
	wget ${ZABBIX_URL} -O zabbix.tar.gz
	tar -xzvf zabbix.tar.gz
	rm zabbix.tar.gz
fi

if [ ! -d net-snmp-${NET_SNMP_VERSION} ]; then
	wget ${NET_SNMP_URL} -O net-snmp.tar.gz
	tar -xzvf net-snmp.tar.gz
	rm net-snmp.tar.gz
fi

if [ ! -d libevent-master ]; then
	wget $LIBEVENT_URL -O libevent.zip
	unzip libevent.zip
fi
