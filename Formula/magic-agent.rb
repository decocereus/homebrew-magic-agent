class MagicAgent < Formula
  desc "CLI for DaVinci Resolve scripting operations"
  homepage "https://github.com/decocereus/magic-agent"
  url "https://github.com/decocereus/magic-agent/releases/download/v0.3.0/magic-agent-v0.3.0-macos.tar.gz"
  sha256 "9c1850d52a1a3727d7d74c4e756c48854bfc21389340f91ebffd9c0a83e57901"
  license "MIT"
  version "0.3.0"

  depends_on :macos
  depends_on "python@3.12"

  def install
    bin.install "magic-agent"
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
