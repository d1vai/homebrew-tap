class D1v < Formula
  desc "Command-line interface for d1v.ai"
  homepage "https://www.d1v.ai"
  version "0.1.42"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.42/d1v-aarch64-apple-darwin.tar.gz"
      sha256 "15ca3b5971a49943f82b034e326eafa1c277ba7422ee49bf24b948ec898a1919"
    else
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.42/d1v-x86_64-apple-darwin.tar.gz"
      sha256 "573221d40476d0490e892609b16410c09b4572c14de39e89bc90b5f98e655a5b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.42/d1v-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c5d901982655165daea564629b52536bb63bf9e4363eb86f82dde13f5f8a7dd2"
    else
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.42/d1v-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "af1b30b2df61a2a7b8ba923bb86163138c45dcdcb2d25c1c2162e29b09fa3465"
    end
  end

  def install
    bin.install "d1v"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/d1v --version")
  end
end
