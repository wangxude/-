//
//  WXSTopicListDAL.h
//  WXSparkApp
//
//  Created by 王旭 on 2019/4/29.
//  Copyright © 2019 王旭. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WXSTopicListDAL : NSObject
//parameters[@"a"] = typeA;
//parameters[@"c"] = @"data";
//parameters[@"type"] = @(topicType);
//parameters[@"maxtime"] = isMore ? self.maxtime : nil;
//parameters[@"per"] = @10;

+ (void)queryTopicListFromDiskWithAreaType:(NSString *)areaType
                                topicType:(NSString *)topicType
                                maxTime:(NSString *)maxTime
                                per:(NSInteger)per
                                completion:(void(^)(NSMutableArray<NSMutableDictionary *> *dictArray))completion;

+ (void)cachesTopicList:(NSMutableArray<NSMutableDictionary *> *)topics areaType:(NSString *)areaType;

+ (void)clearOutTimeCaches;

@end

NS_ASSUME_NONNULL_END
