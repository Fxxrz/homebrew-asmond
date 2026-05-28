class Asmond < Formula
  desc "macOS power, thermal and activity monitor for Apple Silicon"
  homepage "https://github.com/Fxxrz/asmond"
  url "https://github.com/Fxxrz/asmond/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "3547ef1d3183b9db6550c38d5ec4363490a4a3ae4b5f9282b005d6647948e1c9"
  license "MIT"

  depends_on :macos
  depends_on arch: :arm64
  depends_on "python@3.14"

  def install
    bin.install "asmond.py" => "asmond"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asmond --version")
  end
end
