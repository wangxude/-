//
//  WXSSQLiteManager.m
//  WXSparkApp
//
//  Created by 王旭 on 2019/4/29.
//  Copyright © 2019 王旭. All rights reserved.
//

#import "WXSSQLiteManager.h"

static NSString *const _dbName = @"bsj_t_topics.sqlite";
static NSString *const _listTableName = @"t_topics";
static NSString *const _newListTableName = @"new_t_topics";

static NSString *_dbPath = nil;

@implementation WXSSQLiteManager

+ (void)load {
    _dbPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:_dbName];
    NSLog(@"%@",_dbPath);
}

- (void)queryArrayOfDicts:(NSString *)sql completion:(void (^)(NSMutableArray<NSMutableDictionary *> * _Nonnull))completion {
    NSMutableArray<NSMutableDictionary *> *dictArrayM = [NSMutableArray array];
    [self.dbQueue inDatabase:^(FMDatabase * _Nonnull db) {
        FMResultSet *resultSet = [db executeQuery:sql withArgumentsInArray:@[]];
        while (resultSet.next) {
            NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
            for (int i = 0; i < resultSet.columnCount; i++) {
                NSString *colName = [resultSet columnNameForIndex:i];
                NSString *colValue = [resultSet objectForColumn:colName];
                dictM[colName] = colValue;
            }
            [dictArrayM addObject:dictM];
        }
        completion(dictArrayM);
    }];
}

- (void)createTable {
    //    id INTEGER PRIMARY KEY AUTOINCREMENT,  BLOB二进制文件
    NSString *createTableSql = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ \n\
                                (\n\
                                t INTEGER PRIMARY KEY NOT NULL ,\n\
                                topic BLOB NOT NULL, \n\
                                type TEXT NOT NULL, \n\
                                time TEXT NOT NULL DEFAULT (datetime('now', 'localtime'))\n\
                                )\n",_listTableName];
    
    [self.dbQueue inDatabase:^(FMDatabase * _Nonnull db) {
        BOOL result = [db executeUpdate:createTableSql];
        if (result) {
            NSLog(@"创建表格成功");
        }
        else {
            NSLog(@"创建表失败");
        }
    }];
    
    NSString *createNewTopicTableSql = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ \n\
                                        (\n\
                                        t INTEGER PRIMARY KEY NOT NULL, \n\
                                        topic BLOB NOT NULL, \n\
                                        type TEXT NOT NULL, \n\
                                        time TEXT NOT NULL DEFAULT (datetime('now', 'localtime'))\n\
                                        )\n",_newListTableName];
    [self.dbQueue inDatabase:^(FMDatabase * _Nonnull db) {
        BOOL result = [db executeUpdate:createNewTopicTableSql];
        if (result) {
            NSLog(@"创建表格成功");
        }else {
            NSLog(@"创建表格失败");
        }
    }];
}

- (FMDatabaseQueue *)dbQueue {
    if (_dbQueue == nil) {
        _dbQueue = [FMDatabaseQueue databaseQueueWithPath:_dbPath];
    }
    return _dbQueue;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self createTable];
    }
    return self;
}

static WXSSQLiteManager *_instance = nil;
+ (instancetype)sharedManger {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!_instance) {
            _instance = [[self alloc] init];
        }
    });
    return _instance;
}

@end
