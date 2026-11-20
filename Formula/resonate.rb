class Resonate < Formula
  desc "Load generator for HTTP, WebSocket, gRPC and Server-Sent Events"
  homepage "https://jecklgamis.github.io/resonate/"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jecklgamis/resonate/releases/download/v1.0.0-beta.4/resonate_v1.0.0-beta.4_darwin_arm64.tar.gz"
      sha256 "3cf9f604563f5092dd00655ab85985ca453b75271474e9cb3b75d4637ee66c34"
    end
    on_intel do
      url "https://github.com/jecklgamis/resonate/releases/download/v1.0.0-beta.4/resonate_v1.0.0-beta.4_darwin_amd64.tar.gz"
      sha256 "d1ae4a6130161b7f714504ea7a17b209f693bac25dbca9e50487cd968be1b0f2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jecklgamis/resonate/releases/download/v1.0.0-beta.4/resonate_v1.0.0-beta.4_linux_arm64.tar.gz"
      sha256 "7d28a738cad98e560b0214e80237aac9215752e04a8f9689ba1148c4d5ace2b5"
    end
    on_intel do
      url "https://github.com/jecklgamis/resonate/releases/download/v1.0.0-beta.4/resonate_v1.0.0-beta.4_linux_amd64.tar.gz"
      sha256 "aec1141b73d21025355146b7827ca18aee46950ee5c101f0722c50f030a18d2d"
    end
  end

  def install
    bin.install "resonate"
  end

  test do
    assert_match "resonate", shell_output("#{bin}/resonate --help")
  end
end
