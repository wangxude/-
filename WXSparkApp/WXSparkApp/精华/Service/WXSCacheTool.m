//
//  WXSCacheTool.m
//  WXSparkApp
//
//  Created by 王旭 on 2019/5/15.
//  Copyright © 2019 王旭. All rights reserved.
//

#import "WXSCacheTool.h"

static NSString * const CachesToolId = @"CachesToolId";

@interface WXSCacheTool ()
{
    NSMutableArray<NSString *> *_cachesUrls;
}

@property (nonatomic ,strong) NSString * filePath;

@end

@implementation WXSCacheTool

static WXSCacheTool *_instance = nil;

- (void)downLoad:(NSString *)url {
    [_cachesUrls addObject:url.copy];
    [self.downloadManger download:url];
    [_cachesUrls writeToFile:self.filePath atomically:YES];
}

- (void)deleteFile:(NSString *)url {
//    __weak typeof(self) weakSelf = self;
    [_cachesUrls enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isEqualToString:url]) {
            [_cachesUrls removeObject:obj];
        }
    }];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        
         _cachesUrls = [NSMutableArray arrayWithContentsOfFile:self.filePath];
        
        if (!_cachesUrls) {
            [[NSFileManager defaultManager] createDirectoryAtPath:[self.filePath stringByDeletingLastPathComponent] withIntermediateDirectories:YES attributes:nil error:nil];
            _cachesUrls = [NSMutableArray array];
            //写入文件
            [_cachesUrls writeToFile:self.filePath atomically:YES];
        }
        [_cachesUrls enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [self.downloadManger downloadInfoForURL:obj];
        }];
    }
    return self;
}

- (NSString *)filePath {
    NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"videoDownload/downloadData.plist"];
    return filePath;
}

+ (instancetype)sharedTool {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}
- (WXSDownloadManger *)downloadManger {
    if (!_downloadManger) {
        _downloadManger = [WXSDownloadManger managerWithIdentifier:CachesToolId];
    }
    return _downloadManger;
}
@end
