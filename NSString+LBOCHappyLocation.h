//
//  NSString+LBOCHappyLocation.h
//  LBOCTestSDK
//
//  Created by Han Jize on 2019/12/2.
//

#import <UIKit/UIKit.h>

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (LBOCHappyLocation)

+ (NSString *)happySafeString:(NSString *)string;

+ (BOOL)happyIsBlankString:(NSString *)string;

@end

NS_ASSUME_NONNULL_END
