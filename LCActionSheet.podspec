#
# Be sure to run `pod lib lint LCActionSheet.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LCActionSheet'
  s.version          = '3.5.5'
  s.summary          = 'A simple, ornamental, but powerful action sheet! Support: https://LeoDev.me'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
                       A simple, ornamental, but powerful action sheet! Support: https://LeoDev.me
                       一款简约而不失强大的 ActionSheet，微博、微信和 QQ 都采用了极其类似的样式，完全支持 Swift。
                       DESC

  s.homepage         = 'https://github.com/iTofu/LCActionSheet'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Leo' => 'leodaxia@gmail.com' }
  s.source           = { :git => 'https://github.com/iTofu/LCActionSheet.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/LeoDaxia'

  s.swift_version = "4.2"

  s.ios.deployment_target = '8.0'

  s.source_files = 'LCActionSheet/Classes/**/*'
  
  # s.resource_bundles = {
  #   'LCActionSheet' => ['LCActionSheet/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.dependency 'Masonry', '~> 1.1.0'
end
