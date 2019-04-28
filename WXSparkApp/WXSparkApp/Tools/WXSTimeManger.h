//
//  WXSTimeManger.h
//  WXSparkApp
//
//  Created by 王旭 on 2019/4/26.
//  Copyright © 2019 王旭. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WXSTimeManger : NSObject

@property (nonatomic, copy) NSString *timeString;


/**获取当前时间**/
+ (NSString *)getCurrentDateStr;

/**获取当前时间戳**/
+ (NSString *)getCurrentTimeStr;

///**时间戳转时间**/
//+ (NSString *)getDateStringWithTimeStr:(NSString *)str;
//
///**字符串转时间戳**/
//+ (NSString *)getTimeStrWithString:(NSString *)str;

@end

NS_ASSUME_NONNULL_END
