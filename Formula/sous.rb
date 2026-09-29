class Sous < Formula
  desc "One list of what is waiting on you, across every project"
  homepage "https://github.com/bilal-/sous"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.2.0/sous_0.2.0_darwin_arm64.tar.gz"
      sha256 "c73cfd0b012e377eb043733b5b9897c8a736195eee1ac09bfaad3e0382ae5e2d"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.2.0/sous_0.2.0_darwin_amd64.tar.gz"
      sha256 "779d2125fc65dc0e9e9114d245c0c1f81a0b037583d44e9e8d46bc919d76f5cc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.2.0/sous_0.2.0_linux_arm64.tar.gz"
      sha256 "2a4f50745dc225ec1ca093d7ed220c5220ba20ba8e8d611b81d0729ea91d9c50"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.2.0/sous_0.2.0_linux_amd64.tar.gz"
      sha256 "9c911c0839c3843944560c36c2046132c8886eb4234c8c9caed75f2f3c39f761"
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
