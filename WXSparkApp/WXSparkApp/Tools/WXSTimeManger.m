//
//  WXSTimeManger.m
//  WXSparkApp
//
//  Created by 王旭 on 2019/4/26.
//  Copyright © 2019 王旭. All rights reserved.
//

#import "WXSTimeManger.h"

@implementation WXSTimeManger

/**获取当前时间**/
+ (NSString *)getCurrentDateStr {
    NSDate *currentDate = [NSDate date];//获取当前时间
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];//创建一个时间格式化对象
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateString = [dateFormatter stringFromDate:currentDate];//时间格式化对象把日期变成了字符串
    return dateString;
}

/**获取当前时间戳**/
+ (NSString *)getCurrentTimeStr {
    NSDate *date = [NSDate date];
    NSTimeInterval time = [date timeIntervalSince1970]*1000; //*1000 是精确到毫秒，不乘就是精确到秒
    NSString *timeString = [NSString stringWithFormat:@"%.f",time];
    return timeString;
}

//+ (NSString *)getDateStringWithTimeStr:(NSString *)str {
//    NSTimeInterval time = [str doubleValue]/1000; //因为精确到了毫秒
//    NSDate *detailDate = [NSDate dateWithTimeIntervalSince1970:time];
//    NSDateFormatter *detailFormatter = [[NSDateFormatter alloc] init];
//    //设置时间格式
//    [detailFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//    NSString *currentDateStr = [detailFormatter stringFromDate:detailDate];
//    return currentDateStr;
//}
//
//+ (NSString *)getTimeStrWithString:(NSString *)str {
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//    NSDate *tempDate = [dateFormatter dateFromString:str];
//    //字符串转成时间戳,精确到毫秒*1000
//    NSString *timeStr = [NSString stringWithFormat:@"%f",[tempDate timeIntervalSince1970]*1000];
//    return timeStr;
//}

@end
