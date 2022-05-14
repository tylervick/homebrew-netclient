#!/usr/local/bin/bash

cp /usr/local/Caskroom/netclient/0.14.1/com.gravitl.netclient.plist /Library/LaunchDaemons/
chown root /Library/LaunchDaemons/com.gravitl.netclient.plist
launchctl load /Library/LaunchDaemons/com.gravitl.netclient.plist

