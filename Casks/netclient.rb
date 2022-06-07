cask "netclient" do
  arch = Hardware::CPU.intel? ? "amd64" : "arm64"
    version "0.14.2"

  if Hardware::CPU.intel?
    sha256 "d42536a9649310f4fbf217764fb895b75d1581a8314fc39465d531179e540f33"
  else
    sha256 "af4957b70ebaa9a5414fe1240d8602162d1b880c204ac1b7fac53a00b4e36908"
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

  uninstall script: {
    executable: "#{staged_path}/uninstall.sh",
    sudo: true,
  }
end

