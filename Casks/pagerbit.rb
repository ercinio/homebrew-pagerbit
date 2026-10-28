cask "pagerbit" do
  version "0.12.0"
  sha256 "5491af70afa8f4d0429f52aa38fc8f3a3674c29ee51089e49624159f33550eaf"

  url "https://github.com/ercinio/pagerbit/releases/download/v#{version}/Pagerbit-#{version}.dmg"
  name "Pagerbit"
  desc "AI coding agents in the Mac notch — monitor, approve, answer, and see your whole AI bill"
  homepage "https://ercin.io/apps/pagerbit"

  livecheck do
    url "https://github.com/ercinio/pagerbit/releases/latest/download/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: ">= :sequoia"

  app "Pagerbit.app"

  # Ad-hoc signed build: clear quarantine so first launch doesn't need right-click ▸ Open.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Pagerbit.app"], sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Pagerbit",
    "~/Library/Application Support/TokenLens",
    "~/Library/Preferences/com.ercinio.TokenLens.plist",
  ]
end
