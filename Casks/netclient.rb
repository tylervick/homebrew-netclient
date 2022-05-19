cask "netclient" do
  arch = Hardware::CPU.intel? ? "amd64" : "arm64"
    version "0.14.0"

  if Hardware::CPU.intel?
    sha256 0db17817a6ffc9faaacd424163482347c72862b77e5b3a391d486ed7bc03fe54
  else
    sha256 41f82d49b913e4bd58fca92f280bb0c48ee27480e9db1b19a1d16035207a02b4
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

