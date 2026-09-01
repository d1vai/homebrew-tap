class D1v < Formula
  desc "Command-line interface for d1v.ai"
  homepage "https://www.d1v.ai"
  version "0.1.36"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.36/d1v-aarch64-apple-darwin.tar.gz"
      sha256 "472418ffb14a9db81933bfbab95d2798c8859a70e1070e69ee8594912d5c0acf"
    else
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.36/d1v-x86_64-apple-darwin.tar.gz"
      sha256 "51aac52666fbf24a1e4609462e33f636f95e8a40a6bc615c44a7ad8c2f01c809"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.36/d1v-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3f7112b8b4fb48af48a97cd298b1429a6d51a2f9bc3765156176c0cf847aa000"
    else
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.36/d1v-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2e868b992238b8777e827fa4d754226edaf699c3a6390f217c5e0b0623fa2b1e"
    end
  end

  def install
    bin.install "d1v"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/d1v --version")
  end
end
