class Sous < Formula
  desc "One list of what is waiting on you, across every project"
  homepage "https://github.com/bilal-/sous"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.1.5/sous_0.1.5_darwin_arm64.tar.gz"
      sha256 "023fc846c1a84f904bda947bb035e9c697b1e0a1dba8aef6098af90a7724f0ec"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.1.5/sous_0.1.5_darwin_amd64.tar.gz"
      sha256 "ed5db2d88e471a73f698407585b1425efddbba3bf411a4ef9747ee7a16efb3fe"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.1.5/sous_0.1.5_linux_arm64.tar.gz"
      sha256 "913e4f49b2ae0dcc9430f5759432c0dbc8cd558bc6f0463e329e9ab833329410"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.1.5/sous_0.1.5_linux_amd64.tar.gz"
      sha256 "23e3b9e17bc2935137882c6d831e21a2f7d461a938f6993829ef191f89f4927c"
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
