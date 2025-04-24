class Fuckmit < Formula
  desc "AI-powered git commit message generator"
  homepage "https://github.com/mingeme/fuckmit"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mingeme/fuckmit/releases/download/v#{version}/fuckmit-darwin-aarch64-#{version}.tar.gz"
      sha256 "869a8be185d5e30c19afc535f8b99a34f73e173c520531dbed8dc6f587d16f2a"
    elsif Hardware::CPU.intel?
      url "https://github.com/mingeme/fuckmit/releases/download/v#{version}/fuckmit-darwin-x86_64-#{version}.tar.gz"
      sha256 "8105f2753ab0261c15e46fa578220d1ac676906fc3eec9e6f5d347e33ec5f899"
    end
  end

  def install
    tar = "fuckmit-darwin-aarch64-#{version}.tar.gz" if Hardware::CPU.arm?
    tar = "fuckmit-darwin-x86_64-#{version}.tar.gz" if Hardware::CPU.intel?
    system "tar", "-xvf", tar
    bin.install "fuckmit" => "fuckmit"
    chmod 0755, bin/"fuckmit"
  end

  test do
    assert_match "fuckmit #{version}", shell_output("#{bin}/fuckmit --version")
  end
end
