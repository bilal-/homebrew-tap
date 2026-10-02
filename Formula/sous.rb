class Sous < Formula
  desc "One list of what is waiting on you, across every project"
  homepage "https://github.com/bilal-/sous"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.3.2/sous_0.3.2_darwin_arm64.tar.gz"
      sha256 "f4890caf3eb28a73621580764504d7110c01af55445d144f1a5e790f64ce30ae"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.3.2/sous_0.3.2_darwin_amd64.tar.gz"
      sha256 "d5467a13dfb7b7992c4a920e77efdf17b3fa72dd51069353df60ec9bdabad358"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.3.2/sous_0.3.2_linux_arm64.tar.gz"
      sha256 "b8fbf5505d4f400921ce3bebbf45896f71522f156b5339a300f286cca5d8e008"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.3.2/sous_0.3.2_linux_amd64.tar.gz"
      sha256 "704bbfa8090116879ee163705406ebb697e39cdeb00fb7e0f08295afa443acb5"
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
