cask "netclient" do
  arch = Hardware::CPU.intel? ? "amd64" : "arm64"
    version 0.14.2

  if Hardware::CPU.intel?
    sha256 "86bec3041cf823574b8a7acfce7023c21784fffb6ac4a3f494a84224e95e8dbe"
  else
    sha256 "dcab5735ff41d356fbe0f1158423cfc2ae2214e72436aec90c9bd7d168e48642"
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

