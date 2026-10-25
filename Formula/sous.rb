class Sous < Formula
  desc "One list of what is waiting on you, across every project"
  homepage "https://github.com/bilal-/sous"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.12.1/sous_0.12.1_darwin_arm64.tar.gz"
      sha256 "f0479bb738c4d00c645561b2a02d998866bf534b01e2e0728e060a22864780d2"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.12.1/sous_0.12.1_darwin_amd64.tar.gz"
      sha256 "4841adc66a8d20705a7d21d98b1c6939c169076765a09a561f548d0a65279f57"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.12.1/sous_0.12.1_linux_arm64.tar.gz"
      sha256 "30aa80d8e618fd931c14662804a2f921d5b11f5a15ec23e7567d3874c96b882d"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.12.1/sous_0.12.1_linux_amd64.tar.gz"
      sha256 "5425af8749d61379baae1c15391ebd56650958d3378786867fefd16f8c38461f"
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
