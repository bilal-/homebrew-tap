class Sous < Formula
  desc "One list of what is waiting on you, across every project"
  homepage "https://github.com/bilal-/sous"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.7.0/sous_0.7.0_darwin_arm64.tar.gz"
      sha256 "21b8fc34098c73b84fcba423daf340e5daa8a0fbafd39a21fe3422ba38816a76"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.7.0/sous_0.7.0_darwin_amd64.tar.gz"
      sha256 "30bb3a04c291ac1fdd3cdca304774be0e89b3fef2517b8830186b75ba13e68e4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.7.0/sous_0.7.0_linux_arm64.tar.gz"
      sha256 "24b9da4f6dfaa2d332ac36cab951ea984b5654281e0d6011b2727eac865d178e"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.7.0/sous_0.7.0_linux_amd64.tar.gz"
      sha256 "2cb248f37393a1b5dcefa678d49f78877dbee80c62ff539d1def52faee60cc64"
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
