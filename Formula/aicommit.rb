class Aicommit < Formula
  desc "AI-powered git commit message generator"
  homepage "https://github.com/mingeme/aicommit"
  url "https://github.com/mingeme/aicommit/releases/download/v0.1.9/aicommit-0.1.9.tar.gz"
  sha256 "bd41e694ab6c5248d68291b98efe00c58d453965a5f0e60965c004eb24a704b0" # Replace with actual SHA256 after release
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
