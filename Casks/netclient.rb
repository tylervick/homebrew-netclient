cask "netclient" do
  version "0.14.1"
  sha256 "80482cbaa7c292145331d7bda81aaa9a45c603def78eef2997f65e06a03dc84e"

  url "https://github.com/gravitl/homebrew-netclient/raw/master/#{version}/netclient.tgz"
  name "netclient"
  desc "A platform for modern, blazing fast virtual networks"
  homepage "https://github.com/gravitl/netmaker"
  depends_on formula: "wireguard-tools"
  binary "netclient",  target: "netclient"
  service "com.gravitl.netclient.plist"

  postflight do
    set_permissions "/Applications/netclient", '0755'
  end
end

