class Sous < Formula
  desc "One list of what is waiting on you, across every project"
  homepage "https://github.com/bilal-/sous"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.14.0/sous_0.14.0_darwin_arm64.tar.gz"
      sha256 "a626a85bc65409aad4ef45bf978983fe5e5cc6204f7a6ff1bd1eb4da85db086d"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.14.0/sous_0.14.0_darwin_amd64.tar.gz"
      sha256 "d4bf172095fa6b237d9ac71c364e6a3cf48ff242c5526bc141c51c97b6256296"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.14.0/sous_0.14.0_linux_arm64.tar.gz"
      sha256 "34535748eb95063521bf477022525b37cced9fece9b519b1715da70b62267342"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.14.0/sous_0.14.0_linux_amd64.tar.gz"
      sha256 "72758284e796af28634858f54c0ef47220160d49b190fea334338278a8207533"
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
