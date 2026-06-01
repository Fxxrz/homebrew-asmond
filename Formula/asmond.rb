class Asmond < Formula
  desc "macOS power, thermal and activity monitor for Apple Silicon"
  homepage "https://github.com/Fxxrz/asmond"
  url "https://github.com/Fxxrz/asmond/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "c34637de0b9d10aa27febe367f10e5221b463639026e5ea039ffe39e6bf91a73"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "python@3.14"

  def install
    bin.install "asmond.py" => "asmond"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asmond --version")
  end

  def caveats
    <<~EOS
      Asmond stores user settings at:
        ~/Library/Application Support/Asmond/settings.json

      Homebrew does not remove per-user settings automatically.
      Run `asmond --remove-settings` before uninstalling if you want to remove them.
    EOS
  end
end
