class Fuckmit < Formula
  desc "AI-powered git commit message generator"
  homepage "https://github.com/mingeme/fuckmit"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mingeme/fuckmit/releases/download/v#{version}/fuckmit-darwin-aarch64-#{version}.tar.gz"
      sha256 "8e616b43ade76e24dd7142a31c311edfa5d39e8c1ba33547cc202c30b70938f8"
    elsif Hardware::CPU.intel?
      url "https://github.com/mingeme/fuckmit/releases/download/v#{version}/fuckmit-darwin-x86_64-#{version}.tar.gz"
      sha256 "63cb760f19385d6be9f34c9f0351b49e95eaef46a2feb547122e7dd1da8fa7a5"
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
