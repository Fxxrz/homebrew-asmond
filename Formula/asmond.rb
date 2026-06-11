class Asmond < Formula
  desc "macOS power, thermal and activity monitor for Apple Silicon"
  homepage "https://github.com/Fxxrz/asmond"
  url "https://github.com/Fxxrz/asmond/archive/refs/tags/v0.4.2.tar.gz"
  sha256 "770c7036e25d45e768a5a28c61bbf9de5a69e01b333669c3390f811b83eae0ba"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "python@3.14"

  def install
    libexec.install "asmond.py"
    libexec.install Dir["asmond_*.py"]
    (bin/"asmond").write <<~EOS
      #!/bin/sh
      exec "#{libexec}/asmond.py" "$@"
    EOS
    chmod 0755, bin/"asmond"
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
    assert_match "\"app\": \"Asmond\"", shell_output("#{bin}/asmond report --mock --json")
  end
end
