class Asmond < Formula
  desc "macOS power, thermal and activity monitor for Apple Silicon"
  homepage "https://github.com/Fxxrz/asmond"
  url "https://github.com/Fxxrz/asmond/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "cb66d39311467bbccd9547263e3c29b6fea774491eb242e980d740c850f07c3a"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "python@3.14"

  def install
    bin.install "asmond.py" => "asmond"
    man1.install "man/asmond.1"
  end

  def caveats
    <<~EOS
      Asmond stores user settings at:
        ~/Library/Application Support/Asmond/settings.json

      Homebrew does not remove per-user settings automatically.
      Run `asmond --remove-settings` before uninstalling if you want to remove them.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asmond --version")
  end
end
