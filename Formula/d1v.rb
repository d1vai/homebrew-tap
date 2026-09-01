class D1v < Formula
  desc "Command-line interface for d1v.ai"
  homepage "https://www.d1v.ai"
  version "0.1.35"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.35/d1v-aarch64-apple-darwin.tar.gz"
      sha256 "e2b2642264bc90c3a03593764da1a8ffa84bc10a63c55b21d332a4803908d0a8"
    else
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.35/d1v-x86_64-apple-darwin.tar.gz"
      sha256 "08eb85185551df6d1d293605061f8c6e4f41fce9571a8469ece4299aa197850d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.35/d1v-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "71533083e7b36288e0d639b756cf738cdbfe46dec6532146df7a80bed157a10a"
    else
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.35/d1v-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "95ca146f11a4251977546d7f1e0eea1b514abac36be0448ba0efaa0ef7c01e6d"
    end
  end

  def install
    bin.install "d1v"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/d1v --version")
  end
end
