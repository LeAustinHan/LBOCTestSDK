//
//  LBOCHanppyMapViewController.h
//  LBOCFirstDemo
//
//  Created by Han Jize on 2019/12/3.
//  Copyright © 2019 LBOC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "LBOCHappyMapAnnotation.h"

NS_ASSUME_NONNULL_BEGIN



@interface LBOCHanppyMapViewController : UIViewController<MKMapViewDelegate>

/**

初始点到目标点导航划线，导航到目标位置

*/
- (void)guideCurrentMapAnnotation:(LBOCHappyMapAnnotation *)currentMapAnnotation toTargetLocationInfo:(LBOCHappyMapAnnotation *)targetMapAnnotation;

@end

NS_ASSUME_NONNULL_END
