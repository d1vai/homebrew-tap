class D1v < Formula
  desc "Command-line interface for d1v.ai"
  homepage "https://www.d1v.ai"
  version "0.1.38"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.38/d1v-aarch64-apple-darwin.tar.gz"
      sha256 "93be14413b536a69501c5ea88f1ccc0983df53172efd382c772a527375bd0120"
    else
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.38/d1v-x86_64-apple-darwin.tar.gz"
      sha256 "655b7fe6ed2ef3a38cd5cca788566c0d40edada5c2f3f588f3f3cb485efad74d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.38/d1v-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c4f558a721c6025880f22b4842a7ef9fda73247304239db024ff7d8ef08bf354"
    else
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.38/d1v-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e5239ebb775bf365846ae2b5e5fcffeae2415114eac852eb788c9d175bab4924"
    end
  end

  def install
    bin.install "d1v"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/d1v --version")
  end
end
