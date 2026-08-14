class LocalAction < Formula
  desc "Self-hosted web UI for running GitHub Actions workflows locally via act + Docker"
  homepage "https://github.com/adishM98/local-action"
  license "MIT"

  # Plain prebuilt binary, not built from source here — same asset the
  # curl-based install in the README uses (see docs/RELEASE.md). No .app
  # bundle, so this is a Formula, not a Cask.
  depends_on "act"

  on_macos do
    on_arm do
      url "https://github.com/adishM98/local-action/releases/download/v0.10.1/local-action_0.10.1_darwin_arm64"
      sha256 "766abbe00de5cc4b4fbacfe79729e2a6aeef1efad288a9f014db2e20aa323497"
    end
    on_intel do
      url "https://github.com/adishM98/local-action/releases/download/v0.10.1/local-action_0.10.1_darwin_amd64"
      sha256 "7e4f87b6a45659f6b366c41574997ab3922a5de1b9da4f528073f3100a6981c7"
    end
  end

  def install
    bin.install Dir["local-action_*"].first => "local-action"
  end

  test do
    # -h exits via Go's flag package without starting the server.
    system "#{bin}/local-action", "-h"
  end
end
