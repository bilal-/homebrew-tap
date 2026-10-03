class Sous < Formula
  desc "One list of what is waiting on you, across every project"
  homepage "https://github.com/bilal-/sous"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.10.0/sous_0.10.0_darwin_arm64.tar.gz"
      sha256 "48f9275dc35bdad9beb2c61a80da91a7aa3fbc0f31cb9b737b8bab7f4779369e"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.10.0/sous_0.10.0_darwin_amd64.tar.gz"
      sha256 "64225b7ad3babb1025b26d48b6d3e11577ba9a14c7e8637e629b0e89722e8cb7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.10.0/sous_0.10.0_linux_arm64.tar.gz"
      sha256 "8f40c9750f1cf7267405a9dfb7804602fca2dcd076c897014355100c1aa006dc"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.10.0/sous_0.10.0_linux_amd64.tar.gz"
      sha256 "5df551f75eb340d8b3f3bd098651b2e5306c11905f7bdb83998b7389ba44c8fc"
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
