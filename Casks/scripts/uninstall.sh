#!/bin/sh

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin
if [ -f /usr/local/bin/netclient ]; then
        netclient uninstall
fi
if [ -f /var/log/com/gravitl.netclient.log ]; then
    rm /var/log/com.gravitl.netclient.log
fi