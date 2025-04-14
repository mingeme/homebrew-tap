class Fuckmit < Formula
  desc "AI-powered git commit message generator"
  homepage "https://github.com/mingeme/fuckmit"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mingeme/fuckmit/releases/download/v#{version}/fuckmit-macos-arm64-#{version}"
      sha256 "1ebaf4a51d9435394d354983f82bd907cc284a40b501d4e32e69a05d6380041e"
    elsif Hardware::CPU.intel?
      url "https://github.com/mingeme/fuckmit/releases/download/v#{version}/fuckmit-macos-amd64-#{version}"
      sha256 "dc3d1c8bee985a7992bc8271b5800e730a2d724ac901f86cebe3e94015d1d6d4"
    end
  end

  def install
    bin.install "fuckmit-macos-arm64-#{version}" => "fuckmit" if Hardware::CPU.arm?
    bin.install "fuckmit-macos-amd64-#{version}" => "fuckmit" if Hardware::CPU.intel?
    chmod 0755, bin/"fuckmit"
  end

  test do
    assert_match "fuckmit #{version}", shell_output("#{bin}/fuckmit --version")
  end
end
