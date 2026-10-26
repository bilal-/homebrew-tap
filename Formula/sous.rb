class Sous < Formula
  desc "One list of what is waiting on you, across every project"
  homepage "https://github.com/bilal-/sous"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.19.0/sous_0.19.0_darwin_arm64.tar.gz"
      sha256 "e9aac248c2e220d0e9e58caf1febb2dc3e27dcda973db78b0b6996cda9ce81b5"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.19.0/sous_0.19.0_darwin_amd64.tar.gz"
      sha256 "c6c7578d6f0886ce18cd393959a3745e08983f9c82ef65e3c33c7f8c875d3811"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.19.0/sous_0.19.0_linux_arm64.tar.gz"
      sha256 "8cc8e05b536d954e0453cb77ab8a0d1868675f105c6f99ff432dbd8a7066342b"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.19.0/sous_0.19.0_linux_amd64.tar.gz"
      sha256 "6d12d92633e9d40383c6a7fd93d1a1fa9ddd5a3de0b43bb20f404348bc0c6aeb"
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
