class Sous < Formula
  desc "One list of what is waiting on you, across every project"
  homepage "https://github.com/bilal-/sous"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.18.0/sous_0.18.0_darwin_arm64.tar.gz"
      sha256 "3f3cec8efaa53ae304f6f4859137fb66a77f8ec4e44cb6d825f9e4e088748eb2"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.18.0/sous_0.18.0_darwin_amd64.tar.gz"
      sha256 "6e1cabfa0f2341781b17bb42f09367b3c4bde63d0ff9a3ecfb3a086e54d22432"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.18.0/sous_0.18.0_linux_arm64.tar.gz"
      sha256 "0e667e055dfcbce2d0889eab80374127f2214f9d94383e2fd011f3584386c307"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.18.0/sous_0.18.0_linux_amd64.tar.gz"
      sha256 "27e7efeb0008f788dfeda2bb97db22389edd795133ef69ee45ffafb71fbef008"
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
