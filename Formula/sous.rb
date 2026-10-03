class Sous < Formula
  desc "One list of what is waiting on you, across every project"
  homepage "https://github.com/bilal-/sous"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.9.0/sous_0.9.0_darwin_arm64.tar.gz"
      sha256 "dae027df7b359993efcf399df712dd1d703c851b446233e33b7d2f5deea10b36"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.9.0/sous_0.9.0_darwin_amd64.tar.gz"
      sha256 "3b6f55ba81d68fcf3af5dac4528c8273cbc4fdd4d481982cc0a81e68afd11f09"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.9.0/sous_0.9.0_linux_arm64.tar.gz"
      sha256 "01c7a32acf9911a81e9425695decb0eeb51eaf068c173ba46308689f9b9cd5a7"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.9.0/sous_0.9.0_linux_amd64.tar.gz"
      sha256 "dfab35d38724852befe2cf491eeac38c41574d13fd8f5aa685ac3325dcd51c60"
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
