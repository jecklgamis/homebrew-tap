#!/usr/bin/env bash
# Usage: gen-formula.sh <tag> <SHA256SUMS.txt>  > Formula/resonate.rb
set -euo pipefail
tag="$1"; sums="$2"
base="https://github.com/jecklgamis/resonate/releases/download/${tag}"
sha() { awk -v f="resonate_${tag}_$1.tar.gz" '$2==f{print $1}' "$sums"; }
for t in darwin_arm64 darwin_amd64 linux_arm64 linux_amd64; do
  [ -n "$(sha $t)" ] || { echo "missing checksum for $t" >&2; exit 1; }
done
cat <<RB
class Resonate < Formula
  desc "Load generator for HTTP, WebSocket, gRPC and Server-Sent Events"
  homepage "https://jecklgamis.github.io/resonate/"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "${base}/resonate_${tag}_darwin_arm64.tar.gz"
      sha256 "$(sha darwin_arm64)"
    end
    on_intel do
      url "${base}/resonate_${tag}_darwin_amd64.tar.gz"
      sha256 "$(sha darwin_amd64)"
    end
  end

  on_linux do
    on_arm do
      url "${base}/resonate_${tag}_linux_arm64.tar.gz"
      sha256 "$(sha linux_arm64)"
    end
    on_intel do
      url "${base}/resonate_${tag}_linux_amd64.tar.gz"
      sha256 "$(sha linux_amd64)"
    end
  end

  def install
    bin.install "resonate"
  end

  test do
    assert_match "resonate", shell_output("#{bin}/resonate --help")
  end
end
RB
