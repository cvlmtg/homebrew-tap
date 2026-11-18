class Hume < Formula
  desc "Modal text editor for the terminal"
  homepage "https://cvlmtg.github.io/HUME/"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/cvlmtg/HUME/releases/download/v0.22.1/hume-0.22.1-20f23dc55-aarch64-apple-darwin.tar.gz"
      sha256 "a531877e5c00366612f25b124c4dc88e3d75f455cefa01da6d2ee9a860745bd4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cvlmtg/HUME/releases/download/v0.22.1/hume-0.22.1-20f23dc55-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "780879f6391be495c659ee069e0a122ade3d246af473a33152666cc7127e56aa"
    end
    on_arm do
      url "https://github.com/cvlmtg/HUME/releases/download/v0.22.1/hume-0.22.1-20f23dc55-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c38ce97d635cdd4231309d6cfbfc8fc994456c84b30bbfb8e51718c6c9505063"
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
