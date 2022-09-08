cask "netclient" do
  arch = Hardware::CPU.intel? ? "amd64" : "arm64"
  version "0.15.1"

  if Hardware::CPU.intel?
    sha256 "943455710fce1d59bc8088ae87d984f00c230c12addf318fb38a6f7260b4ded3"
  else
    sha256 "6151629fecd63ee19e1006bcce2cba324b4d283b54188b7ad8763663ad11f951"
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

