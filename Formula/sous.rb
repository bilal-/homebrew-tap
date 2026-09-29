class Sous < Formula
  desc "One list of what is waiting on you, across every project"
  homepage "https://github.com/bilal-/sous"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.2.3/sous_0.2.3_darwin_arm64.tar.gz"
      sha256 "5536151ce359cf799e994f403bdd80d8b4b78b9f2f9f96944ab50cf5710effa1"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.2.3/sous_0.2.3_darwin_amd64.tar.gz"
      sha256 "c1f74bc3b8e3ea3d760b3c3a6205f3e1254eaa8f0d019f0225bda143c9d328a9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.2.3/sous_0.2.3_linux_arm64.tar.gz"
      sha256 "7d84fcda791252e320238f6ae4dac6bc7531013b484e366b4768d17f3948482b"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.2.3/sous_0.2.3_linux_amd64.tar.gz"
      sha256 "7500d814e3665c79146462a696f4c582006da4da93a10a8e3cd11be998c5df39"
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
