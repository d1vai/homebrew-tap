class D1v < Formula
  desc "Command-line interface for d1v.ai"
  homepage "https://www.d1v.ai"
  version "0.1.34"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.34/d1v-aarch64-apple-darwin.tar.gz"
      sha256 "74d774f74c1339fbb0cb4e20de596d9ac7bffd30c95b19da96a6370f7168bfc1"
    else
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.34/d1v-x86_64-apple-darwin.tar.gz"
      sha256 "38ea3a1d91eb5a0b8357718ac1967cfbac7ba176334cc1493178735db0159f95"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.34/d1v-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7e3051ca4be9be83fb5b7c6ceb33b16b920b15a56fa7509ace6128000576b2d1"
    else
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.34/d1v-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6d1b169ad56f9fb19d20c83bcc2c7bae6b911aa33922df6009d4484dd4e92deb"
    end
  end

  def install
    bin.install "d1v"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/d1v --version")
  end
end
