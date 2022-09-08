cask "netclient" do
  arch = Hardware::CPU.intel? ? "amd64" : "arm64"
  version "0.15.1"

  if Hardware::CPU.intel?
    sha256 "a0383e6c78734c39c04eed54ffefae5dcdebe8321a89469657b429930ab44287"
  else
    sha256 "c60608f8c7150e89b8810efd4e1cdc3b74138a7ee511442bf87616ff12cb70c4"
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
    xattr -c "/opt/homebrew/bin/netclient"
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

