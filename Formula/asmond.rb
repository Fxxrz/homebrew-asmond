class Asmond < Formula
  desc "macOS terminal power, thermal and activity monitor"
  homepage "https://github.com/Fxxrz/asmond"
  url "https://github.com/Fxxrz/asmond/archive/refs/tags/v0.5.2.tar.gz"
  sha256 "161a789716a962d85e87a13119301ccd09671b0ddc240518ae3e4db930349ac9"
  license "MIT"

  depends_on :macos
  depends_on "python@3.14"

  def install
    python = formula_opt_bin("python@3.14")/"python3.14"
    libexec.install "asmond.py"
    libexec.install Dir["asmond_*.py"]
    (bin/"asmond").write <<~EOS
      #!/bin/sh
      exec "#{python}" "#{libexec}/asmond.py" "$@"
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
