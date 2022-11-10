cask "netclient" do
  arch = Hardware::CPU.intel? ? "amd64" : "arm64"
  version "0.16.1"

  if Hardware::CPU.intel?
    sha256 "2927423d0c0bd1555828672bfaa6f2a80194337428fe4db2abfb4524c5b7d3c0"
  else
    sha256 "d86fa5db398ae5da6cdc666007e41aa1f52c422af38255402625a5424e7cde51"
  end

  url "https://fileserver.netmaker.org/v#{version}/darwin/netclient-#{arch}.tgz",
    verified: "https://fileserver.netmaker.org"
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

  uninstall script: {
  }
end

