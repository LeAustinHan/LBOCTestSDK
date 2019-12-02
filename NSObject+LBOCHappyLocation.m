//
//  NSObject+LBOCHappyLocation.m
//  LBOCTestSDK
//
//  Created by Han Jize on 2019/12/2.
//

#import "NSObject+LBOCHappyLocation.h"

#import "NSString+LBOCHappyLocation.h"

@implementation NSObject (LBOCHappyLocation)

+ (BOOL)happyEmpty:(NSObject *)object {
    if (object == nil) {
        return YES;
    }
    if (object == NULL) {
        return YES;
    }
    if (object == [NSNull new]) {
        return YES;
    }
    if ([object isKindOfClass:[NSString class]]) {
        return [NSString happyIsBlankString:(NSString *)object];
    }
    if ([object isKindOfClass:[NSData class]]) {
        return [((NSData *)object) length] <= 0;
    }
    if ([object isKindOfClass:[NSDictionary class]]) {
        return [((NSDictionary *)object) count] <= 0;
    }
    if ([object isKindOfClass:[NSArray class]]) {
        return [((NSArray *)object) count] <= 0;
    }
    if ([object isKindOfClass:[NSSet class]]) {
        return [((NSSet *)object) count] <= 0;
    }
    return NO;
}

@end
