# LBOCTestSDK  这个库用于地图功能的开发

[![CI Status](https://img.shields.io/travis/314456527@qq.com/LBOCTestSDK.svg?style=flat)](https://travis-ci.org/314456527@qq.com/LBOCTestSDK)
[![Version](https://img.shields.io/cocoapods/v/LBOCTestSDK.svg?style=flat)](https://cocoapods.org/pods/LBOCTestSDK)
[![License](https://img.shields.io/cocoapods/l/LBOCTestSDK.svg?style=flat)](https://cocoapods.org/pods/LBOCTestSDK)
[![Platform](https://img.shields.io/cocoapods/p/LBOCTestSDK.svg?style=flat)](https://cocoapods.org/pods/LBOCTestSDK)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

实现功能，需要工程文件设置相应的权限，如有需要设置打开地图应用的白名单。

## Installation

LBOCTestSDK is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:
## 权限设置参考信息
NSLocationAlwaysUsageDescription我们的App需要通过您所在的地理位置获取地址信息
NSLocationWhenInUseUsageDescription我们的App需要通过您所在的地理位置获取地址信息

## 设置打开地图应用的白名单
‘<key>LSApplicationQueriesSchemes</key>
    <array>
        <string>iosamap</string>
        <string>baidumap</string>
    </array>’

```ruby
pod 'LBOCTestSDK'
```

## Author

314456527@qq.com, 314456527@qq.com

## License

LBOCTestSDK is available under the MIT license. See the LICENSE file for more info.








