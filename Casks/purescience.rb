cask "purescience" do
  version "2.27.0"
  sha256 arm:   "c90065bc6756e4e44f51c043024751220ee13b209abf27a9663017f045890bdc",
         intel: "630858c39663adeb49b75327ffeef2879da56ba0a80a4d47dec1016125b090ef"

  url "https://github.com/naiyixi/PureScience/releases/download/v#{version}/zerolink-purescience-#{version}-mac-#{Hardware::CPU.arm? ? "arm64" : "x64"}.dmg"
  name "PureScience"
  desc "Scientific AI workbench: agent sessions, notebook, references"
  homepage "https://github.com/naiyixi/PureScience"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "PureScience.app"

  zap trash: [
    "~/.purescience",
    "~/.purescience-project",
  ]

  caveats <<~EOS
    PureScience is signed with a Developer ID Application certificate and notarized
    by Apple as of 2.27.0, so a quarantined copy should pass Gatekeeper. Earlier
    versions (2.26.0 and before) were ad-hoc signed and were not notarized.

    If macOS still refuses the first launch on this version, that is a defect worth
    reporting; as a workaround you can reinstall with:

      brew install --cask --no-quarantine purescience
  EOS
end
