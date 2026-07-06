cask "review-reminder" do
  version "0.3.0"
  sha256 "d889da83e873132e5c9b2bd7fc68979139c1768081de5837a7a9fd37cf37876c"

  url "https://github.com/garinag/review-reminder/releases/download/v#{version}/ReviewReminder.zip"
  name "Review Reminder"
  desc "Трей-приложение для macOS, напоминает про открытые GitLab merge request'ы"
  homepage "https://github.com/garinag/review-reminder"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "ReviewReminder.app"

  postflight do
    system_command "/usr/bin/xattr",
                    args: ["-rd", "com.apple.quarantine", "#{appdir}/ReviewReminder.app"],
                    sudo: false
  end

  zap trash: [
    "~/Library/Application Support/ReviewReminder",
    "~/Library/Preferences/com.reviewreminder.plist",
  ]
end
