//
//  LBOCHappyLocationMode.h
//  LBOCTestSDK
//
//  Created by Han Jize on 2019/12/2.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LBOCHappyLocationMode : NSObject

@property (nonatomic,strong) CLLocation *location; /** 位置信息经纬度 */

@property (nonatomic,copy) NSString *addressInfo; /** 位置信息，汉字，市、区、街道 */

@end

NS_ASSUME_NONNULL_END
