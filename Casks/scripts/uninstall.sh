#! /usr/local/bin/bash

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin
if [ -f /usr/local/bin/netclient ]; then
        netclient uninstall
fi
rm /var/log/com.gravitl.netclient.log