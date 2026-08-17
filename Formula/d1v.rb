class D1v < Formula
  desc "Command-line interface for d1v.ai"
  homepage "https://www.d1v.ai"
  version "0.1.23"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.23/d1v-aarch64-apple-darwin.tar.gz"
      sha256 "be27db15e8ed4ce40f657c1fd700b2f678e821c604443e4443ce091ee9e7c71d"
    else
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.23/d1v-x86_64-apple-darwin.tar.gz"
      sha256 "260fbf55eb544fb6deb99ce181c1b402f2a5eeabd4f04902c38706a91b565884"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.23/d1v-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "72182e190655963529788ec9825d4bbe59d7b653c24da4c9ff7d37a7864a3760"
    else
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.23/d1v-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fd9a75516b8bca01cc72e44edb728da076efed128b0f528606b4e7bd723c5ac9"
    end
  end

  def install
    bin.install "d1v"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/d1v --version")
  end
end
