class D1v < Formula
  desc "Command-line interface for d1v.ai"
  homepage "https://www.d1v.ai"
  version "0.1.27"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.27/d1v-aarch64-apple-darwin.tar.gz"
      sha256 "ad6d247a4a363ec04d494f276795491d1d2486cd20641bca2e1b216df4322173"
    else
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.27/d1v-x86_64-apple-darwin.tar.gz"
      sha256 "6a0b242bde46113b0d42ce68500bba69197e365f9ac55685574ebda5ce6296cb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.27/d1v-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7b0871b3f929d1631917020e18f2c3eeb05a3c53768d42b9c538ba972255c0ab"
    else
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.27/d1v-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "29b64777ec9f99baba766f5a2e0a302b718198256ed9d90abb2db16f667cdd47"
    end
  end

  def install
    bin.install "d1v"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/d1v --version")
  end
end
