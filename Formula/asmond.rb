class Asmond < Formula
  desc "macOS power, thermal and activity monitor for Apple Silicon"
  homepage "https://github.com/Fxxrz/asmond"
  url "https://github.com/Fxxrz/asmond/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "f822ebb131b66f09c2fefef794e2213fb92105cc9f0fd0e4e67c6b26648d5b7b"
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
