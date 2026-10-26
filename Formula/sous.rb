class Sous < Formula
  desc "One list of what is waiting on you, across every project"
  homepage "https://github.com/bilal-/sous"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.16.0/sous_0.16.0_darwin_arm64.tar.gz"
      sha256 "a38b209eee6a7a7a02615bc47cd5abf970cf7ecb55b1ec31a69184ea0f2ab35f"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.16.0/sous_0.16.0_darwin_amd64.tar.gz"
      sha256 "0cbece9d675514dbc6584ea2c77cd28c7a4363f7220e06b5583b7977bcd99ba6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bilal-/sous/releases/download/v0.16.0/sous_0.16.0_linux_arm64.tar.gz"
      sha256 "353a96d85312b646ce0781ddfeda6cba869444031c17deee9c3ddb34705f4c6b"
    else
      url "https://github.com/bilal-/sous/releases/download/v0.16.0/sous_0.16.0_linux_amd64.tar.gz"
      sha256 "9402b3a12dbada3718ca6e996dc28c486131c2986f75eb9df792096732017562"
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
