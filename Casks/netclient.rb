cask "netclient" do
  arch = Hardware::CPU.intel? ? "amd64" : "arm64"
    version 0.14.1

  if Hardware::CPU.intel?
    sha256 e691666554984b5ffa6cb3d6303b262dc13650f9d273806b668ed68fa4335812
  else
    sha256 e590cddb8c61406798644436bd222a1fca63c9d48ba7f56e48056736f673c4c6
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

