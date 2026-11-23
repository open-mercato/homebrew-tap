cask "cezar" do
  version "0.1.15"

  on_arm do
    sha256 "62504bf1db10d6cb4c3f0f1c268fd6b315f0598996fb79938c2ab899901cae65"

    url "https://github.com/open-mercato/cezar/releases/download/desktop-v#{version}/cezar-macos-aarch64.dmg"
  end
  on_intel do
    sha256 "81224beb4072cf5c7d74bb2b6dfb296c227e16b828c8bccfa17e20be33b654f4"

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
