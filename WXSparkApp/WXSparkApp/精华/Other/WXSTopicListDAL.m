//
//  WXSTopicListDAL.m
//  WXSparkApp
//
//  Created by 王旭 on 2019/4/29.
//  Copyright © 2019 王旭. All rights reserved.
//

#import "WXSTopicListDAL.h"
#import "WXSSQLiteManager.h"

static NSString *const _listTableName = @"t_topics";
static NSString *_newListTableName = @"new_t_topics";

static const NSTimeInterval _maxTime = -7 * 24 * 3600;

@implementation WXSTopicListDAL

+ (void)cachesTopicList:(NSMutableArray<NSMutableDictionary *> *)topics areaType:(NSString *)areaType {
    if (LMJIsEmpty(topics)) {
        return;
    }
    NSString *tableName = nil;
    if ([areaType isEqualToString:@"list"]) {
        tableName = _listTableName;
    }
    else if ([areaType isEqualToString:@"newlist"]) {
        tableName = _newListTableName;
    }
    NSString *sql = [NSString stringWithFormat:@"INSERT OR REPLACE INTO %@ (topic , type , t) VALUES (? , ? , ?)", tableName];
    [[WXSSQLiteManager sharedManger].dbQueue inTransaction:^(FMDatabase * _Nonnull db, BOOL * _Nonnull rollback) {
        [topics enumerateObjectsUsingBlock:^(NSMutableDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            @try {
                NSData *topicData = [NSJSONSerialization dataWithJSONObject:obj options:0 error:nil];
                if (![db executeQuery:sql withArgumentsInArray:@[topicData, obj[@"type"], obj[@"t"]]]) {
                    *stop = YES;
                    *rollback = YES;
                }
            } @catch (NSException *exception) {
                NSLog(@"存储错误 :%@", exception);
            } @finally {
                
            }
            NSLog(@"向数据库新增%d条数据", db.changes);
        }];
    }];
}

+ (void)clearOutTimeCaches {
    NSDate *earlyTime = [NSDate dateWithTimeIntervalSinceNow:_maxTime];
    NSString *earlyTimeStr = [earlyTime stringWithFormat:@"yyyy-MM-dd HH:mm:ss" timeZone:nil locale:[NSLocale localeWithLocaleIdentifier:@"en_US"]];
    NSString *sql = [NSString stringWithFormat:@"DELETE FROM %@ WHERE time < '%@'",_listTableName, earlyTimeStr];
    [[WXSSQLiteManager sharedManger].dbQueue inTransaction:^(FMDatabase * _Nonnull db, BOOL * _Nonnull rollback) {
        BOOL isSucceed = [db executeQuery:sql withArgumentsInArray:@[]];
        if (isSucceed) {
            NSLog(@"%d 删除数据成功", db.changes);
            *rollback = NO;
        }
        else {
            *rollback = YES;
        }
    }];
    
    NSString *newSql = [NSString stringWithFormat:@"DELETE FROM %@ WHERE time < '%@'",_newListTableName, earlyTimeStr];
    [[WXSSQLiteManager sharedManger].dbQueue inTransaction:^(FMDatabase * _Nonnull db, BOOL * _Nonnull rollback) {
        BOOL isSucceed = [db executeQuery:newSql withArgumentsInArray:@[]];
        if (isSucceed) {
            NSLog(@"%d 删除数据成功", db.changes);
            *rollback = NO;
        }
        else {
            *rollback = YES;
        }
    }];
}

+ (void)queryTopicListFromDiskWithAreaType:(NSString *)areaType topicType:(NSString *)topicType maxTime:(NSString *)maxTime per:(NSInteger)per completion:(void (^)(NSMutableArray<NSMutableDictionary *> * _Nonnull))completion {
    NSString *tableName = nil;
    if ([areaType isEqualToString:@"list"]) {
        tableName = _listTableName;
    }
    else if ([areaType isEqualToString:@"newlist"]){
        tableName = _newListTableName;
    }
    
    NSString *sql = nil;
    NSString *count = [NSString stringWithFormat:@"%zd", per];
    if (!maxTime) {
        if ([topicType isEqualToString:@"1"]) {
            sql = [NSString stringWithFormat:@"SELECT * FROM %@ ORDER BY t DESC LIMIT %@", tableName,count];
        }
        else {
            sql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE type = %@ ORDER BY t DESC LIMIT %@",tableName, topicType, count];
        }
    }else if (maxTime){
        if ([topicType isEqualToString:@"1"]) {
            sql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE t < %@ ORDER BY t DESC LIMIT %@", tableName, maxTime, count];
        }else
        {
            sql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE type = %@ AND t < %@ ORDER BY t DESC LIMIT %@", tableName, topicType, maxTime, count];
        }
    }
    
    [[WXSSQLiteManager sharedManger] queryArrayOfDicts:sql completion:^(NSMutableArray<NSMutableDictionary *> * _Nonnull dictArrayM) {
        NSMutableArray<NSMutableDictionary *> *dictArrayM_new = [NSMutableArray array];
        [dictArrayM enumerateObjectsUsingBlock:^(NSMutableDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSData *topicData = obj[@"topic"];
            @try {
                NSDictionary *topicDict = [NSJSONSerialization JSONObjectWithData:topicData options:NSJSONReadingMutableContainers error:nil];;
                [dictArrayM_new addObject:[NSMutableDictionary dictionaryWithDictionary:topicDict]];
            } @catch (NSException *exception) {
                
            } @finally {
                
            }
        }];
         completion(dictArrayM_new);
    }];
    /*
     NSString *creatTableSql = @"CREATE TABLE IF NOT EXISTS t_topics \n\
     (id INTEGER PRIMARY KEY AUTOINCREMENT, \n\
     topic BLOB NOT NULL, \n\
     topicType
     type TEXT NOT NULL, \n\
     topicTimeID
     t INTEGER NOT NULL, \n\
     time TEXT NOT NULL  DEFAULT (datetime('now', 'localtime'))\n\
     )\n";
     */
    
    //    parameters[@"a"] = typeA;
    //    parameters[@"c"] = @"data";
    //    parameters[@"type"] = @(topicType);
    //    parameters[@"maxtime"] = isMore ? self.maxtime : nil;
    //    parameters[@"per"] = @10;
    
    
}
@end
