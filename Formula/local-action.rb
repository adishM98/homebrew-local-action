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
      url "https://github.com/adishM98/local-action/releases/download/v0.9.8/local-action_0.9.8_darwin_arm64"
      sha256 "040164bc8d184c984339dd5984106a6996e9eafaba9c09bb2eb3c1f56ce0520f"
    end
    on_intel do
      url "https://github.com/adishM98/local-action/releases/download/v0.9.8/local-action_0.9.8_darwin_amd64"
      sha256 "31e057fba16684481e685f836a42511ca20ce7def5832a415a6b010c3baa9409"
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
