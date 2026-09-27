cask "earthwallpaper" do
  version "1.1.0"
  sha256 "c433d7474d801802aab6de83dbd8dc27e9222dc1420a123bba76230653ef9d8c"

  url "https://github.com/dougwyu/EarthWallpaper/releases/download/v#{version}/EarthWallpaper-#{version}.zip"
  name "EarthWallpaper"
  desc "Live map of Earth on the desktop with the day/night terminator and city clocks"
  homepage "https://github.com/dougwyu/EarthWallpaper"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "EarthWallpaper.app"

  caveats <<~EOS
    EarthWallpaper is ad-hoc signed, not notarised. Install with
      brew install --cask --no-quarantine earthwallpaper
    so macOS does not block the first launch, or right-click the app and
    choose Open the first time.
  EOS

  zap trash: [
    "~/Library/Preferences/com.earthwallpaper.app.plist",
  ]
end
