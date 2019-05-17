//
//  NSString+WXSDownload.h
//  WXSparkApp
//
//  Created by 王旭 on 2019/5/14.
//  Copyright © 2019 王旭. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (WXSDownload)

/**
 在前面拼接caches文件夹

 @return 拼接的文件夹路径
 */
- (NSString *)prependCaches;

/**
 生成MD5摘要

 @return MD5字符串
 */
- (NSString *)MD5;

/**
 得到文件大小

 @return 文件的大小
 */
- (NSInteger)fileSize;

@end

NS_ASSUME_NONNULL_END
