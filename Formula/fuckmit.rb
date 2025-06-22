class Fuckmit < Formula
  desc "AI-powered git commit message generator"
  homepage "https://github.com/mingeme/fuckmit"
  version "0.3.0-alpha.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mingeme/fuckmit/releases/download/v#{version}/fuckmit-darwin-aarch64-#{version}.tar.gz"
      sha256 "dcd1bf3423a5252dee14fbaadedf7c7141b01b6f55842580a5d07431edc451ef"
    elsif Hardware::CPU.intel?
      url "https://github.com/mingeme/fuckmit/releases/download/v#{version}/fuckmit-darwin-x86_64-#{version}.tar.gz"
      sha256 "2e93078aac4af4e1e3547e5cb54e091d25af870ce74530fab6cc4333a57826cd"
    end
  end

  def install
    bin.install "fuckmit" => "fuckmit"
    chmod 0755, bin/"fuckmit"
  end

  test do
    assert_match "fuckmit #{version}", shell_output("#{bin}/fuckmit --version")
  end
end
