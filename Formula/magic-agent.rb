class MagicAgent < Formula
  desc "CLI for DaVinci Resolve scripting operations"
  homepage "https://github.com/decocereus/magic-agent"
  url "https://github.com/decocereus/magic-agent/releases/download/v0.4.0/magic-agent-v0.4.0-macos.tar.gz"
  sha256 "1d244a14fb934c6b5dafe30640f396a8129b3713819cddad7f8714791b71a0e3"
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
