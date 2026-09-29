class Sous < Formula
  desc "One list of what is waiting on you, across every project"
  homepage "https://github.com/bilal-/sous"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.1.1/sous_0.1.1_darwin_arm64.tar.gz"
      sha256 "b0846bd9a1ebbad516790cea157d8c705e4afd36e06b6618163cf3e6b54c7b23"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.1.1/sous_0.1.1_darwin_amd64.tar.gz"
      sha256 "9d6420b167f35dc9225ccf1d4edee22dc2be536cb184a8c8c0927084ab04654b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.1.1/sous_0.1.1_linux_arm64.tar.gz"
      sha256 "4a6b00eac2a0f77d96d79ba793f559ace6476354d12511dd0942fbb32073c8f4"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.1.1/sous_0.1.1_linux_amd64.tar.gz"
      sha256 "221ffb7623be72bc7bd5b7052e871eb37aa427b201dc9126994661b546cdb00b"
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
