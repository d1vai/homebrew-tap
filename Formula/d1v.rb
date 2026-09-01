class D1v < Formula
  desc "Command-line interface for d1v.ai"
  homepage "https://www.d1v.ai"
  version "0.1.30"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.30/d1v-aarch64-apple-darwin.tar.gz"
      sha256 "3467f81864fd9f095f2863cc922287d15f1166cc1522af77db888a4b368af087"
    else
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.30/d1v-x86_64-apple-darwin.tar.gz"
      sha256 "5dadb2485e2b0c7e91247d01d54dd8200f51d94cb769dccc5414b9bb651e884f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.30/d1v-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "57f7beb01b4a7ff84ef8854afad11ffb70586e8489169bbd9a89379fc88d1d9f"
    else
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.30/d1v-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6c92f83fe0af10a853513554f6bcb0e1fe7bb707b4221d300a95eddbf230ad81"
    end
  end

  def install
    bin.install "d1v"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/d1v --version")
  end
end
