#!/usr/local/bin/bash

cp /usr/local/Caskroom/netclient/VERSION/com.gravitl.netclient.plist /Library/LaunchDaemons/
chown root /Library/LaunchDaemons/com.gravitl.netclient.plist
launchctl load /Library/LaunchDaemons/com.gravitl.netclient.plist

