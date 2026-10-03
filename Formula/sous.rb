class Sous < Formula
  desc "One list of what is waiting on you, across every project"
  homepage "https://github.com/bilal-/sous"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.8.1/sous_0.8.1_darwin_arm64.tar.gz"
      sha256 "2ad00a9003dfcfd1c421953999c9c96727204af9d08b480be44a3e073b2e800f"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.8.1/sous_0.8.1_darwin_amd64.tar.gz"
      sha256 "4ef332428f27893a0acf246197618576d94e1f22a4df9ced2c30d5d663498b1a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.8.1/sous_0.8.1_linux_arm64.tar.gz"
      sha256 "17df29a43f6b212ec6e5a5f11beab1a5538bbcc9d772a82dac4e8839cbecc0d8"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.8.1/sous_0.8.1_linux_amd64.tar.gz"
      sha256 "d98265b41ee51885894cc59d6fd87f9b02adbb74ade1afcc6d0ae1fc9f65d597"
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
