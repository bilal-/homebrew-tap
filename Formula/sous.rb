class Sous < Formula
  desc "One list of what is waiting on you, across every project"
  homepage "https://github.com/bilal-/sous"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.8.0/sous_0.8.0_darwin_arm64.tar.gz"
      sha256 "58e620a1db3b0606923f0647242a404d2ce296ef83ed758cc1d8aa768b8518ad"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.8.0/sous_0.8.0_darwin_amd64.tar.gz"
      sha256 "502d6847356af6042fdbd53f4eaf66d7f799f9447918ef5ebc17a728efda2e86"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.8.0/sous_0.8.0_linux_arm64.tar.gz"
      sha256 "75618ec8f7392277c0747bd2c8f151c9e08563f78f55517755debd2e2132d962"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.8.0/sous_0.8.0_linux_amd64.tar.gz"
      sha256 "af0487e3a48743c5e68c79b971755fa2a0cccdb735161b5ad27b6102b798147c"
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
