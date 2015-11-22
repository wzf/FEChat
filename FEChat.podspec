Pod::Spec.new do |s|
  s.name             = "FEChat"
  s.version          = "0.0.1"
  s.summary          = "意在维护一个简洁的聊天库，只有“会话列表”跟“聊天室”，没有其他复杂的功能，这样更能够轻巧的融合到自己的项目中。"

  s.homepage         = "https://github.com/wzf/FEChat"
  s.license          = 'MIT'
  s.author           = { "wzf" => "feng4job@gmail.com" }
  s.source           = { :git => "https://github.com/wzf/FEChat.git", :tag => "0.0.1" }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'FEChat' => ['Pod/Assets/*.png']
  }

  s.frameworks   = 'Foundation', 'CoreGraphics', 'UIKit', 'MobileCoreServices', 'AVFoundation', 'CoreLocation', 'MediaPlayer', 'CoreMedia', 'CoreText', 'AudioToolbox'
end
