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
      url "https://github.com/adishM98/local-action/releases/download/v0.10.0/local-action_0.10.0_darwin_arm64"
      sha256 "afefed31a7e7b838dc4ebe3852eccb992571c7aa395b4fe4f9843c1899fd9bc8"
    end
    on_intel do
      url "https://github.com/adishM98/local-action/releases/download/v0.10.0/local-action_0.10.0_darwin_amd64"
      sha256 "d4ef78f918f1a6891d7bf6d0a9a9c113d7a094dddfea3e769f0129907ff2021a"
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
