//
//  WXSNavigationViewController.m
//  WXSparkApp
//
//  Created by 王旭 on 2019/4/18.
//  Copyright © 2019 王旭. All rights reserved.
//

#import "WXSNavigationViewController.h"

@interface WXSNavigationViewController ()

@end

@implementation WXSNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationBar.hidden = YES;
    
    // 不让自控制器控制系统导航条
    self.fd_viewControllerBasedNavigationBarAppearanceEnabled = NO;
}
/*
 #pragma mark - 全局侧滑代码------------BEGIN----
 - (void)getSystemGestureOfBack
 {
 // 记录系统的pop代理
 UIPanGestureRecognizer *panGes = [[UIPanGestureRecognizer alloc] initWithTarget:self.interactivePopGestureRecognizer.delegate action:NSSelectorFromString(@"handleNavigationTransition:")];
 
 [self.view addGestureRecognizer:panGes];
 
 panGes.delegate = self;
 
 // 禁止之前的手势
 self.interactivePopGestureRecognizer.enabled = NO;
 
 }
 
 
 - (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
 {
 // 非根控制器才能触发
 return self.childViewControllers.count > 1;
 }
 #pragma mark - 全局侧滑代码------------END----
 */

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count != 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
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
