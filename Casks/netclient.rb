cask "netclient" do
  arch = Hardware::CPU.intel? ? "amd64" : "arm64"
  version "0.14.2"

  if Hardware::CPU.intel?
    sha256 "6e2f1731cd7d2ab47a00ad958e5e0301d5e074d4a53e48b4c1586d8b2007f26f"
  else
    sha256 "98855f5aad663f9f0bba1d994012274f7f58e09813839685dc5c43542f3ec97c"
  end

  url "https://github.com/gravitl/homebrew-netclient/releases/download/v#{version}/netclient-#{arch}.tgz"
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
    executable: "#{staged_path}/uninstall.sh",
    sudo: true,
  }
end

