class D1v < Formula
  desc "Command-line interface for d1v.ai"
  homepage "https://www.d1v.ai"
  version "0.1.46"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.46/d1v-aarch64-apple-darwin.tar.gz"
      sha256 "8d8abc14f126788bc64f4b3fd3e0de78d9c8b94126f57b78ad7ebfb6f86cacd7"
    else
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.46/d1v-x86_64-apple-darwin.tar.gz"
      sha256 "8d19bad8ce9e9f6f43abc037d1fb59537e423eac69e84c3b56d795b5bd61e4a3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.46/d1v-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fb94e760b27924baf12c1a851cde3258c35ac4b10e3b9f2bf0f6ed538259a2d6"
    else
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.46/d1v-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2cc6cde168fd552677789da3040691dddc27207a46bdf910db5391574fa8732e"
    end
  end

  def install
    bin.install "d1v"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/d1v --version")
  end
end
