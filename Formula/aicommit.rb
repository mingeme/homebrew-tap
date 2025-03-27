class Aicommit < Formula
  desc "AI-powered git commit message generator"
  homepage "https://github.com/mingeme/aicommit"
  url "https://github.com/mingeme/aicommit/releases/download/v0.1.12/aicommit-0.1.12.tar.gz"
  sha256 "58fef0454f87e0a0882c386583d43c7a87d5e6c16f3fb6f44955335185cd1db3" # Replace with actual SHA256 after release
  license "MIT"

  depends_on "node"
  depends_on "pnpm"

  def install
    system "pnpm", "install", "--frozen-lockfile"
    system "pnpm", "run", "build"
    
    # Create the directory structure
    libexec.install Dir["*"]
    
    # Create bin symlink
    (bin/"aicommit").write <<~EOS
      #!/bin/bash
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/dist/index.js" "$@"
    EOS
  end

  test do
    assert_match "AI-powered git commit message generator", shell_output("#{bin}/aicommit --help")
  end
end
