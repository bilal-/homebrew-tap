class Sous < Formula
  desc "One list of what is waiting on you, across every project"
  homepage "https://github.com/bilal-/sous"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.21.0/sous_0.21.0_darwin_arm64.tar.gz"
      sha256 "37fea0a88ac2d35cd4310d9e902dbbabffee97675d3cee0af7b03f90db07d7c8"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.21.0/sous_0.21.0_darwin_amd64.tar.gz"
      sha256 "d125dfc852b524227565b94dfda02412a023a69e70b9b6e54c7c72d050b776cb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.21.0/sous_0.21.0_linux_arm64.tar.gz"
      sha256 "813528c29a4688e03fe6f0c24979612f16a4665634155e9585ceadcb7c0280a1"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.21.0/sous_0.21.0_linux_amd64.tar.gz"
      sha256 "2505e25067e62b3a3e63097088becbf4678db36dfb2b8ed04e1a9f358149c86a"
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
