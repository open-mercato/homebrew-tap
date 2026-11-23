cask "cezar" do
  version "0.1.13"

  on_arm do
    sha256 "398c6156cc40838cc6dd1283443fcddae60f134e55d0ce19692ac01ea24cf5e5"

    url "https://github.com/open-mercato/cezar/releases/download/desktop-v#{version}/cezar-macos-aarch64.dmg"
  end
  on_intel do
    sha256 "add3f0cb5ff99392fb5e1163c96534158736d806737fd20d949a7a34ef4dd712"

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
