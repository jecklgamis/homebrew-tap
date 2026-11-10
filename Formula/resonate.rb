class Resonate < Formula
  desc "Load generator for HTTP, WebSocket, gRPC and Server-Sent Events"
  homepage "https://jecklgamis.github.io/resonate/"
  version "1.0.0-beta.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jecklgamis/resonate/releases/download/v1.0.0-beta.2/resonate_v1.0.0-beta.2_darwin_arm64.tar.gz"
      sha256 "083a88787072e65e9d2482e0ab2c678aee3923c7333ceb674761a6325e02daef"
    end
    on_intel do
      url "https://github.com/jecklgamis/resonate/releases/download/v1.0.0-beta.2/resonate_v1.0.0-beta.2_darwin_amd64.tar.gz"
      sha256 "d9e532a382fb4b451020dcbcb89f82b94145dff5fe0a44f385c1e215bebb1b6c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jecklgamis/resonate/releases/download/v1.0.0-beta.2/resonate_v1.0.0-beta.2_linux_arm64.tar.gz"
      sha256 "66f01220447905e5465150a2b387fc86054fa01905ef306cab4d3c8412771aff"
    end
    on_intel do
      url "https://github.com/jecklgamis/resonate/releases/download/v1.0.0-beta.2/resonate_v1.0.0-beta.2_linux_amd64.tar.gz"
      sha256 "301f7d4649ad14175455d6058dccbc940b26c9b8de37ed55e7cafde19d75f09f"
    end
  end

  def install
    bin.install "resonate"
  end

  test do
    assert_match "resonate", shell_output("#{bin}/resonate --help")
  end
end
