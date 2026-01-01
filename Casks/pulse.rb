cask "pulse" do
  version "0.0.3"

  if Hardware::CPU.arm?
    sha256 "557b19788251d16e2ac0acd24504abbe22962a91a5aee39f8a45807451861b6c"
    url "https://github.com/ultrasev/pulse/releases/download/v#{version}/Pulse_#{version}_aarch64.dmg"
  else
    sha256 "db8ecdfc08072e74aeb7c3e2d4e39fb8ad131436baeec99ba0b63a3c316afdf5"
    url "https://github.com/ultrasev/pulse/releases/download/v#{version}/Pulse_#{version}_x64.dmg"
  end

  name "Pulse"
  desc "Lightweight system monitoring desktop app"
  homepage "https://github.com/ultrasev/pulse"

  app "Pulse.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-d", "com.apple.quarantine", "#{appdir}/Pulse.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/com.pulse.dev",
    "~/Library/Caches/com.pulse.dev",
    "~/Library/Preferences/com.pulse.dev.plist",
  ]
end
