# Homebrew formula for the tap repo aivorynet/homebrew-tap (Formula/aivory-code.rb).
# A formula, not a cask: Homebrew does not set the quarantine flag on formula downloads,
# so Gatekeeper does not block the unsigned binaries.
class AivoryCode < Formula
  desc "War room for coding agents: Claude Code, Codex CLI and Gemini CLI on one screen"
  homepage "https://github.com/aivorynet/aivory-code"
  version "2026.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aivorynet/aivory-code/releases/download/v2026.2.0/aivory-macos-arm64.tar.gz"
      sha256 "39f961061d59c0e6a4556f860596926f5a8634e1f7bc053c303b7825807f191b"
    end
    on_intel do
      url "https://github.com/aivorynet/aivory-code/releases/download/v2026.2.0/aivory-macos-x64.tar.gz"
      sha256 "203dbd94c826acd7c5ebe19fc925cc9d89c26bd143a48520d21687f4044b43c9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/aivorynet/aivory-code/releases/download/v2026.2.0/aivory-linux-x64.tar.gz"
      sha256 "ed14b852e03b73d045d27ae5499a03b889f71a5df8269833c3d7535f156e7fd6"
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
