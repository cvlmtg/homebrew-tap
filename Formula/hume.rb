class Hume < Formula
  desc "Modal text editor for the terminal"
  homepage "https://cvlmtg.github.io/HUME/"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/cvlmtg/HUME/releases/download/v0.19.0/hume-0.19.0-9325f2b6c-aarch64-apple-darwin.tar.gz"
      sha256 "26ba3eebdca475bba6af7750a92d7bdeccbff7f01406454273879f7aa286f364"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/cvlmtg/HUME/releases/download/v0.19.0/hume-0.19.0-9325f2b6c-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c0c7ef8f2b2e84e3c7420bb7ffe5f0b108d3e26b8a68c689b186d09d73c9a6f7"
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
