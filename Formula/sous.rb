class Sous < Formula
  desc "One list of what is waiting on you, across every project"
  homepage "https://github.com/bilal-/sous"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.4.0/sous_0.4.0_darwin_arm64.tar.gz"
      sha256 "4ec7256c6221d6ef9a6a75f338f866434bd48ae5c482ffc8f0c0e0935b4408da"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.4.0/sous_0.4.0_darwin_amd64.tar.gz"
      sha256 "0a10d17c16efcf0b258d9ded797e7ff36ab3eef7ddd9cb4211a85359c525ac10"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.4.0/sous_0.4.0_linux_arm64.tar.gz"
      sha256 "e5bd8fb6c3b7c300c2dc3eed83d3d38f0b1df2367520ac45ba124eae6363a116"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.4.0/sous_0.4.0_linux_amd64.tar.gz"
      sha256 "5e1fbf8f4db610c964cab27a0432a04f49329691f9cbab0d52aad388e6015271"
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
