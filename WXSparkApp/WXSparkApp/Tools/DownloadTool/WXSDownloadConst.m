//
//  WXSDownloadConst.m
//  WXSparkApp
//
//  Created by 王旭 on 2019/5/14.
//  Copyright © 2019 王旭. All rights reserved.
//

#import "WXSDownloadConst.h"

/**** 通知 Begin ****/
/** 下载进度发生改变的通知 */
NSString * const WXSDownloadProgressDidChangeNotification =
    @"DownloadProgressDidChangeNotification";
/** 下载状态发生改变的通知 */
NSString * const WXSDownloadStateDidChangeNotification =
    @"DownloadStateDidChangeNotification";
/** 利用这个key从通知中取出对应的DownloadInfo对象 */
NSString * const WXSDownloadInfoKey = @"DownloadInfoKey";
/**** 通知 End ****/
