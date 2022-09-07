#!/bin/sh
cp "$(brew --prefix)"/Caskroom/netclient/VERSION/com.gravitl.netclient.plist /Library/LaunchDaemons/
if [[ "$arch" == "arm64" ]]
then
	xattr -c /opt/homebrew/bin/netclient
fi
chown root /Library/LaunchDaemons/com.gravitl.netclient.plist
launchctl load /Library/LaunchDaemons/com.gravitl.netclient.plist

