//
//  WXSDownloadConst.h
//  WXSparkApp
//
//  Created by 王旭 on 2019/5/14.
//  Copyright © 2019 王旭. All rights reserved.
//

#import <Foundation/Foundation.h>

/*******通知 Begin *******/
/** 下载进度发生改变的通知 **/
extern NSString * const WXSDownloadProgressDidChangeNotification;
/** 下载状态发生改变的通知 **/
extern NSString * const WXSDownloadStateDidChangeNotification;
/** 利用这个key从通知中取出对应的 DownloadInfo对象**/
extern NSString * const WXSDownloadInfoKey;

#define WXSDownloadNofificationCenter  [NSNotificationCenter defaultCenter]
/**  通知 End **/


