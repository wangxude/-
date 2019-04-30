//
//  WXSSQLiteManager.h
//  WXSparkApp
//
//  Created by 王旭 on 2019/4/29.
//  Copyright © 2019 王旭. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FMDB.h>

NS_ASSUME_NONNULL_BEGIN

@interface WXSSQLiteManager : NSObject

@property (nonatomic ,strong) FMDatabaseQueue *dbQueue;

+ (instancetype)sharedManger;

/**
 查询

 @param sql 数据库地址
 @param completion 回调
 */
- (void)queryArrayOfDicts:(NSString *)sql completion:(void(^)(NSMutableArray<NSMutableDictionary *>*dictArrayM))completion;

@end

NS_ASSUME_NONNULL_END
