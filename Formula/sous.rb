class Sous < Formula
  desc "One list of what is waiting on you, across every project"
  homepage "https://github.com/bilal-/sous"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.3.3/sous_0.3.3_darwin_arm64.tar.gz"
      sha256 "10ebbc3fd32da8710d34cad2a666d28611976b3159a0d02fd00f7dda42716521"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.3.3/sous_0.3.3_darwin_amd64.tar.gz"
      sha256 "41ec44aa54c70811a3edbec38ca3d6e1e59893f2d20977bfe9c1df5d73e3c0c3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.3.3/sous_0.3.3_linux_arm64.tar.gz"
      sha256 "f89aa55aece635b7c106206771c84104fc4257c80c31823c52d761f50a1fc1fd"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.3.3/sous_0.3.3_linux_amd64.tar.gz"
      sha256 "f49e38c3ea40e82f1ad76b557ea88f96dfffaaeae8d7357c8baba2a41eef9b5f"
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
