class D1v < Formula
  desc "Command-line interface for d1v.ai"
  homepage "https://www.d1v.ai"
  version "0.1.33"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.33/d1v-aarch64-apple-darwin.tar.gz"
      sha256 "8349d15e47f850404fa527e0ffb54c875d0dd94a4524d5fa9a568c95640d63be"
    else
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.33/d1v-x86_64-apple-darwin.tar.gz"
      sha256 "f5d606771c84afb1d25a5d41e356034aafd347eb380e227356300d57754d1948"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.33/d1v-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ba48d877667a7be2dec2bb1be90c43510c474cd22acdf5abce34af3a33edfaf9"
    else
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.33/d1v-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5379fd271f91e163ab571f9e87ae8f9687c15a19e6cecbd70e9f0779b09668f6"
    end
  end

  def install
    bin.install "d1v"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/d1v --version")
  end
end
