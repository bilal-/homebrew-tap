class Sous < Formula
  desc "One list of what is waiting on you, across every project"
  homepage "https://github.com/bilal-/sous"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.6.0/sous_0.6.0_darwin_arm64.tar.gz"
      sha256 "d5781ec35f121cb6b337de1d18fb306321c00f61de47a20d55ace1900fa0bfd1"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.6.0/sous_0.6.0_darwin_amd64.tar.gz"
      sha256 "9970c9a7d2ebc072ab400461bcff2112bd32f985b7dfbd05ec60995e3929a293"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.6.0/sous_0.6.0_linux_arm64.tar.gz"
      sha256 "fbdec395750524640b6dcb8ad974d7669e4f944c5c42cad1b3cae702762d44f8"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.6.0/sous_0.6.0_linux_amd64.tar.gz"
      sha256 "9e6257bbebf0b5b6932ea060f7caef3d91b1ffcb5302e43849c2bcb773cd202a"
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
