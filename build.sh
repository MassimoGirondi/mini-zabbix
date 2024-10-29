#!/bin/bash
set -eu
source config.sh

cd libevent-master/
mkdir -p  build
cd build
cmake .. -DEVENT__LIBRARY_TYPE=STATIC -DEVENT__DISABLE_BENCHMARK=ON -DEVENT__DISABLE_SAMPLES=ON -DEVENT__DISABLE_TESTS=ON
make -j $JOBS
sudo make install
cd ../..


cd net-snmp-${NET_SNMP_VERSION}
./configure --with-default-snmp-version=1 --with-sys-contact="@@no.where" -with-sys-location="location" --with-logfile="/tmp/snmpd.log" --with-persistent-directory="/var/net-snmp"
make -j 3
sudo make install
cd ..

cd zabbix-${ZABBIX_VERSION}
./configure --prefix=$(pwd)/install --enable-proxy --with-net-snmp --with-sqlite3 --enable-static
make -j 3

