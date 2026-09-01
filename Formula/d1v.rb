class D1v < Formula
  desc "Command-line interface for d1v.ai"
  homepage "https://www.d1v.ai"
  version "0.1.31"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.31/d1v-aarch64-apple-darwin.tar.gz"
      sha256 "9b431ec51a4bf4fc515bca8b93dcfdb9372f2323addfd5c0449264558d008498"
    else
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.31/d1v-x86_64-apple-darwin.tar.gz"
      sha256 "a2884e16a9b72f78344f3e7694f5968886e562e7aae8458cf71eceeec820475f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.31/d1v-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "81339afcc55a6a08643356d70861a88a51f2cedd186afef47c2a9b02aa2faf09"
    else
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.31/d1v-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "61fc1494bbefbc330aade9b3e4ff907135d360990f0ac57d55b0571c5c21bfc0"
    end
  end

  def install
    bin.install "d1v"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/d1v --version")
  end
end
