source config.sh

DEST=mini-zabbix-${ARCH}-${ZABBIX_VERSION}
mkdir -p $DEST
cp *.service *.timer cleanup-storage.sh install_proxy.sh config.sh $DEST
cp fping-${FPING_VERSION}/src/fping $DEST
cp zabbix-${ZABBIX_VERSION}/install/sbin/zabbix_proxy $DEST
cp zabbix_proxy.conf $DEST
cp README.md $DEST



