#!/bin/sh
cp "$(brew --prefix)"/Caskroom/netclient/VERSION/com.gravitl.netclient.plist /Library/LaunchDaemons/
chmod 0775 -c "$(brew --prefix)"/bin/netclient
xattr -c "$(brew --prefix)"/bin/netclient
chown root /Library/LaunchDaemons/com.gravitl.netclient.plist
launchctl load /Library/LaunchDaemons/com.gravitl.netclient.plist

