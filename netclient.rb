cask "netclient" do
  version "0.14.1"
  sha256 :no_check

 url "https://fileserver.clustercat.com/netclient.tgz",
    verified: "https://fileserver.clustercat.com"
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

