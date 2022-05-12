cask "netclient" do
  version "0.14.1"
  sha256 "5f8167f5efc54abe3b97b69fec4ade07abdc10ea5cf19d904a405b4530c72a20"

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

