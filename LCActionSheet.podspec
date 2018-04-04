Pod::Spec.new do |s|

  s.name         = "LCActionSheet"
  s.version      = "3.5.0"
  s.summary      = "A simple, ornamental, but powerful action sheet! Support: https://LeoDev.me"
  s.homepage     = "https://github.com/iTofu/LCActionSheet"
  s.license      = "MIT"
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/iTofu/LCActionSheet.git", :tag => s.version }
  s.source_files = "Source/**/*.{h,m}"
  s.requires_arc = true

  s.author           = { "Leo" => "leodaxia@gmail.com" }
  s.social_media_url = "https://twitter.com/LeoDaxia"

  s.dependency "Masonry", '~> 1.1.0'

end
