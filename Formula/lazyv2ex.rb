class Lazyv2ex < Formula
  desc "Simple terminal UI for v2ex.com"
  homepage "https://github.com/mingeme/lazyv2ex"
  version "0.0.1"
  license "MIT"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mingeme/lazyv2ex/releases/download/v#{version}/lazyv2ex-macos-arm64"
      sha256 "5d67e68a30bb6604e7924f6a871a56514223c7162fe68ef82a8fb1c47550c07a"
    elsif Hardware::CPU.intel?
      url "https://github.com/mingeme/lazyv2ex/releases/download/v#{version}/lazyv2ex-macos-amd64"
      sha256 "064770e160135e5b8d776a0f506dd8db9fc6ab00f8e2ccd820e05ef21a6b83b8"
    end
  end

  def install
    bin.install "lazyv2ex-macos-arm64" => "lazyv2ex" if Hardware::CPU.arm?
    bin.install "lazyv2ex-macos-amd64" => "lazyv2ex" if Hardware::CPU.intel?
    chmod 0755, bin/"lazyv2ex"
  end

  test do
    assert_match "A command-line client for v2ex", shell_output("#{bin}/lazyv2ex --version")
  end
end
