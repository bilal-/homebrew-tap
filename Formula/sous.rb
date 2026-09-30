class Sous < Formula
  desc "One list of what is waiting on you, across every project"
  homepage "https://github.com/bilal-/sous"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.3.0/sous_0.3.0_darwin_arm64.tar.gz"
      sha256 "3d9ccd8947179dab9e96caebf342f53e66e2119a9495772c8902d2d5c3ab4aa4"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.3.0/sous_0.3.0_darwin_amd64.tar.gz"
      sha256 "f3b72c3cbab357a67f21be9e7a8dee1c3b11aa5a8ce4ec5e8dce87f84ed8d144"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.3.0/sous_0.3.0_linux_arm64.tar.gz"
      sha256 "c7be1199a9ba95d9ce8de17b6305f66ed0952403f62d1314c7f7cc8c2e439a60"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.3.0/sous_0.3.0_linux_amd64.tar.gz"
      sha256 "1935a2e03c7aa607143c3aefc65f9fd96c2af4dbd21a2e666af93093cb3694d2"
    end
  end

  def install
    bin.install "sous"
  end

  def caveats
    <<~EOS
      Run this once to add the session hooks, the agent skill and the shell snippet:
        sous setup
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sous version")
  end
end
