class D1v < Formula
  desc "Command-line interface for d1v.ai"
  homepage "https://www.d1v.ai"
  version "0.1.29"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.29/d1v-aarch64-apple-darwin.tar.gz"
      sha256 "98ba4714668906b73790aa38d851d08eaf5847b7e1611e2265fcc46258af7038"
    else
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.29/d1v-x86_64-apple-darwin.tar.gz"
      sha256 "aa75455cdefe666ad3eda0dcb4ffb8d48dbdd78564df634fac0993fc6b17e051"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.29/d1v-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "24953e904156da696d176f97efd192d1bebf5070c48da2c41d20edea8a8ae38e"
    else
      url "https://github.com/d1vai/d1v-cli/releases/download/v0.1.29/d1v-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "faadbce792f3d8f41fd47089e7765f6969b4345aaa51760036052ea793f9f317"
    end
  end

  def install
    bin.install "d1v"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/d1v --version")
  end
end
