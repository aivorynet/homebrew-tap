# Homebrew formula for the tap repo aivorynet/homebrew-tap (Formula/aivory-code.rb).
# A formula, not a cask: Homebrew does not set the quarantine flag on formula downloads,
# so Gatekeeper does not block the unsigned binaries.
class AivoryCode < Formula
  desc "War room for coding agents: Claude Code, Codex CLI and Gemini CLI on one screen"
  homepage "https://github.com/aivorynet/aivory-code"
  version "2026.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aivorynet/aivory-code/releases/download/v2026.2.1/aivory-macos-arm64.tar.gz"
      sha256 "1d850b36d2ee5907843bc8f5e15276601710987a162cdbd1388a58b1466f2c3f"
    end
    on_intel do
      url "https://github.com/aivorynet/aivory-code/releases/download/v2026.2.1/aivory-macos-x64.tar.gz"
      sha256 "63a3378e158497205ab188d55a7210008f055f149f71d23d3611fce93a34c8ea"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/aivorynet/aivory-code/releases/download/v2026.2.1/aivory-linux-x64.tar.gz"
      sha256 "e0fa1a0e0fbe73eefaf147477c9b173ba6862c9655e83e222dd2311c11a0ebe2"
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
