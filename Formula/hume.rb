class Hume < Formula
  desc "Modal text editor for the terminal"
  homepage "https://cvlmtg.github.io/HUME/"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/cvlmtg/HUME/releases/download/v0.22.2/hume-0.22.2-0d9059914-aarch64-apple-darwin.tar.gz"
      sha256 "01db35354f2797d52ae86e0a02ec43de760e1aa07466cf50d77a3d0d8ae0b0ac"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cvlmtg/HUME/releases/download/v0.22.2/hume-0.22.2-0d9059914-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2079954a0745328358b037a1c3c73526202f3b441d3780fa6e774ff92f22707c"
    end
    on_arm do
      url "https://github.com/cvlmtg/HUME/releases/download/v0.22.2/hume-0.22.2-0d9059914-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "32114beccef0f065e99c52c0c48da04bfca49513cc45c95bd1abb43598d9c5aa"
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
