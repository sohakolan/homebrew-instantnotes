cask "instant-notes" do
  version "0.2.1"
  sha256 "070fdded19f0a367455dc48357d0567a0ed8b1731e40f98f2632c44233d5bde9"

  url "https://github.com/sohakolan/InstantNotes/releases/download/v#{version}/InstantNotes_#{version}_aarch64.dmg"
  name "InstantNotes"
  desc "Pense-bête markdown ultra-rapide"
  homepage "https://github.com/sohakolan/InstantNotes"

  depends_on arch: :arm64
  depends_on :macos

  app "InstantNotes.app"

  # App signée en ad-hoc mais non notarisée : on retire la mise en quarantaine
  # ajoutée par macOS, sinon le 1er lancement échoue avec « InstantNotes est endommagé ».
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-c", "-r", "#{appdir}/InstantNotes.app"]
  end

  zap trash: "~/Library/Application Support/com.sohane.instantnotes"

  caveats <<~EOS
    InstantNotes n'est pas notarisée par Apple. Si macOS affiche encore
    « InstantNotes est endommagé », exécute puis relance l'app :
      xattr -cr "#{appdir}/InstantNotes.app"
  EOS
end
