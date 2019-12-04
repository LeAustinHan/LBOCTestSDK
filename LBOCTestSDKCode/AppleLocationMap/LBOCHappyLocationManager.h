//
//  LBOCHappyLocationManager.h
//  LBOCFirstDemo
//
//  Created by Han Jize on 2019/12/2.
//  Copyright © 2019 LBOC. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CoreLocation/CoreLocation.h>//引入Corelocation框架

NS_ASSUME_NONNULL_BEGIN

typedef  void (^LBOCHappyLocationResultBlock )(BOOL success);

@interface LBOCHappyLocationManager : NSObject<CLLocationManagerDelegate>

 /**
 
 获取单例
 
 @return GPS定位控制器单例
 
 */
 
 + (instancetype)sharedInstance;

 /**
 
 *  注册GPS定位结果回调block
 
 *
 
 *  @param block GPS定位结果回调block
 
 */

 - (void)registerGPSLocationResultBlock:(LBOCHappyLocationResultBlock)block;
 
 /**
 
 获取定位服务是否可用
 
 @return 定位服务是否可用
 */
 
 + (BOOL)locationServicesEnabled;
 
 /**
 
 启动定位，定位成功后会缓存最新的定位位置
 
 @return 启动定位成功返回YES，否则返回NO
 
*/
 
 - (BOOL)startLocation;

/**
 获取定位位置，如果GPS定位操作还没有成功执行，则会尝试获取上一次启动GPS定位的位置
 
 @return 定位位置或者nil
 
 */
 
- (CLLocation*)getLocation;
 
 /**
 
 获取定位城市，如果GPS定位操作还没有成功执行，则会尝试获取上一次启动GPS定位的城市，如果没有获取到则默认返回“广州市”
 
 @return 定位城市
 
 */

- (NSString*)getLocationAddressInfo;

@end

NS_ASSUME_NONNULL_END
