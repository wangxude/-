//
//  WXSCacheTool.h
//  WXSparkApp
//
//  Created by 王旭 on 2019/5/15.
//  Copyright © 2019 王旭. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WXSDownload.h"

NS_ASSUME_NONNULL_BEGIN

@interface WXSCacheTool : NSObject

+ (instancetype)sharedTool;

@property (nonatomic ,strong) WXSDownloadManger *downloadManger;

//缓存url
- (void)downLoad:(NSString *)url;
//缓存url
- (void)deleteFile:(NSString *)url;

@end

NS_ASSUME_NONNULL_END
