cask "cezar" do
  version "0.1.12"

  on_arm do
    sha256 "a74aeddc1e932be22b2ea2d1e9a9c3be0ab4b46acc9a706a8dd5559c818dbc3b"

    url "https://github.com/open-mercato/cezar/releases/download/desktop-v#{version}/cezar-macos-aarch64.dmg"
  end
  on_intel do
    sha256 "eaca878f3af1b7547690134525db6289921be0c9dbf220e5477e057f29802fd3"

    url "https://github.com/open-mercato/cezar/releases/download/desktop-v#{version}/cezar-macos-x86_64.dmg"
  end

  name "Cezar"
  desc "Local cockpit for AI coding agents"
  homepage "https://github.com/open-mercato/cezar"

  livecheck do
    url :url
    regex(/^desktop-v?(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  auto_updates true
  depends_on macos: :monterey

  app "Cezar.app"
  binary "#{appdir}/Cezar.app/Contents/Resources/bin/cez"
  binary "#{appdir}/Cezar.app/Contents/Resources/bin/cezar"

  # ~/.cezar is shared with the cezar CLI (projects, managers, accounts), so only the files the
  # desktop app alone owns there are removed.
  zap trash: [
    "~/.cezar/desktop-notch.json",
    "~/.cezar/desktop-window.json",
    "~/.cezar/node",
    "~/Library/Application Support/com.openmercato.cezar",
    "~/Library/Caches/com.openmercato.cezar",
    "~/Library/HTTPStorages/com.openmercato.cezar",
    "~/Library/Logs/com.openmercato.cezar",
    "~/Library/Preferences/com.openmercato.cezar.plist",
    "~/Library/Saved Application State/com.openmercato.cezar.savedState",
    "~/Library/WebKit/com.openmercato.cezar",
  ]
end
