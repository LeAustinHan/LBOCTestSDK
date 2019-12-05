#
# Be sure to run `pod lib lint LBOCTestSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LBOCTestSDK'
  s.version          = '0.2.5'
  s.summary          = 'A test project of LBOCTestSDK. test'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  TODO: Add long description of the pod here.test for LBOC Project
                       DESC

  s.homepage         = 'https://github.com/LeAustinHan/LBOCTestSDK'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '314456527@qq.com' => '314456527@qq.com' }
  s.source           = { :git => 'https://github.com/LeAustinHan/LBOCTestSDK.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  #s.source_files = 'LBOCTestSDKCode/Classes/*'
  # s.resource_bundles = {
  #   'LBOCTestSDK' => ['LBOCTestSDKCode/Assets/*.png']
  # }
  
  #s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  
  s.subspec 'AppleLocationMap' do |applelocationmap|
  applelocationmap.source_files = 'LBOCTestSDKCode/AppleLocationMap/*'
  applelocationmap.frameworks = 'UIKit', 'CoreLocation','MapKit','Foundation'
  #  applelocationmap.dependency 'AFNetworking', '~> 3.0'
  #  applelocationmap.dependency 'YYModel
  end
  #可以设置多个数据源，可以是包含关系
  s.subspec 'BaiduLocationMap' do |baidulocationmap|
  baidulocationmap.source_files = 'LBOCTestSDKCode/BaiduLocationMap/*'
  #baidulocationmap.frameworks = 'UIKit'
  #baidulocationmap.dependency 'MBProgressHUD'
  baidulocationmap.dependency 'BaiduMapKit'
  baidulocationmap.dependency 'BMKLocationKit'
  #baidulocationmap.ios.vendored_library  = "libcrypto.a","libssl.a"
  
  #baidulocationmap.frameworks   = 'UIKit',"CoreLocation", "OpenGLES", "QuartzCore", "Security", "SystemConfiguration", "BaiduMapAPI_Base", "BaiduMapAPI_Cloud", "BaiduMapAPI_Location", "BaiduMapAPI_Map", "BaiduMapAPI_Radar", "BaiduMapAPI_Search", "BaiduMapAPI_Utils"
  #baidulocationmap.libraries    = "z", "sqlite3.0", "stdc++.6.0.9", "crypto", "ssl"
  
  baidulocationmap.frameworks   = "CoreLocation","OpenGLES", "QuartzCore", "Security", "SystemConfiguration",'UIKit', 'MapKit','Foundation',"CoreGraphics","AdSupport","CoreTelephony","MobileCoreServices"
  baidulocationmap.libraries    = "sqlite3.0", "c++", "crypto","ssl","z"
  
  baidulocationmap.pod_target_xcconfig = {
      'FRAMEWORK_SEARCH_PATHS'   => '$(inherited) $(PODS_ROOT)/BaiduMapKit/BaiduMapKit',
      'LIBRARY_SEARCH_PATHS'     => '$(inherited) $(PODS_ROOT)/BaiduMapKit/BaiduMapKit/thirdlibs',
      'OTHER_LDFLAGS'            => '$(inherited) -undefined dynamic_lookup -ObjC',
      'ENABLE_BITCODE'           => 'NO'
  }
  
  end
  s.subspec 'ALLLocationMap' do |alllocationmap|
  alllocationmap.source_files = 'LBOCTestSDKCode/AppleLocationMap/*','LBOCTestSDKCode/BaiduLocationMap/*'
  
  #alllocationmap.frameworks   = 'UIKit',"CoreLocation", "OpenGLES", "QuartzCore", "Security", "SystemConfiguration", "BaiduMapAPI_Base", "BaiduMapAPI_Cloud", "BaiduMapAPI_Location", "BaiduMapAPI_Map", "BaiduMapAPI_Radar", "BaiduMapAPI_Search", "BaiduMapAPI_Utils"
  #alllocationmap.libraries    = "z", "sqlite3.0", "stdc++.6.0.9", "crypto", "ssl"
  
  alllocationmap.dependency 'BaiduMapKit'
  alllocationmap.dependency 'BMKLocationKit'
  #alllocationmap.ios.vendored_library  = "libcrypto.a","libssl.a"
  #alllocationmap.public_header_files = 'LBOCTestSDKCode/BaiduLocationMap/BMKPrefixHeader.pch'
  alllocationmap.frameworks   = "CoreLocation","OpenGLES", "QuartzCore", "Security", "SystemConfiguration",'UIKit', 'MapKit','Foundation',"CoreGraphics","AdSupport","CoreTelephony","MobileCoreServices"
  alllocationmap.libraries    = "sqlite3.0", "c++", "crypto","ssl","z"
  
  alllocationmap.pod_target_xcconfig = {
      'FRAMEWORK_SEARCH_PATHS'   => '$(inherited) $(PODS_ROOT)/BaiduMapKit/BaiduMapKit',
      'LIBRARY_SEARCH_PATHS'     => '$(inherited) $(PODS_ROOT)/BaiduMapKit/BaiduMapKit/thirdlibs',
      'OTHER_LDFLAGS'            => '$(inherited) -undefined dynamic_lookup -ObjC',
      'ENABLE_BITCODE'           => 'NO'
  }

  end
  
  
end
