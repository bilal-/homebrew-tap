class Sous < Formula
  desc "One list of what is waiting on you, across every project"
  homepage "https://github.com/bilal-/sous"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.1.2/sous_0.1.2_darwin_arm64.tar.gz"
      sha256 "8d5172922a76a1ba66297c492c9f4992e9dc37b2afc98cfe4ac493fd7bef7bd6"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.1.2/sous_0.1.2_darwin_amd64.tar.gz"
      sha256 "9fa644ce81de2a7771252e8edb3d156592af2538ae18a0a68010d7ed1eddebed"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.1.2/sous_0.1.2_linux_arm64.tar.gz"
      sha256 "7400a6d9ae3643d4556a3302158df92d0460b51b1d64c12625eb5f1f31dd4fae"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.1.2/sous_0.1.2_linux_amd64.tar.gz"
      sha256 "37af32429a61fa9a52cee6d0b08098b2d7e54f09e08c18e61771270e96ef6a04"
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
