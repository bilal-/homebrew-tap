class Sous < Formula
  desc "One list of what is waiting on you, across every project"
  homepage "https://github.com/bilal-/sous"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.1.0/sous_0.1.0_darwin_arm64.tar.gz"
      sha256 "37464ab3e5928f2104dca932cd54646e77e982486e9447150171883cca4c0808"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.1.0/sous_0.1.0_darwin_amd64.tar.gz"
      sha256 "72a887d806b42a3e14afab5af4bed7713ba35e0121082c853f0ebf83790ffaf9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.1.0/sous_0.1.0_linux_arm64.tar.gz"
      sha256 "fb7844870f1841a7c6ff235161e339a6f51b3300028407108a5b5188422b956f"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.1.0/sous_0.1.0_linux_amd64.tar.gz"
      sha256 "7ea32cfd15af18cdd49d45f4cca01ad9184b03ace69c23d34de8d37e6b836169"
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
