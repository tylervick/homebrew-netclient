cask "netclient" do
  arch = Hardware::CPU.intel? ? "amd64" : "arm64"
  version "0.14.6"

  if Hardware::CPU.intel?
    sha256 "fc2d83bdaa113d683ba8455dfbb04caea76769553768ca4bce43c91508f62830"
  else
    sha256 "f7193c183ad9ebade805a4bc787d0fbaaec57f55d8b4c5b33da491e5267ceb72"
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

