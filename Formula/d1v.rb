class D1v < Formula
  desc "Command-line interface for d1v.ai"
  homepage "https://www.d1v.ai"
  version "0.1.43"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.43/d1v-aarch64-apple-darwin.tar.gz"
      sha256 "172ec514f038b707f6eb090d333fcaaad5d2c8e5b9188e4c1856bdc4c35cf058"
    else
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.43/d1v-x86_64-apple-darwin.tar.gz"
      sha256 "91aafad05fc84c606851b88d564fdc741c6d8ee2bf7af3b36dc68614f7edf691"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.43/d1v-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "82e308f2eeb2ee71f327d616d9e716da5d9d4e6f7254f1593b08b7be8c3f9163"
    else
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.43/d1v-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1af39211a9ee150d7d293936947bc6e24b2470c13a36b6790e053847ad982a8a"
    end
  end

  def install
    bin.install "d1v"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/d1v --version")
  end
end
