class Sous < Formula
  desc "One list of what is waiting on you, across every project"
  homepage "https://github.com/bilal-/sous"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.1.6/sous_0.1.6_darwin_arm64.tar.gz"
      sha256 "8ec2362905554709dc3ea44fe4aa351069b1121068b8257d7d83e9de46f30976"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.1.6/sous_0.1.6_darwin_amd64.tar.gz"
      sha256 "2b783835daab47de191c86d9701d48e36c8c460caadc4613198f1d93a97ebdb4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.1.6/sous_0.1.6_linux_arm64.tar.gz"
      sha256 "cb3c6752aff6b922db85345c94fcf7f6bf40876004c2c86102bcc4659f7a9268"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.1.6/sous_0.1.6_linux_amd64.tar.gz"
      sha256 "8431307df933f6e0138239fe2d98f7863494a58af410ff81926a30a4dc219387"
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
