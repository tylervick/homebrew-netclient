cask "netclient" do
  version "0.14.1"
  sha256 "dbc1a5efd6934ab85640096e80803b6e5e5704f551cbda525ee4e4927a2b6d52"

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

