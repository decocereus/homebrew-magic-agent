class MagicAgent < Formula
  desc "Natural-language editing CLI for DaVinci Resolve"
  homepage "https://github.com/decocereus/magic-agent"
  url "https://github.com/decocereus/magic-agent/releases/download/v0.1.0/magic-agent-v0.1.0-macos.tar.gz"
  sha256 "PLACEHOLDER_SHA256_WILL_BE_UPDATED_BY_CI"
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
