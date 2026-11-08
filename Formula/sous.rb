class Sous < Formula
  desc "One list of what is waiting on you, across every project"
  homepage "https://github.com/bilal-/sous"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.25.1/sous_0.25.1_darwin_arm64.tar.gz"
      sha256 "f1331fa8ac3e81e966185501655d6556ca7ffd3d85d8c988e02cc2e94dda8dff"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.25.1/sous_0.25.1_darwin_amd64.tar.gz"
      sha256 "668746604111ff119c751cee3d78e76c127438655fd4aacd0e3dbc319e603156"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.25.1/sous_0.25.1_linux_arm64.tar.gz"
      sha256 "c5b30e02989d01fe32318c64cde549bd5425120984367d2cd94c5ac53d203f90"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.25.1/sous_0.25.1_linux_amd64.tar.gz"
      sha256 "55903f2566023895204d973204c90eb100ca35efd3146bb8f37ab359869e936e"
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
