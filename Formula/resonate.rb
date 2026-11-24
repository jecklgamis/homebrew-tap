class Resonate < Formula
  desc "Load generator for HTTP, WebSocket, gRPC and Server-Sent Events"
  homepage "https://jecklgamis.github.io/resonate/"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jecklgamis/resonate/releases/download/v1.0.0-beta.5/resonate_v1.0.0-beta.5_darwin_arm64.tar.gz"
      sha256 "3a4624ef6d6fcc4991d1e5cfad323e2af7af9bd40785d7beec815595b3297ade"
    end
    on_intel do
      url "https://github.com/jecklgamis/resonate/releases/download/v1.0.0-beta.5/resonate_v1.0.0-beta.5_darwin_amd64.tar.gz"
      sha256 "6e3fe4615ac55c31482d37b34f73b6616eb5301a13dd2a797851e88f95d1fa93"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jecklgamis/resonate/releases/download/v1.0.0-beta.5/resonate_v1.0.0-beta.5_linux_arm64.tar.gz"
      sha256 "c894fb4598bd92eb2f1f5cda2a8ab090eacb60816bb468607ecbe0cc5cd05233"
    end
    on_intel do
      url "https://github.com/jecklgamis/resonate/releases/download/v1.0.0-beta.5/resonate_v1.0.0-beta.5_linux_amd64.tar.gz"
      sha256 "6807118545655d103070d5e825d2b9157bdacd7a701fae846aafb13204e944af"
    end
  end

  def install
    bin.install "resonate"
  end

  test do
    assert_match "resonate", shell_output("#{bin}/resonate --help")
  end
end
