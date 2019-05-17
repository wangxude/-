//
//  WXSEssenceViewController.m
//  WXSparkApp
//
//  Created by 王旭 on 2019/4/22.
//  Copyright © 2019 王旭. All rights reserved.
//

#import "WXSEssenceViewController.h"
#import <ZJScrollPageView/ZJScrollPageView.h>
#import "WXSTopicViewController.h"

@interface WXSEssenceViewController ()<ZJScrollPageViewDelegate>

@property (nonatomic ,weak) ZJScrollPageView *scrollPageView;

@end

@implementation WXSEssenceViewController
#pragma mark -

#pragma mark - life cycle 视图的生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"精华";
    
    //    NSArray *titleArray = @[@"段子", @"音频", @"图片", @"视频", @"全部"];
    //    NSArray *typeArray = [[NSArray alloc] initWithObjects:[NSString stringWithFormat:@"%ld",(long)WXSTopicTypeWords], [NSString stringWithFormat:@"%ld",(long)WXSTopicTypeVoice], [NSString stringWithFormat:@"%ld",(long)WXSTopicTypePicture], [NSString stringWithFormat:@"%ld",(long)WXSTopicTypeVideo],[NSString stringWithFormat:@"%ld",(long)WXSTopicTypeAll],nil];
    //    for (int i = 0; i < titleArray.count; i++) {
    //        WXSTopicViewController *VC = [[WXSTopicViewController alloc] initWithTitle:titleArray[i]];
    //        VC.topicType = typeArray[i];
    //        [self addChildViewController:VC];
    //    }
    [self setUpChildViewController];
    // Do any additional setup after loading the view.
}

#pragma mark -

#pragma mark - private Methods 私有方法

- (void)setUpChildViewController {
    
    WXSTopicViewController *wordsVC = [[WXSTopicViewController alloc] initWithTitle:@"段子"];
    wordsVC.topicType = WXSTopicTypeWords;
    
    WXSTopicViewController *voiceVC = [[WXSTopicViewController alloc] initWithTitle:@"音频"];
    voiceVC.topicType = WXSTopicTypeVoice;
    
    WXSTopicViewController *pictureVC = [[WXSTopicViewController alloc] initWithTitle:@"图片"];
    pictureVC.topicType = WXSTopicTypePicture;
    
    WXSTopicViewController *videoVC = [[WXSTopicViewController alloc] initWithTitle:@"视频"];
    videoVC.topicType = WXSTopicTypeVideo;
    
    WXSTopicViewController *allVC = [[WXSTopicViewController alloc] initWithTitle:@"全部"];
    allVC.topicType = WXSTopicTypeAll;
    
     [self addChildViewController:allVC];
     [self addChildViewController:videoVC];
     [self addChildViewController:pictureVC];
     [self addChildViewController:wordsVC];
     [self addChildViewController:voiceVC];
   
    //不明白这句话
    [self.childViewControllers makeObjectsPerformSelector:@selector(setAreaType:) withObject:@"list"];
    
    //一种不错的浅灰色 [UIColor groupTableViewBackgroundColor]
    self.scrollPageView.backgroundColor = [UIColor groupTableViewBackgroundColor];
}
//- (void)setUpOneChildViewController:(WXSTopicViewController *)VC title:(NSString *)title topicType:(NSInteger)type{
//    VC.title = @"";
//}

#pragma mark -

#pragma mark - Override 复写方法



#pragma mark -

#pragma mark - getters and setters 设置器和访问器
- (ZJScrollPageView *)scrollPageView {
    if (_scrollPageView == nil) {
        ZJSegmentStyle *style = [[ZJSegmentStyle alloc] init];
        //显示滚动条
        style.showLine = YES;
        //颜色渐变
        style.gradualChangeTitleColor = YES;
        style.animatedContentViewWhenTitleClicked = NO;
        style.autoAdjustTitlesWidth = YES;
        
        ZJScrollPageView *scrollPageView = [[ZJScrollPageView alloc] initWithFrame:CGRectMake(0, self.lmj_navgationBar.lmj_height, self.view.width, self.view.lmj_height - self.lmj_navgationBar.lmj_height) segmentStyle:style titles:[self.childViewControllers valueForKey:@"title"] parentViewController:self delegate:self];
        scrollPageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self.view addSubview:scrollPageView];
        _scrollPageView = scrollPageView;
    }
    return _scrollPageView;
}

#pragma mark -

#pragma mark - ZJScrollPageViewDelegate

- (NSInteger)numberOfChildViewControllers {
    return self.childViewControllers.count;
}

- (UIViewController<ZJScrollPageViewChildVcDelegate> *)childViewController:(UIViewController<ZJScrollPageViewChildVcDelegate> *)reuseViewController forIndex:(NSInteger)index {
    UIViewController<ZJScrollPageViewChildVcDelegate> *childVC = reuseViewController;
    if (!childVC) {
        childVC = self.childViewControllers[index];
    }
    return childVC;
}
- (BOOL)shouldAutomaticallyForwardAppearanceMethods {
    return NO;
}

#pragma mark -

#pragma mark - LMJNavUIBaseViewControllerDataSource
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

/** 背景色 */
- (UIColor *)lmjNavigationBackgroundColor:(LMJNavigationBar *)navigationBar
{
    return [UIColor colorWithRed:208 / 255.0 green:50 / 255.0 blue:40 / 255.0 alpha:1];
}

/** 是否隐藏底部黑线 */
- (BOOL)lmjNavigationIsHideBottomLine:(LMJNavigationBar *)navigationBar
{
    return YES;
}

/** 导航条中间的 View */
- (UIView *)lmjNavigationBarTitleView:(LMJNavigationBar *)navigationBar
{
    return ({
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
        imageView.backgroundColor = [UIColor whiteColor];
        imageView;
    });
}
/** 导航条左边的按钮 */
- (UIImage *)lmjNavigationBarLeftButtonImage:(UIButton *)leftButton navigationBar:(LMJNavigationBar *)navigationBar
{
    [leftButton setImage:[UIImage imageNamed:@"MainTagSubIconClick"] forState:UIControlStateHighlighted];
    return [UIImage imageNamed:@"MainTagSubIcon"];
}
/** 导航条右边的按钮 */
- (UIImage *)lmjNavigationBarRightButtonImage:(UIButton *)rightButton navigationBar:(LMJNavigationBar *)navigationBar
{
    [rightButton setImage:[UIImage imageNamed:@"nav_coin_icon_click"] forState:UIControlStateHighlighted];
    return [UIImage imageNamed:@"nav_coin_icon"];
}

- (void)titleClickEvent:(UILabel *)sender navigationBar:(LMJNavigationBar *)navigationBar {
    NSLog(@"%@",@"点击事件");
//    [self.navigationController pushViewController:[[BSJRecommendViewController alloc] init] animated:YES];
}

- (void)leftButtonEvent:(UIButton *)sender navigationBar:(LMJNavigationBar *)navigationBar {
//    [self.navigationController pushViewController:[[BSJRecommendViewController alloc] init] animated:YES];
}

- (void)rightButtonEvent:(UIButton *)sender navigationBar:(LMJNavigationBar *)navigationBar {
//    [self.navigationController pushViewController:[[BSJRecommendViewController alloc] init] animated:YES];
}



#pragma mark -

#pragma mark - event response 所有触发的事件响应 按钮、通知、分段控件等



#pragma mark -

#pragma mark - StatisticsLog 各种页面统计Log


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
