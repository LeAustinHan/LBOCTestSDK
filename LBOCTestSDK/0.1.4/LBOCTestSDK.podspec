#
# Be sure to run `pod lib lint LBOCTestSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LBOCTestSDK'
  s.version          = '0.1.4'
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

  s.source_files = 'LBOCTestSDKCode/Classes/*'
  
  # s.resource_bundles = {
  #   'LBOCTestSDK' => ['LBOCTestSDKCode/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'CoreLocation','MapKit'
  #s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
