//
//  WXSTopicViewController.m
//  WXSparkApp
//
//  Created by 王旭 on 2019/4/23.
//  Copyright © 2019 王旭. All rights reserved.
//

#import "WXSTopicViewController.h"
#import <ZJScrollPageView/ZJScrollPageView.h>
#import "WXSTopService.h"

@interface WXSTopicViewController ()<ZJScrollPageViewChildVcDelegate>

@property (nonatomic ,strong) WXSTopService *topicService;

@end

@implementation WXSTopicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIEdgeInsets edgeInsets = self.tableView.contentInset;
    edgeInsets.bottom += self.tabBarController.tabBar.lmj_height;
    self.tableView.contentInset = edgeInsets;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    // Do any additional setup after loading the view.
}
#pragma mark - ZJScrollPageViewChildVcDelegate

- (void)zj_viewWillAppearForIndex:(NSInteger)index {
    [self viewDidAppear:YES];
}

- (void)zj_viewDidAppearForIndex:(NSInteger)index {
    [self viewDidAppear:YES];
    //bug fix
    self.view.height = self.view.superview.height;
}
- (void)zj_viewWillDisappearForIndex:(NSInteger)index {
    [self viewWillDisappear:YES];
}
- (void)zj_viewDidDisappearForIndex:(NSInteger)index {
    [self viewDidDisappear:YES];
}

#pragma mark - getter
- (WXSTopService *)topicService {
    if (_topicService == nil) {
        _topicService = [[WXSTopService alloc] init];
    }
    return _topicService;
}

- (void)loadMore:(BOOL)isMore {
    LMJWeak(self);
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
