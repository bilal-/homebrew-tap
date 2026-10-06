class Sous < Formula
  desc "One list of what is waiting on you, across every project"
  homepage "https://github.com/bilal-/sous"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.12.0/sous_0.12.0_darwin_arm64.tar.gz"
      sha256 "48c9bac6bd416e9a1dcd7239c86488ec484fc598872a12d59a6773b91529806d"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.12.0/sous_0.12.0_darwin_amd64.tar.gz"
      sha256 "5e84ed109a4d1b499d173d17ad3a87170a608cd5e70c324fd5c8692d3c722dbe"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.12.0/sous_0.12.0_linux_arm64.tar.gz"
      sha256 "161bbbe4d012c663342b47cb2d76afc265e625c2e09032ae3d3f12c97465a43c"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.12.0/sous_0.12.0_linux_amd64.tar.gz"
      sha256 "fa50cc23ba08cde68ac8252413cd4bb196e2d1daf0bdb37531d13a554e333cd7"
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
