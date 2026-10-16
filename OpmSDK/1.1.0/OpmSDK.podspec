#
# OpmSDK.podspec
# 新石器 iOS SDK（二进制发布）
#
# 发布流程见 release_package/README.md 或 release.sh
# 二进制包托管在 GitHub Releases：https://github.com/neolix-ai/OpmSDK-iOS/releases
#

Pod::Spec.new do |s|
  s.name         = 'OpmSDK'
  s.version      = '1.1.0'
  s.summary      = '新石器 iOS SDK'
  s.description  = '新石器无人车 iOS SDK：车辆列表、详情、监控、蓝牙遥控等能力。'
  s.homepage     = 'https://github.com/neolix-ai/OpmSDK-iOS'
  s.license      = { :type => 'Commercial', :text => 'Copyright © Neolix. All rights reserved.' }
  s.author       = { 'Neolix' => 'wangjianye@neolix.ai' }

  s.platform     = :ios, '13.0'
  s.source       = { :http => "https://github.com/neolix-ai/OpmSDK-iOS/releases/download/#{s.version}/OpmSDK-#{s.version}.zip" }

  # 静态库：客户工程无论是否 use_frameworks! 都能集成
  s.static_framework    = true
  s.vendored_frameworks = 'OpmSDK.xcframework'
  # SDK 通过 [NSBundle bundleForClass:] 在主 bundle 中查找 OpmSDK.bundle
  s.resources           = 'OpmSDK.bundle'
  s.frameworks          = 'CoreBluetooth', 'CoreLocation', 'AVFoundation'

  s.dependency 'MJRefresh'
  s.dependency 'AFNetworking'
  s.dependency 'SDWebImage'
  s.dependency 'SDWebImageWebPCoder'
  s.dependency 'Masonry'
  s.dependency 'MJExtension'
  s.dependency 'AMap3DMap-NO-IDFA'
  s.dependency 'AMapLocation-NO-IDFA'
  s.dependency 'AMapSearch-NO-IDFA'
  s.dependency 'WebRTC-SDK', '137.7151.01'      # 来自 https://github.com/webrtc-sdk/Specs.git
  s.dependency 'CocoaAsyncSocket', '~> 7.6.5'
  s.dependency 'CocoaLumberjack'

  # 模拟器只有 x86_64（高德地图 SDK 限制），Apple Silicon 模拟器需排除 arm64
  s.pod_target_xcconfig  = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
end
