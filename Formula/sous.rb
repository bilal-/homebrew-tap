class Sous < Formula
  desc "One list of what is waiting on you, across every project"
  homepage "https://github.com/bilal-/sous"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.22.0/sous_0.22.0_darwin_arm64.tar.gz"
      sha256 "e448dc04c5a16063d58637025bfb42a4eb856807b6f8e8615589627faf977b96"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.22.0/sous_0.22.0_darwin_amd64.tar.gz"
      sha256 "4efdae1ff335880ab7f95aff06848648340ecbf3becf82848208641b409ff1bf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.22.0/sous_0.22.0_linux_arm64.tar.gz"
      sha256 "277d2cee93f686c0fcc49114e020abd59dede22b782b8cf4c4ff525caa818182"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.22.0/sous_0.22.0_linux_amd64.tar.gz"
      sha256 "9e41f362f8ad60fd18c7941db35fccb0a10a739c1b4933d159b6d8f0224d001b"
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
