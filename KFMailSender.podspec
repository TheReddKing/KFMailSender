Pod::Spec.new do |s|
  s.name         = "KFMailSender"
  s.version      = "1.0.0"
  s.summary      = "Send information to yourself from users."

  s.description  = <<-DESC
                   ** KFMailSender** is a Mail Thing that sends iOS data
                   DESC

  s.homepage     = "https://github.com/TheReddKing/KFMailSender"
  s.screenshots  = ""

  s.license      = { :type => "MIT", :file => "LICENSE.md" }
  s.author    = "Kevin Fang"
  s.social_media_url   = "http://apps.reddolution.com"
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/TheReddKing/KFMailSender.git", :tag => "1.0.0" }
  s.source_files  = "KFMailSender/*"
  s.framework  = "UIKit"
  s.requires_arc = true
end
