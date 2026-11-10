class Resonate < Formula
  desc "Load generator for HTTP, WebSocket, gRPC and Server-Sent Events"
  homepage "https://jecklgamis.github.io/resonate/"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jecklgamis/resonate/releases/download/v1.0.0-beta.3/resonate_v1.0.0-beta.3_darwin_arm64.tar.gz"
      sha256 "062a3a8a6b1da0cabd98bd7226cac442a89a139e5acab57ba469e49230d35ed0"
    end
    on_intel do
      url "https://github.com/jecklgamis/resonate/releases/download/v1.0.0-beta.3/resonate_v1.0.0-beta.3_darwin_amd64.tar.gz"
      sha256 "90c0df20d562106f0bb876b580040399ee0988fc49bb365086f653c1d6334578"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jecklgamis/resonate/releases/download/v1.0.0-beta.3/resonate_v1.0.0-beta.3_linux_arm64.tar.gz"
      sha256 "dfffb1e91b307b38d0958056ad6b31c5358a9277a77e030cf551e94971a725a0"
    end
    on_intel do
      url "https://github.com/jecklgamis/resonate/releases/download/v1.0.0-beta.3/resonate_v1.0.0-beta.3_linux_amd64.tar.gz"
      sha256 "81928713e5541f7ff3b9c06c76c58f61042f20021a385e20d11c883fac66774e"
    end
  end

  def install
    bin.install "resonate"
  end

  test do
    assert_match "resonate", shell_output("#{bin}/resonate --help")
  end
end
