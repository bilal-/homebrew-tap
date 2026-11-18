class Sous < Formula
  desc "One list of what is waiting on you, across every project"
  homepage "https://github.com/bilal-/sous"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.28.0/sous_0.28.0_darwin_arm64.tar.gz"
      sha256 "d8511b6e7278720890ce182fdb888ba605676f863e290f6fdb362e4de81c6b08"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.28.0/sous_0.28.0_darwin_amd64.tar.gz"
      sha256 "5c10be4ed9aba569c6c8706620fcada90e0bef0042bf0b768b4f3818b329f155"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.28.0/sous_0.28.0_linux_arm64.tar.gz"
      sha256 "105d64f9b0c3589ea8816b979d2bd101972e031c49148544e37ca9d3e223c15a"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.28.0/sous_0.28.0_linux_amd64.tar.gz"
      sha256 "5505247f56671c7c010dd51240f3052a0c9c828c452b04ae314fa6adade73ad3"
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
