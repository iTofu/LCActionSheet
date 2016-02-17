Pod::Spec.new do |s|

  s.name         = "LCActionSheet"
  s.version      = "1.1.5"
  s.summary      = "Show a simple elegance action sheet with one line of code.  Support: http://LeoDev.me"
  s.homepage     = "https://github.com/LeoiOS/LCActionSheet"
  s.license      = "MIT"
  s.author             = { "Leo" => "devtip@163.com" }
  s.social_media_url   = "http://LeoDev.me"
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/LeoiOS/LCActionSheet.git", :tag => s.version }
  s.source_files = "LCActionSheet/**/*.{h,m}"
  s.resource     = 'LCActionSheet/LCActionSheet.bundle'
  s.requires_arc = true

end
