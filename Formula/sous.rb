class Sous < Formula
  desc "One list of what is waiting on you, across every project"
  homepage "https://github.com/bilal-/sous"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.24.0/sous_0.24.0_darwin_arm64.tar.gz"
      sha256 "cb34e56242e2e853c053e12c0579ded0099cb93530fb7ca885dbb47570b4a5aa"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.24.0/sous_0.24.0_darwin_amd64.tar.gz"
      sha256 "16ec536aa3aa5e67621d054b78a4c620e42ed0e799caf405626817b41a0c63ed"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.24.0/sous_0.24.0_linux_arm64.tar.gz"
      sha256 "32b8d3a79ee6d99bf103ee7196ea616d0e46eec84b82f24a0fa9bb39108f1c65"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.24.0/sous_0.24.0_linux_amd64.tar.gz"
      sha256 "97ec86d43aa5c956af29f26b2df30d0282065efa1b26361e437eb6be2d4e8a7b"
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
