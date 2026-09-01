class D1v < Formula
  desc "Command-line interface for d1v.ai"
  homepage "https://www.d1v.ai"
  version "0.1.37"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.37/d1v-aarch64-apple-darwin.tar.gz"
      sha256 "6553c35470d3a7f9e54a26a700e113a76b98d38483b3db2b105340a357b4cded"
    else
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.37/d1v-x86_64-apple-darwin.tar.gz"
      sha256 "192d289a312fb83224ce152b85ae05803da1b4fc4d824e0c0d5d26fd63781c52"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.37/d1v-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "684c3f2ea21b21fc437bfff02f024f596e99c7f18030681cb44e5467cc6e3b66"
    else
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.37/d1v-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cc47388606e1c946cfe706038f8831b1f6e230c8889c3f88a1fd8a738227ec8e"
    end
  end

  def install
    bin.install "d1v"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/d1v --version")
  end
end
