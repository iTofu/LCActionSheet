Pod::Spec.new do |s|

  s.name         = "LCActionSheet"
  s.version      = "2.1.1"
  s.summary      = "A simple, ornamental, but powerful action sheet! Support: http://LeoDev.me"
  s.homepage     = "https://github.com/iTofu/LCActionSheet"
  s.license      = "MIT"
  s.author             = { "Leo" => "devtip@163.com" }
  s.social_media_url   = "http://LeoDev.me"
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/iTofu/LCActionSheet.git", :tag => s.version }
  s.source_files = "LCActionSheet/**/*.{h,m}"
  s.resource     = "LCActionSheet/LCActionSheet.bundle"
  s.requires_arc = true

  s.dependency "Masonry", '~> 1.0.1'

end
