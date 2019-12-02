//
//  NSString+LBOCHappyLocation.m
//  LBOCTestSDK
//
//  Created by Han Jize on 2019/12/2.
//

#import "NSString+LBOCHappyLocation.h"

#import "NSObject+LBOCHappyLocation.h"

@implementation NSString (LBOCHappyLocation)

+ (NSString *)happySafeString:(NSString *)string{
    if ([string isKindOfClass:[NSNumber class]]) {
        NSNumber *numS = (NSNumber *)string;
        return [numS stringValue];
    }else if ([NSObject happyEmpty:string] ||
              [string isEqualToString:@"null"] ||
              [string isEqualToString:@"<null>"] ||
              [string isEqualToString:@"(null)"]) {
        return @"";
    }
    return [NSString stringWithFormat:@"%@",string];
}

+ (BOOL)happyIsBlankString:(NSString *)string {
    BOOL result = NO;
    if (NULL == string ||
        [string isEqual:nil] ||
        [string isEqual:Nil]){
        result = YES;
        
    }else if ([string isEqual:[NSNull null]]){
        result = YES;
    }else if (0 == [string length] ||
              0 == [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]){
        result = YES;
    }else if([string isEqualToString:@"(null)"] ||
             [string isEqualToString:@"null"] ||
             [string isEqualToString:@"<null>"]){
        result = YES;
    }
    return result;
}

@end
