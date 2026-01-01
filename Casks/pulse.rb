cask "pulse" do
  version "0.0.4"

  if Hardware::CPU.arm?
    sha256 "c7814fb2934a6813322979a44550052780eb7ffbb018a5903f8ad27696b794ee"
    url "https://github.com/ultrasev/pulse/releases/download/v#{version}/Pulse_#{version}_aarch64.dmg"
  else
    sha256 "26115a7fb2684389222830df04015a9fbb1b46877ca396577b5a16da84422c6e"
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
