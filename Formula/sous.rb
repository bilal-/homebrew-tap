class Sous < Formula
  desc "One list of what is waiting on you, across every project"
  homepage "https://github.com/bilal-/sous"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.13.0/sous_0.13.0_darwin_arm64.tar.gz"
      sha256 "83d2c362b6f836f71f25996472d0b5a574e1e3b37ba447605ec3e52bbabc331c"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.13.0/sous_0.13.0_darwin_amd64.tar.gz"
      sha256 "4937c05739eb2d2c75d50fb653d778255456e1d6ee7c46600b30b1329193c30e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.13.0/sous_0.13.0_linux_arm64.tar.gz"
      sha256 "b0a48a91f3274166c4d437854d78683f1543e597ad99f4286dd5512d1fe6d088"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.13.0/sous_0.13.0_linux_amd64.tar.gz"
      sha256 "4a8fc6b568eb91ed8e379881c70fe58862f5c9a55567624bc1b462f2a32e4594"
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
