class Fuckmit < Formula
  desc "AI-powered git commit message generator"
  homepage "https://github.com/mingeme/fuckmit"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mingeme/fuckmit/releases/download/v0.1.0/fuckmit-macos-arm64-0.1.0"
      sha256 "841dd5f66890364091b36b95cea7e7ca81b8f57055767dc4e7de11c9aabcfd7c"
    elsif Hardware::CPU.intel?
      url "https://github.com/mingeme/fuckmit/releases/download/v0.1.0/fuckmit-macos-amd64-0.1.0"
      sha256 "e0251feb72129da3135edbba72ad3e2cb5d6e61ef8ae4c2eef0c074e78b20103"
    end
  end

  def install
    bin.install "fuckmit-macos-arm64-0.1.0" => "fuckmit" if Hardware::CPU.arm?
    bin.install "fuckmit-macos-amd64-0.1.0" => "fuckmit" if Hardware::CPU.intel?
    chmod 0755, bin/"fuckmit"
  end

  test do
    assert_match "fuckmit 0.1.0", shell_output("#{bin}/fuckmit --version")
  end
end
