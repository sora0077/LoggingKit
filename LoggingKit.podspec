#
#  Be sure to run `pod spec lint iTunesMusicKit.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.platform = :ios
  s.ios.deployment_target = '8.0'
  s.name         = "LoggingKit"
  s.version      = "2.0.1"
  s.summary      = "LoggingKit."

  s.description  = <<-DESC
                   LoggingKit Kit.
                   DESC

  s.homepage     = "https://github.com/sora0077/LoggingKit"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = { "" => "" }
  s.source       = { :git => "https://github.com/sora0077/LoggingKit.git", :tag => "#{s.version}" }



  s.source_files  = "LoggingKit/**/*.{swift}"
  s.exclude_files = "Classes/Exclude"

end
