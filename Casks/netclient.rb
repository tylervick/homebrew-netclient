cask "netclient" do
  arch = Hardware::CPU.intel? ? "" : "-arm64"
    version 0.14.0
  if Hardware::CPU.intel?
    sha256 60e2101a3511d4dc4369e28fbbbfa871bc99a351a72b6118d8eaf24a248edd02
  else
    sha256 70811c50aa9cb022b8725fb5cbc11dd1eb4b0bd244712bcd45ad1f71c62a746a
  end

  url "https://github.com/gravitl/homebrew-netclient/releases/download/#{version}/netclient-#{arch}.tgz"
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

