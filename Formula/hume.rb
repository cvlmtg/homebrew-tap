class Hume < Formula
  desc "Modal text editor for the terminal"
  homepage "https://cvlmtg.github.io/HUME/"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/cvlmtg/HUME/releases/download/v0.22.0/hume-0.22.0-71ea0699e-aarch64-apple-darwin.tar.gz"
      sha256 "a61c656a5233606311ac0c785170c19ad5e4ed481159722db0af7e9c568db363"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cvlmtg/HUME/releases/download/v0.22.0/hume-0.22.0-71ea0699e-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b62f2aec4e9b3cf4ad15efabf17993aa8e06638edc7e6a7012913322cfcc9679"
    end
    on_arm do
      url "https://github.com/cvlmtg/HUME/releases/download/v0.22.0/hume-0.22.0-71ea0699e-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "51b6a3094a16d045036f8f6c97b66c12ff4749a4401d617e45eadd5c6cb27e81"
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
