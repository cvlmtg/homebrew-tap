class Hume < Formula
  desc "Modal text editor for the terminal"
  homepage "https://cvlmtg.github.io/HUME/"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/cvlmtg/HUME/releases/download/v0.20.0/hume-0.20.0-d1695c10c-aarch64-apple-darwin.tar.gz"
      sha256 "6be730d0500ae306f4da4fa52e484f8e0cf6dd666794c2dc8bd6eaa70dfa262b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cvlmtg/HUME/releases/download/v0.20.0/hume-0.20.0-d1695c10c-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bdc6cdd97e6ba193a6e0118945f5d39725d8de065d53290a1d7221514b4a891f"
    end
    on_arm do
      url "https://github.com/cvlmtg/HUME/releases/download/v0.20.0/hume-0.20.0-d1695c10c-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a95eb7ca77b72d8352f69351d862a0ff20b32eb7ec8db339d691a0bd6146cfbc"
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
