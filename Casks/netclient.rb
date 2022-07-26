cask "netclient" do
  arch = Hardware::CPU.intel? ? "amd64" : "arm64"
  version "0.14.6"

  if Hardware::CPU.intel?
    sha256 "d54ed56cf1bfcbcd626c8ba16391a5e226d0599e08f1dbf6420a7ae2e7a67bde"
  else
    sha256 "9f2bb7bb9c4f002496de87f3e370d14701b1fd0a128d25d2d9f6e66494f38f98"
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

