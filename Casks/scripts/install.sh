#!/bin/sh
arch = $(uname -m)
if [ $arch = "x86_64" ]
then
	cp $(brew --prefix)/Caskroom/netclient/VERSION/com.gravitl.netclient.plist /Library/LaunchDaemons/
else
	cp $(brew --prefix)/Caskroom/netclient/VERSION/com.gravitl.netclient.plist.m1 /Library/LaunchDaemons/
	xattr -c /opt/homebrew/bin/netclient
fi
chown root /Library/LaunchDaemons/com.gravitl.netclient.plist
launchctl load /Library/LaunchDaemons/com.gravitl.netclient.plist

