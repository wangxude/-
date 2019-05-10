//
//  WXSNewPostViewController.m
//  WXSparkApp
//
//  Created by 王旭 on 2019/4/22.
//  Copyright © 2019 王旭. All rights reserved.
//

#import "WXSNewPostViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "WXSVideoViewController.h"
#import "WXSNewspaperViewController.h"
#import "WXSTimeManger.h"
#import "WXSHTTPTool.h"
#import <SSZipArchive.h>
#import <CommonCrypto/CommonDigest.h>


@interface WXSNewPostViewController ()

@end

@implementation WXSNewPostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NSArray *array = @[@"视频播放",@"新闻接口"];
    for (int i = 0; i < 2; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(100, 100+100*i, 100, 40);
        [button setTitle:[array objectAtIndex:i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 100 +i;
        [self.view addSubview:button];
    }

    //获取时间戳
    NSLog(@"%@",[WXSTimeManger getCurrentTimeStr]);
    //获取当前时间
    NSLog(@"%@",[WXSTimeManger getCurrentDateStr]);

    NSString *string = [NSString stringWithFormat:@"%@",@"http://estore.kouyu100.com/wavMetaLog/898.zip"];
//    [[WXSHTTPTool alloc] POST:string parameters:nil success:^(id  _Nullable responseObject) {
//        NSLog(@"%@",responseObject);
//    } failure:^(NSError * _Nullable error) {
//        NSLog(@"%@",error);
//    }];
    [self downloadZip];
    
    // Do any additional setup after loading the view.
}

- (void)downloadZip
{
    NSString *zipUrl     = @"http://estore.kouyu100.com/wavMetaLog/898.zip";
    NSURL    *url        = [NSURL URLWithString:zipUrl];
    NSString *md5        = [self md5:zipUrl];//将下载链接转为md5 后面当做文件夹的名字
    NSArray  *pathes     = NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES);
    NSString *path       = [pathes objectAtIndex:0];//大文件放在沙盒下的Library/Caches
    NSString *finishPath = [NSString stringWithFormat:@"%@/zipDownload/%@",path,md5];//保存解压后文件的文件夹的路径
    NSString *zipPath    = [NSString stringWithFormat:@"%@/%@.zip",path,md5];//下载的zip包存放路径
    BOOL isExist = [[NSFileManager defaultManager] fileExistsAtPath:finishPath];
    if (!isExist)
    {//本地不存在文件 下载
        dispatch_queue_t queue =dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0);
        dispatch_async(queue, ^{
            NSError *error = nil;
            NSData *data = [NSData dataWithContentsOfURL:url options:0 error:&error];
            if(!error)
            
            {
                [data writeToFile:zipPath options:0 error:nil];
                if ([SSZipArchive unzipFileAtPath:zipPath toDestination:finishPath]) {
                BOOL ret = [SSZipArchive unzipFileAtPath:zipPath toDestination:finishPath progressHandler:^(NSString * _Nonnull entry, unz_file_info zipInfo, long entryNumber, long total) {
                        
                    } completionHandler:^(NSString * _Nonnull path, BOOL succeeded, NSError * _Nullable error) {
                        if (succeeded) {
                            NSLog(@"解压成功");
                        }else {
                            NSLog(@"%@",error);
                        }
                    }];
                }
                NSFileManager *fileManager = [NSFileManager defaultManager];
                [fileManager removeItemAtPath:zipPath error:nil];
                //解压zip文件
               // ZipArchive *zip= [[ZipArchive alloc]init];
                //if([zip UnzipOpenFile:zipPath])
//                {//将解压缩的内容写到缓存目录中UnzipFileTo:finishPath overWrite:YES
//                    BOOL ret = [zip UnzipFileTo:finishPath fileType:@"zip" overWrite:YES];
//                    if(!ret)
//                    {
//                        [zip UnzipCloseFile];
//                        NSLog(@"没有错误");
//                    }
//                    //解压完成 删除压缩包
//                    NSFileManager *fileManager = [NSFileManager defaultManager];
//                    [fileManager removeItemAtPath:zipPath error:nil];
//                }
            }
        });
    }
}

- (NSString *)md5:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr,(CC_LONG)strlen(cStr), digest);
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    return  output;
}

- (void)buttonAction:(UIButton *)sender {
    if (sender.tag == 100) {
        WXSVideoViewController *videoVC = [[WXSVideoViewController alloc] init];
        videoVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:videoVC animated:YES];
    }
    else {
        WXSNewspaperViewController *postVC = [[WXSNewspaperViewController alloc] init];
        postVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:postVC animated:YES];
    }
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
