class Sous < Formula
  desc "One list of what is waiting on you, across every project"
  homepage "https://github.com/bilal-/sous"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.27.0/sous_0.27.0_darwin_arm64.tar.gz"
      sha256 "f3617bcef7dabbbeda9ef557ddbfce2e1f8df1762dda4f709077695df4ea8f05"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.27.0/sous_0.27.0_darwin_amd64.tar.gz"
      sha256 "4048d313f4c644f0beb05d895d087ebef70fccb4ea6622d3d26b2933af21855d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.27.0/sous_0.27.0_linux_arm64.tar.gz"
      sha256 "749fc77537f2d2a2d4dbe28b0a0320b33f4182a7854f6557c5b8000a9437c168"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.27.0/sous_0.27.0_linux_amd64.tar.gz"
      sha256 "3d41ac28abfce90d62f1332e63323ad27d9d191e35e6ce80453da24d2c94d96f"
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
