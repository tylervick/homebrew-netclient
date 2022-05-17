cask "netclient" do
  version "0.14.0"
  sha256 "b1e4e9769d3ecc3ae7170408d17de804181f498d753db9998105f818e5045c2a"

  url "https://github.com/gravitl/homebrew-netclient/releases/download/v0.14.0/netclient.tgz"
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

