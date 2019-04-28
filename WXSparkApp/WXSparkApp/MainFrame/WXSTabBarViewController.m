//
//  WXSTabBarViewController.m
//  WXSparkApp
//
//  Created by 王旭 on 2019/4/18.
//  Copyright © 2019 王旭. All rights reserved.
//

#import "WXSTabBarViewController.h"
#import "WXSNavigationViewController.h"
//四个模块的头文件
#import "WXSFocusViewController.h"
#import "WXSNewPostViewController.h"
#import "WXSEssenceViewController.h"
#import "WXSMineViewController.h"

#import "BSJTabBar.h"

@interface WXSTabBarViewController ()<UITabBarControllerDelegate>

@end

@implementation WXSTabBarViewController



#pragma mark -
#pragma mark - life cycle 视图的生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpTabBar];
    [self addChildViewControllers];
    [self addTabarItems];
    self.delegate = self;
    // Do any additional setup after loading the view.
}


#pragma mark -
#pragma mark - private Methods 私有方法

#pragma mark -
#pragma mark - Override 复写方法



#pragma mark -
#pragma mark - getters and setters 设置器和访问器



#pragma mark -
#pragma mark - UITableViewDelegate



#pragma mark -
#pragma mark - CustomDelegate 自定义的代理



#pragma mark -
#pragma mark - event response 所有触发的事件响应 按钮、通知、分段控件等



#pragma mark -
#pragma mark - life cycle 视图的生命周期



#pragma mark -
#pragma mark - StatisticsLog 各种页面统计Log


/**
 *  利用 KVC 把系统的 tabBar 类型改为自定义类型。覆盖父类方法
 */
- (void)setUpTabBar {
    BSJTabBar *tabBar = [[BSJTabBar alloc] init];
    LMJWeak(self);
    [tabBar setPublishBtnClick:^(BSJTabBar *tabBar, UIButton *publishBtn){
        [weakself showPublishVc];
    }];
    [self setValue:tabBar forKeyPath:LMJKeyPath(self, tabBar)];
}

- (void)addChildViewControllers
{
    WXSNavigationViewController *one = [[WXSNavigationViewController alloc] initWithRootViewController:[[WXSEssenceViewController alloc] init]];
    
    WXSNavigationViewController *two = [[WXSNavigationViewController alloc] initWithRootViewController:[[WXSNewPostViewController alloc] init]];
    
    WXSNavigationViewController *four = [[WXSNavigationViewController alloc] initWithRootViewController:[[WXSFocusViewController alloc] init]];
    
    WXSNavigationViewController *five = [[WXSNavigationViewController alloc] initWithRootViewController:[[WXSMineViewController alloc] init]];
    
    self.viewControllers = @[one, two, four, five];
    
}

- (void)addTabarItems
{
    
    NSDictionary *firstTabBarItemsAttributes = @{
                                                 @"TabBarItemTitle" : @"精华",
                                                 @"TabBarItemImage" : @"tabBar_essence_icon",
                                                 @"TabBarItemSelectedImage" : @"tabBar_essence_click_icon",
                                                 };
    
    NSDictionary *secondTabBarItemsAttributes = @{
                                                  @"TabBarItemTitle" : @"关注",
                                                  @"TabBarItemImage" : @"tabBar_friendTrends_icon",
                                                  @"TabBarItemSelectedImage" : @"tabBar_friendTrends_click_icon",
                                                  };
    NSDictionary *thirdTabBarItemsAttributes = @{
                                                 @"TabBarItemTitle" : @"新帖",
                                                 @"TabBarItemImage" : @"tabBar_new_icon",
                                                 @"TabBarItemSelectedImage" : @"tabBar_new_click_icon",
                                                 };
    
    NSDictionary *fourthTabBarItemsAttributes = @{
                                                  @"TabBarItemTitle" : @"我",
                                                  @"TabBarItemImage" : @"tabBar_me_icon",
                                                  @"TabBarItemSelectedImage" : @"tabBar_me_click_icon"
                                                  };
    
    NSArray<NSDictionary *>  *tabBarItemsAttributes = @[
                                                        firstTabBarItemsAttributes,
                                                        thirdTabBarItemsAttributes,
                                                        secondTabBarItemsAttributes,
                                                        fourthTabBarItemsAttributes
                                                        ];
    
    [self.childViewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        obj.tabBarItem.title = tabBarItemsAttributes[idx][@"TabBarItemTitle"];
        obj.tabBarItem.image = [UIImage imageNamed:tabBarItemsAttributes[idx][@"TabBarItemImage"]];
        obj.tabBarItem.selectedImage = [UIImage imageNamed:tabBarItemsAttributes[idx][@"TabBarItemSelectedImage"]];
        obj.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -3);
    }];
    
    self.tabBar.tintColor = [UIColor redColor];
}

#pragma mark - UITabBarControllerDelegate
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    return YES;
}

- (void)showPublishVc
{
//    LMJWeak(self);
//    BSJPublishViewController *publishVc = [[BSJPublishViewController alloc] init];
//    
//    [PresentAnimator viewController:weakself presentViewController:publishVc presentViewFrame:[UIScreen mainScreen].bounds animated:YES completion:nil animatedDuration:0.5 presentAnimation:^(UIView *presentedView, UIView *containerView, void (^completion)(BOOL finished)) {
//        
//        // 自己做动画
//        presentedView.transform = CGAffineTransformMakeTranslation(0, -kScreenHeight);
//        [UIView animateWithDuration:0.5 animations:^{
//            presentedView.transform = CGAffineTransformIdentity;
//        } completion:^(BOOL finished) {
//            completion(finished);
//        }];
//        
//    } dismissAnimation:^(UIView *dismissView, void (^completion)(BOOL finished)) {
//        // 自己做动画
//        [UIView animateWithDuration:0.5 animations:^{
//            dismissView.transform = CGAffineTransformMakeTranslation(-kScreenWidth, 0);
//        } completion:^(BOOL finished) {
//            completion(finished);
//        }];
//        
//    }];
    
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
