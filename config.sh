ZABBIX_VERSION=6.4.19
ZABBIX_MAJOR=${ZABBIX_VERSION%.*}
ZABBIX_URL=https://cdn.zabbix.com/zabbix/sources/stable/${ZABBIX_MAJOR}/zabbix-${ZABBIX_VERSION}.tar.gz


NET_SNMP_VERSION=5.9.4
NET_SNMP_URL=https://sourceforge.net/projects/net-snmp/files/net-snmp/${NET_SNMP_VERSION}/net-snmp-${NET_SNMP_VERSION}.tar.gz/download

LIBEVENT_URL=https://github.com/libevent/libevent/archive/refs/heads/master.zip

FPING_VERSION=5.2
FPING_URL=https://fping.org/dist/fping-${FPING_VERSION}.tar.gz

JOBS=3
ARCH=$(uname -m)

# The following line is used to cut the file correctly during installation!
##### INSTALL VALUES

MINI_ZABBIX_ROOT=/opt/mini-zabbix
MOUNTPOINT=${MINI_ZABBIX_ROOT}/tmp
