class Sous < Formula
  desc "One list of what is waiting on you, across every project"
  homepage "https://github.com/bilal-/sous"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.23.0/sous_0.23.0_darwin_arm64.tar.gz"
      sha256 "74c5d61d39db8d9da60989258da1832cf5d220430704c5f7940efe2eb5f9e67a"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.23.0/sous_0.23.0_darwin_amd64.tar.gz"
      sha256 "a15fd6034e3e6c0a01807a574f7437dcc65f69534dbe07f52ab6bcca86b44088"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.23.0/sous_0.23.0_linux_arm64.tar.gz"
      sha256 "c5c3d3c5270e4bdacc857e85e3bcdb460ae01a299f50d1cbdf52b535adf50f31"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.23.0/sous_0.23.0_linux_amd64.tar.gz"
      sha256 "d02aa0e6e3c8cff1f6d2c108ca0d77b855dcf11f9d7a71b55da7fdd8974a89b5"
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
