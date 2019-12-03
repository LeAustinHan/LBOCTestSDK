//
//  LBOCMapAnnotation.h
//  LBOCFirstDemo
//
//  Created by Han Jize on 2019/12/3.
//  Copyright © 2019 LBOC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
//大头针标注模型,须遵循MKAnnotation协议

NS_ASSUME_NONNULL_BEGIN

@interface LBOCHappyMapAnnotation : NSObject<MKAnnotation>
//遵循协议后,必须实现的三个属性
@property (nonatomic, assign) CLLocationCoordinate2D coordinate; /** 经纬度，用assig*/
@property (nonatomic, copy) NSString* title;/** 主标题r */
@property (nonatomic, copy) NSString *subtitle;/** 副标题*/

@end

NS_ASSUME_NONNULL_END
