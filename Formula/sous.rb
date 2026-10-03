class Sous < Formula
  desc "One list of what is waiting on you, across every project"
  homepage "https://github.com/bilal-/sous"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.10.2/sous_0.10.2_darwin_arm64.tar.gz"
      sha256 "b9df4742f7e686b1634ca2d1c5b59cb31c3f048d27ce70f963d580eb346a00ab"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.10.2/sous_0.10.2_darwin_amd64.tar.gz"
      sha256 "53c16b1358fc613c1aad78abe6553708510e7f2791e3a87be2cbd27bfab54542"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.10.2/sous_0.10.2_linux_arm64.tar.gz"
      sha256 "e4bd3f62b123115387960069c79faabfd634bba6ac2c7ae2d97add2c1d6850e3"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.10.2/sous_0.10.2_linux_amd64.tar.gz"
      sha256 "1c597d1cd0c5b1afd0359580d7f94a87a552f70440951945d2f0830ba016d29d"
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
