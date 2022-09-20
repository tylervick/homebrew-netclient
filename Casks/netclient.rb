cask "netclient" do
  arch = Hardware::CPU.intel? ? "amd64" : "arm64"
  version "0.16.0"

  if Hardware::CPU.intel?
    sha256 "7a1621eae568304c40147ff762ea5c6571bce43cf82933bff1dcdcb8e9f08f8e"
  else
    sha256 "ef9c4949dfd8ab531a69d9d0c08a73b3eec02f6ba89ec16798bf4029d26dc780"
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

