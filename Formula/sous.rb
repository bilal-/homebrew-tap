class Sous < Formula
  desc "One list of what is waiting on you, across every project"
  homepage "https://github.com/bilal-/sous"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.2.1/sous_0.2.1_darwin_arm64.tar.gz"
      sha256 "48dce083ef3ed1c4561cac81369114d92a6db99ec21818ad58e22a883d169b7a"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.2.1/sous_0.2.1_darwin_amd64.tar.gz"
      sha256 "f11b8eb98fddf6dbe5e69a55c6b977136e52899369650a9baa099040c99bb552"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.2.1/sous_0.2.1_linux_arm64.tar.gz"
      sha256 "ae806f42fc1a861ae7fd64800a1aeff3e2c73a7cec548a6f4ea4e465e1d3f8b6"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.2.1/sous_0.2.1_linux_amd64.tar.gz"
      sha256 "2a0389143458c9bd5391adf57776d934d6605763fe01984fde78f768cc2331b0"
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
