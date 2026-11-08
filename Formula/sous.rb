class Sous < Formula
  desc "One list of what is waiting on you, across every project"
  homepage "https://github.com/bilal-/sous"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.25.0/sous_0.25.0_darwin_arm64.tar.gz"
      sha256 "36ec85d0899e7dce13ca3c11fc1b29f4eeec540f5d966f8502cbfcf3f20066be"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.25.0/sous_0.25.0_darwin_amd64.tar.gz"
      sha256 "935e428855271c1bfbf9453d152d2383d6c6fd01e88913649954812afb35ca26"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.25.0/sous_0.25.0_linux_arm64.tar.gz"
      sha256 "03b6eb3d64d5048cfc8edd9dc195171bddd4534eced404c2c5bde797ed71ad4d"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.25.0/sous_0.25.0_linux_amd64.tar.gz"
      sha256 "811012a3d382098c9516160032a6d918886ae0f51669985e05b6e5ff8ceca8df"
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
