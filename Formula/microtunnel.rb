# Homebrew formula for microtunnel. Homebrew looks for formulae in a tap: this file is
# published as Formula/microtunnel.rb in github.com/jecklgamis/homebrew-tap, then:
#
#   brew tap jecklgamis/tap
#   brew install microtunnel                 # the latest release
#   brew install --HEAD microtunnel          # builds the main branch
#
# It builds from source, so nothing needs signing or notarizing.
#
# To publish a new release: set url to the new tag's tarball and sha256 to
#   curl -sL <url> | shasum -a 256
class Microtunnel < Formula
  desc "Hub-and-spoke layer 3 overlay VPN over TUN and UDP"
  homepage "https://github.com/jecklgamis/microtunnel"
  url "https://github.com/jecklgamis/microtunnel/archive/refs/tags/v1.0.0-alpha.1.tar.gz"
  sha256 "cbb5b0e8d21a3d764ed50b78e4599cc65f8d15ed7d71fef337b1df44726d2420"
  license "Apache-2.0"
  head "https://github.com/jecklgamis/microtunnel.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = "-X main.version=#{version}"
    system "go", "build", *std_go_args(ldflags:), "./cmd/microtunnel"
    (pkgshare/"examples").install "packaging/examples/relay.yaml", "packaging/examples/peer.yaml"
  end

  # `sudo brew services start microtunnel` installs a launchd job that runs the
  # config `microtunnel init` writes. Run `init` first (see the caveats).
  service do
    run [opt_bin/"microtunnel", "-c", "/etc/microtunnel/microtunnel.yaml"]
    keep_alive crashed: true
    require_root true
    log_path var/"log/microtunnel.log"
    error_log_path var/"log/microtunnel.log"
  end

  def caveats
    <<~EOS
      microtunnel creates a tunnel device, which needs root. Set this machine up
      (one command each), then start it:

        sudo microtunnel init relay --endpoint <this-host>:5040
        sudo env MICROTUNNEL_PSK=<psk> microtunnel init peer \\
          --relay <relay-host>:5040 --relay-key <relay public key>

      and run it in the foreground with `sudo microtunnel`, or in the background and
      at boot with `sudo brew services start microtunnel`. Config and keys live in
      /etc/microtunnel; logs are in #{var}/log/microtunnel.log. Sample configs are
      in #{pkgshare}/examples.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/microtunnel -version")

    # Key generation needs no root and no network.
    system bin/"microtunnel", "keygen", "brewtest", "-dir", testpath
    assert_path_exists testpath/"brewtest.key"
    assert_path_exists testpath/"brewtest.crt"
  end
end
