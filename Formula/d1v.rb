class D1v < Formula
  desc "Command-line interface for d1v.ai"
  homepage "https://www.d1v.ai"
  version "0.1.32"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.32/d1v-aarch64-apple-darwin.tar.gz"
      sha256 "dfafe5f795e8f8000f3b75e7dc6f11d741b3e18b4620d5365e954ccbafcd9428"
    else
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.32/d1v-x86_64-apple-darwin.tar.gz"
      sha256 "f463618649a8157bd0a5c46fb86698da4631b811c49f958f948e7c3082b7f61e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.32/d1v-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cc9999c7d8ecc617a1e33d7de2f55de2725c24e39ca171ca29ce4b5dc38a0c7f"
    else
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.32/d1v-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "29128a3323f5de3166cf34534df7b9a80de5aadb16c628c184bd40364b59a968"
    end
  end

  def install
    bin.install "d1v"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/d1v --version")
  end
end
