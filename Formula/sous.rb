class Sous < Formula
  desc "One list of what is waiting on you, across every project"
  homepage "https://github.com/bilal-/sous"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.15.0/sous_0.15.0_darwin_arm64.tar.gz"
      sha256 "bfc71df75e9f5882fe895289db9c4ee68c1b104bf5a51741a33cd46fe66f426b"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.15.0/sous_0.15.0_darwin_amd64.tar.gz"
      sha256 "d571406b486110a37e0306a89d76dd6ab318f6c28e93021fc4edc7cdcec9e3b1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.15.0/sous_0.15.0_linux_arm64.tar.gz"
      sha256 "58250ee856a6f0af010d2472c0b88ead6d02099e12677090d294bdb50e7ca897"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.15.0/sous_0.15.0_linux_amd64.tar.gz"
      sha256 "26d0326c3cbb71928d4bc041be4d6b3daaebd7ac78154d4202534fa9dcf4c447"
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
