#!/bin/sh
cp "$(brew --prefix)"/Caskroom/netclient/VERSION/com.gravitl.netclient.plist /Library/LaunchDaemons/
sudo chown root /Library/LaunchDaemons/com.gravitl.netclient.plist
sudo xttr -c "$(brew --prefix)"/bin/netclient
launchctl unload /Library/LaunchDaemons/com.gravitl.netclient.plist
launchctl load /Library/LaunchDaemons/com.gravitl.netclient.plist

