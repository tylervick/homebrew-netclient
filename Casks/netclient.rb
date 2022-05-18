cask "netclient" do
  arch = Hardware::CPU.intel? ? "" : "-arm64"
    version "0.14.0"
  if Hardware::CPU.intel?
    sha256 "d73af7a49532ebf251db661f5cc22506c2062c66b4a6739d119b34a822dce1a3"
  else
    sha256 "4022f19e0e409992f2789fad3b9292b491adfa556c94a19d236a11dd59924cde"
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

