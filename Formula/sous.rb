class Sous < Formula
  desc "One list of what is waiting on you, across every project"
  homepage "https://github.com/bilal-/sous"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.26.0/sous_0.26.0_darwin_arm64.tar.gz"
      sha256 "7ca8a4140817f747f4f0caa3c048f75a6f18d3c48eaf43d9e09af7e12b671a3e"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.26.0/sous_0.26.0_darwin_amd64.tar.gz"
      sha256 "8283a6a82edadb43b7694d04a9cd0c5b63d7ee2fc494180c849e3a712f10b6ef"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.26.0/sous_0.26.0_linux_arm64.tar.gz"
      sha256 "a4893f23fca06852936f3ce482457d1164440838cab30a8405bb2ad024d4c806"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.26.0/sous_0.26.0_linux_amd64.tar.gz"
      sha256 "37c9ff307a0c491f91fef0e3984be299687d8af4f2eb03c32e4633ef192b6058"
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
