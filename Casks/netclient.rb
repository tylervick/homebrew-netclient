cask "netclient" do
  arch = Hardware::CPU.intel? ? "amd64" : "arm64"
  version "0.17.0"

  if Hardware::CPU.intel?
    sha256 "e110907bd607ecea3b66800ca8cff1cf47e5b7e54085c5c72971163bf7ad7b78"
  else
    sha256 "eab98a0053a742d771c854e897cb30c65f3b3adebe0a007212642a14953f94b9"
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

