# Homebrew formula for the tap repo aivorynet/homebrew-tap (Formula/aivory-code.rb).
# A formula, not a cask: Homebrew does not set the quarantine flag on formula downloads,
# so Gatekeeper does not block the unsigned binaries.
class AivoryCode < Formula
  desc "War room for coding agents: Claude Code, Codex CLI and Gemini CLI on one screen"
  homepage "https://github.com/aivorynet/aivory-code"
  version "2026.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aivorynet/aivory-code/releases/download/v2026.2.2/aivory-macos-arm64.tar.gz"
      sha256 "1b769d3a512de2a186570d8c3bcefe490141c9f62a8a7aab8f78e9200f49a7a3"
    end
    on_intel do
      url "https://github.com/aivorynet/aivory-code/releases/download/v2026.2.2/aivory-macos-x64.tar.gz"
      sha256 "7839ac0af099c15210d5f8623fa9dfad417ebe9985b76018208aeb897c75d86d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/aivorynet/aivory-code/releases/download/v2026.2.2/aivory-linux-x64.tar.gz"
      sha256 "905ae872f9d8bdc0fda30d3189003cfcfe569b110571917f4303fb526cf37207"
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
