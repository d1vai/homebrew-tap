class D1v < Formula
  desc "Command-line interface for d1v.ai"
  homepage "https://www.d1v.ai"
  version "0.1.45"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.45/d1v-aarch64-apple-darwin.tar.gz"
      sha256 "653c9ffc71d71f6aba9e95a54e77f15c2d5720a31ab280818d8ae19302efc88d"
    else
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.45/d1v-x86_64-apple-darwin.tar.gz"
      sha256 "fe1b50a0ab45aafc61c180cae646bccf08ab8b386900f7d00c7841fce940046e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.45/d1v-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1aa691a256e92c14ed4d0d42f41aaaf4395cbd9acec95624672882c6ef85feca"
    else
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.45/d1v-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e7a5bfab98935d5fe05f13a0fe49d0368894aa608c61c6dfada19d24d47ccad4"
    end
  end

  def install
    bin.install "d1v"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/d1v --version")
  end
end
