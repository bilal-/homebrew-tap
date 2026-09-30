class Sous < Formula
  desc "One list of what is waiting on you, across every project"
  homepage "https://github.com/bilal-/sous"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.3.1/sous_0.3.1_darwin_arm64.tar.gz"
      sha256 "a5650cfe192a606f954f8bebc8b0b712bb91890bba0c96ecbeb2191cfd1bb48a"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.3.1/sous_0.3.1_darwin_amd64.tar.gz"
      sha256 "b3753961630d984c7a590f0e2e6eaa75fb6f855acc582667f48bbf52907ec0e5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.3.1/sous_0.3.1_linux_arm64.tar.gz"
      sha256 "0b64a13538f21109b57add4b55400b47a05392034d365918a3703976601d34ca"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.3.1/sous_0.3.1_linux_amd64.tar.gz"
      sha256 "83a9717b71b9bcb7c49306bc5f298e83ded04b640ea9a37e39b9154a62704a7b"
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
