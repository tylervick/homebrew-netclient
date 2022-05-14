cask "netclient" do
  version "0.14.1"
  sha256 "f9437798e71064f05922ba0a4fc66f7b6e1afc055c92bc53a19ddccd63807499"

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

