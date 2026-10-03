class Sous < Formula
  desc "One list of what is waiting on you, across every project"
  homepage "https://github.com/bilal-/sous"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.5.1/sous_0.5.1_darwin_arm64.tar.gz"
      sha256 "15947acf54fa0b788160caf83b7d2013fb29ea7a3a140630db1cfb033952c6e9"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.5.1/sous_0.5.1_darwin_amd64.tar.gz"
      sha256 "b5ce153861ebaa999bcc4c9a9666c33d6830224beadcb70cca31ed467182eaba"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.5.1/sous_0.5.1_linux_arm64.tar.gz"
      sha256 "9044fad19b2f41c031da4b4689c6d04da2589025792511becb8fdef8596a97ed"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.5.1/sous_0.5.1_linux_amd64.tar.gz"
      sha256 "1ae76612fbdf11590ebe2882c4136079f597593f8d6addd833147d0d2d79a50d"
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
