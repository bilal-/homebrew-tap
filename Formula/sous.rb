class Sous < Formula
  desc "One list of what is waiting on you, across every project"
  homepage "https://github.com/bilal-/sous"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.21.1/sous_0.21.1_darwin_arm64.tar.gz"
      sha256 "956a648af3a506dcae88cb5f165c5fc5bf0605816f16f5c640deb5f60e488c0a"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.21.1/sous_0.21.1_darwin_amd64.tar.gz"
      sha256 "8bba3af3a5720c6b8f56675c2fff29ed20e0a136dddae3e3f89b08147930c32b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.21.1/sous_0.21.1_linux_arm64.tar.gz"
      sha256 "0f0ad63d9184513a3efec51e3d52d37c816efda79b62c240ec3b0235405c1c8c"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.21.1/sous_0.21.1_linux_amd64.tar.gz"
      sha256 "2f7dbe826eaa4e3704c9a52df2036a22ea35a24d1edc4a74b477c652eb600730"
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
