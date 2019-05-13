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
#import "LMJEasyBlankPageView.h"
#import "WXSTopicTableViewCell.h"

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
    
//    self.tableView.estimatedRowHeight = 0;
//    self.tableView.estimatedSectionHeaderHeight = 0;
//    self.tableView.estimatedSectionFooterHeight = 0;
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
    [self.topicService getTopicIsMore:isMore typeA:self.areaType topicType:self.topicType completion:^(NSError * _Nonnull error, NSInteger totalCount, NSInteger currentCount) {
        [weakself endHeaderFooterRefreshing];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wint-conversion"
        [weakself.tableView configBlankPage:LMJEasyBlankPageViewTypeNoData hasData:currentCount hasError:error reloadButtonBlock:^(id sender) {
            [weakself.tableView.mj_header beginRefreshing];
        }];
#pragma clang diagnostic pop
        if (error) {
            [weakself.view makeToast:error.localizedDescription duration:3 position:CSToastPositionCenter];
            return ;
        }
        
        self.tableView.mj_footer.state = (currentCount >= totalCount) ? MJRefreshStateNoMoreData : MJRefreshStateIdle;
        
        [self.tableView reloadData];
    }];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.topicService.topicViewModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WXSTopicTableViewCell *topicCell = [WXSTopicTableViewCell topicCellWithTableView:tableView];
    topicCell.topicViewModel = self.topicService.topicViewModels[indexPath.row];
    return topicCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.topicService.topicViewModels[indexPath.row].cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
//    BSJCommentPageViewController *cmtVc = [[BSJCommentPageViewController alloc] init];
//    cmtVc.topicViewModel = self.topicService.topicViewModels[indexPath.row];
//    [self.navigationController pushViewController:cmtVc animated:YES];
}

//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
//    return 5;
//}
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return self.topicService.topicViewModels.count;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//
//}
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
