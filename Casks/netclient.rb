cask "netclient" do
  version "0.14.1"
  sha256 "560c0946b0d60338f84d9f24369e9d98baa17966e52a86c2d35635711c51a177"

  url "https://github.com/gravitl/homebrew-netclient/releases/download/v0.1.0/netclient.tgz"
  name "netclient"
  desc "A platform for modern, blazing fast virtual networks"
  homepage "https://github.com/gravitl/netmaker"
  depends_on formula: "wireguard-tools"
  binary "netclient",  target: "netclient"

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

