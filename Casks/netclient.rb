cask "netclient" do
  version "0.14.1"
  sha256 "6778181290780728197d61a26d4acaf0fafb204b6976765a88b423f643bcc043"

  url "https://github.com/gravitl/homebrew-netclient/releases/download/v0.1.0/netclient.tgz"
  name "netclient"
  desc "A platform for modern, blazing fast virtual networks"
  homepage "https://github.com/gravitl/netmaker"
  depends_on formula: "wireguard-tools"
  binary "netclient",  target: "netclient"
  service "com.gravitl.netclient.plist"

  postflight do
    set_permissions "/Applications/netclient", '0755'
  end

  uninstall script: {
    executable: "/usr/local/bin/netclient",
    args: "uninstall",
    sudo: true,
  }
    launchctl: [
      'com.gravitl.netclient'
  ]
end

