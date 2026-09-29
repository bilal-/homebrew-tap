class Sous < Formula
  desc "One list of what is waiting on you, across every project"
  homepage "https://github.com/bilal-/sous"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.1.7/sous_0.1.7_darwin_arm64.tar.gz"
      sha256 "8265de2a736cd16e2d4bcbd19531f02881934c3426877333f7176dcfeb5ba356"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.1.7/sous_0.1.7_darwin_amd64.tar.gz"
      sha256 "b08352f4b2e2cadd53bd31a3ec8f48a3ae220d47a4180a42801c04dd611bf4ee"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.1.7/sous_0.1.7_linux_arm64.tar.gz"
      sha256 "5fdb04deefb92276c450ebc06d6978c8c5736a563741f53615c868ab3ca975ae"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.1.7/sous_0.1.7_linux_amd64.tar.gz"
      sha256 "d1059471f9ec66698cd857afabd3cdc466461af9efef7aec388f102be95b86e8"
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
