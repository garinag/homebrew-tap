cask "review-reminder" do
  version "0.3.1"
  sha256 "60827ff91930216fa8d1da3faf1cbba82978bba6c47c7c381b8887447e8b5a61"

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
