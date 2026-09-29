class Sous < Formula
  desc "One list of what is waiting on you, across every project"
  homepage "https://github.com/bilal-/sous"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.1.4/sous_0.1.4_darwin_arm64.tar.gz"
      sha256 "43d8adef14a2fbb867b3a2760f620d79101b13a2307ca11fa351db0d51216395"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.1.4/sous_0.1.4_darwin_amd64.tar.gz"
      sha256 "8ecd87121027eb13019bdb59ea5b806ba9a3e337ba20c4e9b9c163a3aef5d1d1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.1.4/sous_0.1.4_linux_arm64.tar.gz"
      sha256 "85d53c3dc3c608437915582218e0977d2430a49a63f5937a40f41414aca99619"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.1.4/sous_0.1.4_linux_amd64.tar.gz"
      sha256 "ede14c5b13b4204cdb7c8df1e6cf85ad85664457bd2be2a4c58bffe84e9e2954"
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
