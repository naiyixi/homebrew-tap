cask "purescience" do
  version "2.26.0"
  sha256 arm:   "4848c62a5970779d1d70f22500948c3c17a109b457180bff37c004225a1414ea",
         intel: "58ebff106806860a39845e535e91d1963c4d2ad97cb32a1b068af28d661c1df4"

  url "https://github.com/naiyixi/PureScience/releases/download/v#{version}/zerolink-purescience-#{version}-mac-#{Hardware::CPU.arm? ? "arm64" : "x64"}.dmg",
      verified: "github.com/naiyixi/PureScience/"
  name "PureScience"
  desc "Scientific AI workbench: agent sessions, notebook, references"
  homepage "https://github.com/naiyixi/PureScience"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "PureScience.app"

  caveats <<~EOS
    This build is signed ad-hoc and is not notarized yet, so macOS may refuse the
    first launch after Homebrew installs it. If that happens, reinstall with:

      brew install --cask --no-quarantine purescience

    Notarization is tracked for the next release; the caveat will be removed then.
  EOS
end
