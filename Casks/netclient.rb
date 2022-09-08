cask "netclient" do
  arch = Hardware::CPU.intel? ? "amd64" : "arm64"
  version "0.15.1"

  if Hardware::CPU.intel?
    sha256 "d4d205c9b7b797e2164a6347f1f8e586448af6a469e5230a72a7b6c16e502501"
  else
    sha256 "6b67698700a91b105e22fab15bdadc62f7ee4f77e541afeb0f91c8516650eccc"
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

