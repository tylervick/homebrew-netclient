cask "netclient" do
  version "0.14.1"
  sha256 "d5fe8160817b3b33b5a0a4c02b88d1d8f6f47efd2127b8d5b4676c370bcd5e24"

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

  installer script: {
    executable: "#{staged_path}/install.sh",
    sudo: true,
  }

  uninstall script: {
    executable: "#{staged_path}/uninstall.sh",
    sudo: true,
  }
end

