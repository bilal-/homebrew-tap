class Sous < Formula
  desc "One list of what is waiting on you, across every project"
  homepage "https://github.com/bilal-/sous"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.11.0/sous_0.11.0_darwin_arm64.tar.gz"
      sha256 "eb9fab1a6a1cc236c47e51687e54aa53a9fc5eae63ee7f254c4e9212f8fdd961"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.11.0/sous_0.11.0_darwin_amd64.tar.gz"
      sha256 "b332f017bf0e0413968c4fcf4b63f34c2fa70bff55425882cfa4a5a370e75162"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.11.0/sous_0.11.0_linux_arm64.tar.gz"
      sha256 "b5c743815ed8640047e9ef41a97c35cab541f4ddb9b3770279186fcbc77db3d6"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.11.0/sous_0.11.0_linux_amd64.tar.gz"
      sha256 "af99d3540c1ef66ad3954d55310d09eaffa5f507a2bdbb657984c3150c41ce73"
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
