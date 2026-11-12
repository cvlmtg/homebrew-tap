class Hume < Formula
  desc "Modal text editor for the terminal"
  homepage "https://cvlmtg.github.io/HUME/"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/cvlmtg/HUME/releases/download/v0.21.0/hume-0.21.0-531ae018f-aarch64-apple-darwin.tar.gz"
      sha256 "515c86dc378084213b7982b99863bcd1ac48f8ee9dd7d9a48aa505f9ca9718ca"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cvlmtg/HUME/releases/download/v0.21.0/hume-0.21.0-531ae018f-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9b6233e1c6759a9c89faeaf3fc723fbc0585abbcdd6b13e7837c437fb3a76cf7"
    end
    on_arm do
      url "https://github.com/cvlmtg/HUME/releases/download/v0.21.0/hume-0.21.0-531ae018f-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "80ae36d98ecaf804547239009e5e4a044885f2021f9b0e37d05024ea03a402c9"
    end
  end

  def install
    bin.install "bin/hume"
    pkgshare.install "share/hume/runtime"
  end

  test do
    (testpath/"in.txt").write "hello\n"
    # :tutor opens the tutor from the runtime directory, and --output writes
    # the buffer it leaves focused.
    system bin/"hume", "--no-config", "--keys", ":tutor<ret>",
           "--output", testpath/"out.txt", testpath/"in.txt"
    assert_match "HUME Tutor", (testpath/"out.txt").read
  end
end
