A minimal, opinionated, distribution of Zabbix Proxy.

The main purpose of this is to run zabbix-proxy on hosts that run on sd cards (e.g. Raspberry) without cooking them.
This relies on the binaries installed from your distribution's repositories (as from the instructions at https://www.zabbix.com/download), but wrap the zabbix-proxy service with a different systemd module.

The trivia is to create a tmpfs mount (under `/opt/mini-zabbix/tmp`) and store the DB there.
This won't survive reboots, but it's usually fine and it provides a simple way to have a non-persistent, non-sd-cooking, cache.
A better approach would be to use  something like log2ram, but Zabbix may not be happy to restart "from an old point in time", e.g. after a reboot.



# How to

- Install zabbix-proxy-sqlite3 following instructions at https://www.zabbix.com/download
- **Don't enable the systemd service**
- Get this `git clone https://github.com/MassimoGirondi/mini-zabbix.git`
- Modify  `zabbix_proxy.conf` accordingly to your setup - mostly the Server parameter is what matters
- Install it: `sudo ./install.sh`
- Check it works: `sudo systemctl status mini-zabbix-proxy` and `sudo systemctl status mini-zabbix-storage`




# Copyright

The scripts in this repository are distributed under the GNU GPL v3 license.

(C) 2023 Massimo Girondi
