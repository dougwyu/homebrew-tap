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

  depends_on macos: :ventura

  app "EarthWallpaper.app"

  zap trash: "~/Library/Preferences/com.earthwallpaper.app.plist"

  caveats <<~EOS
    EarthWallpaper is ad-hoc signed, not notarised, so macOS blocks the first
    launch. Once, right-click EarthWallpaper in Applications and choose Open
    (Homebrew carries that approval forward on upgrades), or run:
      xattr -dr com.apple.quarantine "#{appdir}/EarthWallpaper.app"
  EOS
end
