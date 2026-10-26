class Sous < Formula
  desc "One list of what is waiting on you, across every project"
  homepage "https://github.com/bilal-/sous"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.20.0/sous_0.20.0_darwin_arm64.tar.gz"
      sha256 "fe7cf08fa444ea85f7d94ac5c8dc3b00c5efe8d45aa08777030e769253738910"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.20.0/sous_0.20.0_darwin_amd64.tar.gz"
      sha256 "8d1026c210882b4b49a6d6b2ecd33e47781a1efca214e6fe8540f7274457c3e3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.20.0/sous_0.20.0_linux_arm64.tar.gz"
      sha256 "62400747ae6a3ca808709091992a4348e57e989278f62836c930126978e10686"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.20.0/sous_0.20.0_linux_amd64.tar.gz"
      sha256 "c72d809c01dd2ae444dac7dd330490691de8754a12c7bdba9cf6c8bcf0e1aa24"
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
