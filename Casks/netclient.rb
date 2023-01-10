cask "netclient" do
  arch = Hardware::CPU.intel? ? "amd64" : "arm64"
  version "0.17.1"

  if Hardware::CPU.intel?
    sha256 "059aa898cd9ab2fbc44e5ca19d4c791b1261321009b63f5ca243ee816c6dda53"
  else
    sha256 "fcadaab6a480e1a5d184e5604e3fb2d885b479e602d66d6e664eb757480e67cd"
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

  uninstall script: {
    executable: "#{staged_path}/blank.sh",
  }

  zap script: {
    executable: "#{staged_path}/uninstall.sh",
    sudo: true,
  }

  uninstall script: {
  }
end

