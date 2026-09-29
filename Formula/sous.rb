class Sous < Formula
  desc "One list of what is waiting on you, across every project"
  homepage "https://github.com/bilal-/sous"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.2.2/sous_0.2.2_darwin_arm64.tar.gz"
      sha256 "1dbd4e7e315646b5a43957d30bec415abd78f16731db83b7998d279d343ef1b2"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.2.2/sous_0.2.2_darwin_amd64.tar.gz"
      sha256 "cba55f171ede4acef20975dbc9c41cd0eabdfd03dc0f517195718f9386627dc6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.2.2/sous_0.2.2_linux_arm64.tar.gz"
      sha256 "279f07bb73a2bce3032a913ede329238d7c54d65fe2b63f8f8d0d9ac27d29b32"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.2.2/sous_0.2.2_linux_amd64.tar.gz"
      sha256 "7874e7e971f2a70f7199bb61376a1a4722747350e4ea2cfef56c03586abdcbef"
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
