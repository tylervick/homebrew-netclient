cask "netclient" do
  arch = Hardware::CPU.intel? ? "amd64" : "arm64"
  version "0.14.4"

  if Hardware::CPU.intel?
    sha256 "f3a8eabace2eee0496151c769ad96776d14173752fc47928aefeeaa43075626e"
  else
    sha256 "61080bc532918947ef95d630591e45b1ed26c4d2215ad827e758d97a984d36d3"
  end

  url "https://fileserver.netmaker.org/v#{version}/darwin/netclient-#{arch}.tgz"
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

  zap script: {
    executable: "#{staged_path}/uninstall.sh",
    sudo: true,
  }
end

