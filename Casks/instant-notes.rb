cask "instant-notes" do
  version "0.2.0"
  sha256 "0704558b2df8053891671f45d4566a218bce2237558e62f88e5796c4dca28d4f"

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
