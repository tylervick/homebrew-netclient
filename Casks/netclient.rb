cask "netclient" do
  arch = Hardware::CPU.intel? ? "amd64" : "arm64"
  version "0.15.0"

  if Hardware::CPU.intel?
    sha256 "ffe7d64ee635480cf00e6c409efcedf9fb9a3e85ec3c9a2dcddf9cb02c1a9f58"
  else
    sha256 "3582347586827df8aa2d26d9b307dc1fec4ad0532d1247d057c2c7cb49dae078"
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

