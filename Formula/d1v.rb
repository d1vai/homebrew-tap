class D1v < Formula
  desc "Command-line interface for d1v.ai"
  homepage "https://www.d1v.ai"
  version "0.1.44"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.44/d1v-aarch64-apple-darwin.tar.gz"
      sha256 "5402d15dc1621d94e2e7598943f09c9d6241bc1b5a259654c57db7281f7d9fc9"
    else
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.44/d1v-x86_64-apple-darwin.tar.gz"
      sha256 "2bf6b729ced954ee3276c13ffa68f09cebff53de339b41a5d86be4ddeea761f0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.44/d1v-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a74b522f3e1b80aa8634c228c373485f5044629fc86a06bf65ce70a0b867521a"
    else
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.44/d1v-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "87624191cda7f39038a2d5db63ed08cad81188e175d8d83a3ac2aa39447ac315"
    end
  end

  def install
    bin.install "d1v"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/d1v --version")
  end
end
