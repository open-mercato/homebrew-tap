cask "cezar" do
  version "0.1.17"

  on_arm do
    sha256 "2853338ec2740722efd4c89c1d315610353183e6eed3e71c9bbefecda5469f3d"

    url "https://github.com/open-mercato/cezar/releases/download/desktop-v#{version}/cezar-macos-aarch64.dmg"
  end
  on_intel do
    sha256 "77352c3c1d382b84794c3df26f947029f2d131f76e0db647862de32afcea8eac"

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
