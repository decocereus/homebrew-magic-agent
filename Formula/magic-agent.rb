class MagicAgent < Formula
  desc "CLI for DaVinci Resolve scripting operations"
  homepage "https://github.com/decocereus/magic-agent"
  url "https://github.com/decocereus/magic-agent/releases/download/v0.4.0/magic-agent-v0.4.0-macos.tar.gz"
  sha256 "ccc47359b2fa8d61846cdb26714220fd056c22d4ba6a67b0152a3d565eeafd31"
  license "MIT"
  version "0.4.0"

  depends_on :macos
  depends_on "python@3.12"

  def install
    bin.install "magic-agent"
    (pkgshare/"python").install "resolve_bridge.py"
  end

  def caveats
    <<~EOS
      magic-agent requires:
        - DaVinci Resolve Studio 20.0+ (scripting requires Studio version)
        - Python 3.10+ (brew installs python@3.12)

      Check your setup with:
        magic-agent doctor --pretty
    EOS
  end

  test do
    assert_match "magic-agent", shell_output("#{bin}/magic-agent --version")
  end
end
