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

    // Do any additional setup after loading the view.
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
