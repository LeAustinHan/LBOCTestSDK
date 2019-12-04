//
//  LBOCHappyLocationManager.m
//  LBOCFirstDemo
//
//  Created by Han Jize on 2019/12/2.
//  Copyright © 2019 LBOC. All rights reserved.
//

#import "LBOCHappyLocationManager.h"

#import "NSString+LBOCHappyLocation.h"

static LBOCHappyLocationManager *_singleInstance = nil;

@interface LBOCHappyLocationManager ()

@property (nonatomic,strong) CLLocationManager *locationManager;/** 设置manager */

@property (nonatomic,copy) LBOCHappyLocationResultBlock resultBlock;/** 属性block */

@property (nonatomic,strong) CLLocation * currentLocation;/** 当前位置 */

@property (nonatomic,strong) NSString *currentLocationInfo; /** 当前位置名称，市、区、街道 */

@property (nonatomic,strong) CLLocation * targetLocation;/** 目标位置 */

@end



@implementation LBOCHappyLocationManager

+ (instancetype)sharedInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_singleInstance == nil) {
            _singleInstance = [[self alloc] init];
        }
    });
    return _singleInstance;
}

/** 注册，设置block，实现失败和成功的结果回调 */
- (void)registerGPSLocationResultBlock:(LBOCHappyLocationResultBlock)block{
    self.resultBlock = block;
}

+ (BOOL)locationServicesEnabled{
    return [CLLocationManager locationServicesEnabled];
}

- (BOOL)startLocation {
    if ([LBOCHappyLocationManager locationServicesEnabled]) {//监测权限设置
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;//设置代理
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;//设置精度
        self.locationManager.distanceFilter = 1000.0f;//距离过滤
        [self.locationManager requestAlwaysAuthorization];//位置权限申请
        [self.locationManager startUpdatingLocation];//开始定位
        [self.locationManager startUpdatingHeading];
        return YES;
    }else {
        return NO;
    }
}

- (CLLocation*)getLocation{
    return self.currentLocation;
}

- (NSString*)getLocationAddressInfo{
    return self.currentLocationInfo;
}

#pragma mark —————location代理—————
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    if (self.resultBlock) {
         self.resultBlock(NO);//获取权限错误，传给实现部分，可以在这里做相应的交互@"permissionError"
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    [self.locationManager stopUpdatingLocation];//停止定位
//地理反编码
//    CLLocation *targetLocation = [[CLLocation alloc] initWithLatitude:39.996 longitude:116.439];//注意，先是纬度，后面是京都
//    self.targetLocation = targetLocation;
    
    CLLocation *currentLocation = [locations lastObject];//坐标信息
    self.currentLocation = currentLocation;

    CLGeocoder *geoCoder = [[CLGeocoder alloc]init];
//当系统设置为其他语言时，可利用此方法获得中文地理名称
    NSMutableArray *userDefaultLanguages = [[NSUserDefaults standardUserDefaults]objectForKey:@"AppleLanguages"];
    // 强制 成 简体中文
    [[NSUserDefaults standardUserDefaults] setObject:[NSArray arrayWithObjects:@"zh-hans", nil]forKey:@"AppleLanguages"];
    [geoCoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (placemarks.count > 0) {
            CLPlacemark *placeMark = placemarks[0];
        /** 定位的市、区、街道 */
            NSString *detailAdressString = [NSString stringWithFormat:@"%@%@%@",[NSString happySafeString: placeMark.locality],[NSString happySafeString:placeMark.subLocality],[NSString happySafeString:placeMark.thoroughfare]];
            self.currentLocationInfo = detailAdressString;
        }
        
        // 还原Device 的语言
        [[NSUserDefaults
          standardUserDefaults] setObject:userDefaultLanguages
         forKey:@"AppleLanguages"];
        if (self.resultBlock) {
             self.resultBlock(YES);//得到定位结果
        }
    }];
}



@end
