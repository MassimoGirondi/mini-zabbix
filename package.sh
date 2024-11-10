source config.sh

DEST=mini-zabbix-${ARCH}-${ZABBIX_VERSION}
mkdir -p $DEST
cp *.service *.timer cleanup-storage.sh install_proxy.sh mini-zabbix-storage.sh mini-zabbix-proxy.sh $DEST

sed '1,/##### INSTALL VALUES/d' config.sh > $DEST/config.sh

cp fping-${FPING_VERSION}/src/fping $DEST
cp zabbix-${ZABBIX_VERSION}/install/sbin/zabbix_proxy $DEST
cp zabbix_proxy.conf $DEST
cp README.md $DEST



