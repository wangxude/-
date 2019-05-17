//
//  NSString+WXSDownload.m
//  WXSparkApp
//
//  Created by 王旭 on 2019/5/14.
//  Copyright © 2019 王旭. All rights reserved.
//

#import "NSString+WXSDownload.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (WXSDownload)

- (NSString *)prependCaches {
      return [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:self];
}

- (NSString *)MD5 {
    //得到bytes
    const char *cstring = self.UTF8String;
    unsigned char bytes[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cstring, (CC_LONG)strlen(cstring), bytes);
    
    // 拼接
    NSMutableString *md5String = [NSMutableString string];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [md5String appendFormat:@"%02x", bytes[i]];
    }
    return md5String;
}

- (NSInteger)fileSize {
    NSFileManager *fileManger = [NSFileManager defaultManager];
    return [fileManger attributesOfItemAtPath:self error:nil].fileSize;
}

//- (NSString *)awemeMusicCacheDirectory {
//    NSFileManager *fileManager = [[NSFileManager alloc]init];
//    NSString *pathDocuments = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
//    NSString *directory = [NSString stringWithFormat:@"%@/AwemeMusicCache", pathDocuments];
//    if (![[NSFileManager defaultManager] fileExistsAtPath:directory]) {
//        [fileManager createDirectoryAtPath:directory withIntermediateDirectories:YES attributes:nil error:nil];
//    } else{
//        KSYLog(@"有AwemeMusicCache这个目录了");
//    }
//    return directory;
//}
//// 获得缓存文件的大小
//- (CGFloat)getMusicCacheSize {
//    NSFileManager *fileManger = [NSFileManager defaultManager];
//
//    CGFloat size = 0;
//    NSString *httpPath = [self awemeMusicCacheDirectory];
//    if ([fileManger fileExistsAtPath:httpPath]) {
//        //目录下的文件大小
//        NSArray *childFileArray = [fileManger subpathsAtPath:httpPath];
//        for (NSString *fileName in childFileArray) {
//            NSString *absolutePath = [httpPath stringByAppendingString:[NSString stringWithFormat:@"/%@",fileName]];
//            size += [fileManger attributesOfItemAtPath:absolutePath error:nil].fileSize;
//        }
//        //将大小转换为M
//        return size/1024/1024;
//    }
//    return 0;
//
//}
@end
