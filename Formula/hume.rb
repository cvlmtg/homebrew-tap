class Hume < Formula
  desc "Modal text editor for the terminal"
  homepage "https://cvlmtg.github.io/HUME/"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/cvlmtg/HUME/releases/download/v0.20.1/hume-0.20.1-e283b9a9f-aarch64-apple-darwin.tar.gz"
      sha256 "43b4be6dedcc9645be04e8b9101bed35c6388cf883b5135e545898f25a19eed0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cvlmtg/HUME/releases/download/v0.20.1/hume-0.20.1-e283b9a9f-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6f4928dfe72c6b99b048eaa6969d5a8271907360785bdb71b89577aca563e064"
    end
    on_arm do
      url "https://github.com/cvlmtg/HUME/releases/download/v0.20.1/hume-0.20.1-e283b9a9f-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8c3009c4c04e5ed91660c261dfad7c955b3d6042bcff31763e48ea9048ff553a"
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
