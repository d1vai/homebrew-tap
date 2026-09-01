class D1v < Formula
  desc "Command-line interface for d1v.ai"
  homepage "https://www.d1v.ai"
  version "0.1.40"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.40/d1v-aarch64-apple-darwin.tar.gz"
      sha256 "4bdf35cc2187cb82727d976486cf597bb20e376413270f4c2117795a22ee1566"
    else
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.40/d1v-x86_64-apple-darwin.tar.gz"
      sha256 "4184d49e600627b1937e38ef6e7a905556831e185270ec36a05042819fc6ae3c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.40/d1v-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1572825ed83540e92b25d6e3552d043c25ea9e21bbd130c6a5168f9dd10b81b3"
    else
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.40/d1v-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "061200301da4ae4be082dfa4d01f499c203b9546c7f7fd65dc438da29b9b6792"
    end
  end

  def install
    bin.install "d1v"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/d1v --version")
  end
end
