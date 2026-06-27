cask "instant-notes" do
  version "0.1.0"
  sha256 "4b5a5d74ac5d9aab75cbb5837c025d4c0a9ad2df19a12f555c8ebe274785e8aa"

  url "https://github.com/sohakolan/InstantNotes/releases/download/v#{version}/InstantNotes_#{version}_aarch64.dmg"
  name "InstantNotes"
  desc "Pense-bête markdown ultra-rapide pour macOS"
  homepage "https://github.com/sohakolan/InstantNotes"

  depends_on arch: :arm64

  app "InstantNotes.app"

  zap trash: [
    "~/Library/Application Support/com.sohane.instantnotes",
  ]
end
