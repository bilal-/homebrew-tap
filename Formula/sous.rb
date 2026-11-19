class Sous < Formula
  desc "One list of what is waiting on you, across every project"
  homepage "https://github.com/bilal-/sous"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.28.1/sous_0.28.1_darwin_arm64.tar.gz"
      sha256 "fc3085456157861ac4a677e252ebd91fbe142e743db510c0b6d89023a9d0ccca"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.28.1/sous_0.28.1_darwin_amd64.tar.gz"
      sha256 "ff2c7b8d77e1f4a4e84c9dfa4b455cdbe4ed148013fdf57ee0731ad14ce33c22"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.28.1/sous_0.28.1_linux_arm64.tar.gz"
      sha256 "03fc9f4d8bb3308865defd7db6b84176d449cd97fa3adc4d5fe3cba50799cb17"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.28.1/sous_0.28.1_linux_amd64.tar.gz"
      sha256 "f339e1a8252e00d54af75ff2bf8a65bf0a9876b2c8079ae9a8c38b90c2bcc6d0"
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
