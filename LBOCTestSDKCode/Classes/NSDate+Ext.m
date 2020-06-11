//
//  NSDate+Ext.m
//  LBOC_Student
//
//  Created by anseenly on 16/9/24.
//  Copyright © 2016年 DongFangYouBo. All rights reserved.
//

#import "NSDate+Ext.h"

@implementation NSDate (Ext)

+(NSString *)now{
    return [[NSDate date] string];
}

-(NSString *)string{
    return [self string:@"yyyy.MM.dd HH:mm:ss"];
}

-(NSString *)string:(NSString *)format{
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:format];
    NSString *time=[formatter stringFromDate:self];
    return time;
}

+(NSDate *)dateWithString:(NSString *)string format:(NSString *)format{
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:format];
    return [formatter dateFromString:string];
}

+(NSString *)timeIntervalSince1970{
    return  [@(round([NSDate date].timeIntervalSince1970*1000)) stringValue];
}


-(NSString *)stringWithFormat:(NSString *)format{
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:format];
    NSString *time=[formatter stringFromDate:self];
    return time;
}

-(NSDate *)firstDayOfLastMonth{
    NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:self];
    
    NSInteger year=[components year];
    NSInteger month=[components month];
    month --;
    if (month == 0) {
        month = 12;
        year--;
    }
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setYear:year];
    [dateComponents setMonth:month];
    [dateComponents setDay:1];
    
    NSDate *resultDate = [calendar dateFromComponents:dateComponents];
    
    return resultDate;
}

-(NSDate *)firstDayOfCurrentMonth{
    NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:self];
    
    NSInteger year=[components year];
    NSInteger month=[components month];
    
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setYear:year];
    [dateComponents setMonth:month];
    [dateComponents setDay:1];
    
    NSDate *resultDate = [calendar dateFromComponents:dateComponents];
    
    return resultDate;
}



@end
