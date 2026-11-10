# Homebrew formula for the tap repo aivorynet/homebrew-tap (Formula/aivory-code.rb).
# A formula, not a cask: Homebrew does not set the quarantine flag on formula downloads,
# so Gatekeeper does not block the unsigned binaries.
class AivoryCode < Formula
  desc "War room for coding agents: Claude Code, Codex CLI and Gemini CLI on one screen"
  homepage "https://github.com/aivorynet/aivory-code"
  version "2026.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aivorynet/aivory-code/releases/download/v2026.1.0/aivory-macos-arm64.tar.gz"
      sha256 "5731575327dd6eb0e0a0c1188159ef852aee457f6a65c38558f53f7741c0f3af"
    end
    on_intel do
      url "https://github.com/aivorynet/aivory-code/releases/download/v2026.1.0/aivory-macos-x64.tar.gz"
      sha256 "ac1681cf209cd2dc2dd0df46c8bf3eaccd6c6b63f689928f70ac1369b92c2010"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/aivorynet/aivory-code/releases/download/v2026.1.0/aivory-linux-x64.tar.gz"
      sha256 "995dae7d8c04da85cbe75445d9cb1cf7c991a47c1fc518e4e8e3c6be7fbe7958"
    end
  end

  def install
    # The app starts the daemon from its own folder, so both stay side by side.
    libexec.install "aivory", "aivoryd"
    bin.install_symlink libexec/"aivory", libexec/"aivoryd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aivoryd --version")
  end
end
