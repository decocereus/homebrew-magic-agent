class MagicAgent < Formula
  desc "Natural-language editing CLI for DaVinci Resolve"
  homepage "https://github.com/decocereus/magic-agent"
  url "https://github.com/decocereus/magic-agent/releases/download/v0.2.0/magic-agent-v0.2.0-macos.tar.gz"
  sha256 "228879820ceada9ed09bc4be0c16b0724dd34c324db0a83401a87fa3de7dba02"
  license "MIT"
  version "0.1.0"

  depends_on :macos
  depends_on "python@3.12"

  def install
    bin.install "magic-agent"
  end

  def caveats
    <<~EOS
      magic-agent requires:
        - DaVinci Resolve Studio 20.0+ (scripting requires Studio version)
        - An AI API key (Anthropic, OpenAI, or OpenRouter)

      Configure your API key:
        export ANTHROPIC_API_KEY="sk-ant-..."

      Or create ~/.config/magic-agent/config.toml

      Check your setup with:
        magic-agent doctor --pretty
    EOS
  end

  test do
    assert_match "magic-agent", shell_output("#{bin}/magic-agent --version")
  end
end
