class D1v < Formula
  desc "Command-line interface for d1v.ai"
  homepage "https://www.d1v.ai"
  version "0.1.24"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.24/d1v-aarch64-apple-darwin.tar.gz"
      sha256 "ee14f6d0e97f0a7b7662b91b753681a4ca95d8fb192c3728d20e0160f21c567e"
    else
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.24/d1v-x86_64-apple-darwin.tar.gz"
      sha256 "33d6c3412fb20ae1096390e8dba340f83a0ad60430c0b78eeb5cdf2fc4b1498c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.24/d1v-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "23e03342342507fc6f9c4893569fda8c25e90e8ad7b8e6ab0648de94b49d2711"
    else
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.24/d1v-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2c4b9fd3091a4cab60c8b298295c839aff8a2c9e71ad6c2cb56b338d1c9669b2"
    end
  end

  def install
    bin.install "d1v"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/d1v --version")
  end
end
