class Fuckmit < Formula
  desc "AI-powered git commit message generator"
  homepage "https://github.com/mingeme/fuckmit"
  version "0.3.0-alpha.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mingeme/fuckmit/releases/download/v#{version}/fuckmit-darwin-aarch64-#{version}.tar.gz"
      sha256 "8c7584830792f56227cd64ef1f5145effae86931f55140c32cfe8eeafccbb933"
    elsif Hardware::CPU.intel?
      url "https://github.com/mingeme/fuckmit/releases/download/v#{version}/fuckmit-darwin-x86_64-#{version}.tar.gz"
      sha256 "fc90616f64805348886c60db622f5c448948d7d6983b3e72a41368e905957163"
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
