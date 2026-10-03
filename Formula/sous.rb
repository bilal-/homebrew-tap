class Sous < Formula
  desc "One list of what is waiting on you, across every project"
  homepage "https://github.com/bilal-/sous"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.11.1/sous_0.11.1_darwin_arm64.tar.gz"
      sha256 "6dcd65b1a9487b6f9ad354b76d615456aeea0aed8e810d435ba4a54c12c39f7d"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.11.1/sous_0.11.1_darwin_amd64.tar.gz"
      sha256 "30f9d0a693caf816d1b647aac68e5f32e1373095ee701fd5bd22da16a3a4a532"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.11.1/sous_0.11.1_linux_arm64.tar.gz"
      sha256 "9ee1f13dd340553f768746fd2e317cd30e12665d410d7880d39f94317f4000d6"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.11.1/sous_0.11.1_linux_amd64.tar.gz"
      sha256 "80c5c0d9e9020685d5542109d492a39215e812ff92022897265de0fa7f643a31"
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
