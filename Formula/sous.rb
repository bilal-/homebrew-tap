class Sous < Formula
  desc "One list of what is waiting on you, across every project"
  homepage "https://github.com/bilal-/sous"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.10.1/sous_0.10.1_darwin_arm64.tar.gz"
      sha256 "113cbc500ac1d3eb9614a85509e2e45fddbf8534757d9808f8d425438b47be6f"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.10.1/sous_0.10.1_darwin_amd64.tar.gz"
      sha256 "35564f124f782d5e02d5956290c4febe0c6265d2a435ddeb09a4f627c112fa98"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.10.1/sous_0.10.1_linux_arm64.tar.gz"
      sha256 "4512603a4e1019ebc20e864dfdfbbf15f01be6033db46cda17abc682521fbe47"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.10.1/sous_0.10.1_linux_amd64.tar.gz"
      sha256 "6b9ff48f2bc8941810971664c4d1010d09243cc33afb0d0ebcc47179bd3e78d4"
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
