class D1v < Formula
  desc "Command-line interface for d1v.ai"
  homepage "https://www.d1v.ai"
  version "0.1.41"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.41/d1v-aarch64-apple-darwin.tar.gz"
      sha256 "29a0bb2879cefeb4470d28bf15f9da80c66f1e363db8561cd9d7545fee3234d1"
    else
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.41/d1v-x86_64-apple-darwin.tar.gz"
      sha256 "5016e2feff197869be6c9ec493ed9fb93315134c306a236405fae3f50c67a04c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.41/d1v-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f37b91d9f9b3761c17b48ce4bb46a40776629322afc0f10044b4bfdf7060e167"
    else
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.41/d1v-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "03975dc623efc88f33b6ca43923078e11aad0de770e547ab66214412fe7fdfb2"
    end
  end

  def install
    bin.install "d1v"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/d1v --version")
  end
end
