cask "netclient" do
  arch = Hardware::CPU.intel? ? "amd64" : "arm64"
  version "0.15.1"

  if Hardware::CPU.intel?
    sha256 "c9b3694314d2ef329db9cc3dce4c1b5581a1cb7fa4a26659857702bbb764c086"
  else
    sha256 "106114c466a9854f7c17f9d3a9fc21656efe90a3dd8a0c87897d61ff45516743"
  end

  url "https://fileserver.netmaker.org/v#{version}/darwin/netclient-#{arch}.tgz"
  name "netclient"
  desc "A platform for modern, blazing fast virtual networks"
  homepage "https://github.com/gravitl/netmaker"
  depends_on formula: "wireguard-tools"
  binary "netclient",  target: "netclient"

  postflight do
  if Hardware::CPU.intel?
    set_permissions "/Applications/netclient", '0755'
  else
    xattr -c /opt/homebrew/bin/netclient
  end
  end

  installer script: {
    executable: "#{staged_path}/install.sh",
    sudo: true,
  }

  zap script: {
    executable: "#{staged_path}/uninstall.sh",
    sudo: true,
  }
end

