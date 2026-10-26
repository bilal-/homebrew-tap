class Sous < Formula
  desc "One list of what is waiting on you, across every project"
  homepage "https://github.com/bilal-/sous"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.17.0/sous_0.17.0_darwin_arm64.tar.gz"
      sha256 "340d4e610ac75753112bfe57319356ba527da75eb658811027ae78e56d83a74e"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.17.0/sous_0.17.0_darwin_amd64.tar.gz"
      sha256 "46af6168f3c558b7fcdd2f3501413001d228e1314433ba792a4583713eca5981"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.17.0/sous_0.17.0_linux_arm64.tar.gz"
      sha256 "2e461e8c287f017ce59ca2d039d4af80054fcf3d3b8fb0a62dfa5cc52803cb6c"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.17.0/sous_0.17.0_linux_amd64.tar.gz"
      sha256 "59092b7ad106cd8facc7753845461f0e0a2696dd32c5587cb552a713d0c69ac7"
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
