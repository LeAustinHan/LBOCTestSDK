//
//  NSDate+Ext.h
//  LBOC_Student
//
//  Created by anseenly on 16/9/24.
//  Copyright © 2016年 DongFangYouBo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Ext)


/**
 返回当前时间

 @return 时间
 */
+(NSString *)now;

/**
 转换时间到字符串，按照默认格式

 @return 时间
 */
-(NSString *)string;


/**
 转换时间到字符串，按照自定义格式

 @param format 格式

 @return 时间
 */
-(NSString *)string:(NSString *)format;


/**
 返回时间戳

 @return 时间戳
 */
+(NSString *)timeIntervalSince1970;


/**
 创建时间

 @param string 时间
 @param format 格式
 @return 时间对象
 */
+(NSDate *)dateWithString:(NSString *)string format:(NSString *)format;

-(NSString *)stringWithFormat:(NSString *)format;

-(NSDate *)firstDayOfLastMonth;

-(NSDate *)firstDayOfCurrentMonth;

@end
