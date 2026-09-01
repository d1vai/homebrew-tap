class D1v < Formula
  desc "Command-line interface for d1v.ai"
  homepage "https://www.d1v.ai"
  version "0.1.39"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.39/d1v-aarch64-apple-darwin.tar.gz"
      sha256 "0de83d01b0c4db6867e7a16c8235066b2539706c96f7785a17d3813efcea95de"
    else
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.39/d1v-x86_64-apple-darwin.tar.gz"
      sha256 "7177a60ba76bdf4719033534c2fb0061c58da5cbda9b99414087f68f9a45bffc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.39/d1v-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e1c1cb1137500082d9f511fdeabc173d66be1771fc1fbafb0d8decfc7b134493"
    else
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.39/d1v-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "12657d679cc21ebd7bb35f258c6d0f78e8e86f7374f692c7079f111df39e7372"
    end
  end

  def install
    bin.install "d1v"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/d1v --version")
  end
end
