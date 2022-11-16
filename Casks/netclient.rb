cask "netclient" do
  arch = Hardware::CPU.intel? ? "amd64" : "arm64"
  version "0.16.3"

  if Hardware::CPU.intel?
    sha256 "ce9d4c9ca95cdedf0b4e6f9d8a6acc7acd20595baa0771624615f50dc6371825"
  else
    sha256 "84d4ffb66029eec5ea8bbcac6a7b6244f4dc9f2deebb3221137d1be792b48d61"
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

