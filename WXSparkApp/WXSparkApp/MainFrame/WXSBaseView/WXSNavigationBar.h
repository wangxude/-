//
//  WXSNavigationBar.h
//  WXSparkApp
//
//  Created by 王旭 on 2019/4/22.
//  Copyright © 2019 王旭. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class WXSNavigationBar;
//主要处理导航条
@protocol  WXSNavigationBarDataSource<NSObject>

@optional

/**头部标题**/
- (NSMutableAttributedString *)wxsNavigationBarTitle:(WXSNavigationBar *)navigationBar;

/**背景图片**/
- (UIImage *)wxsNavigationBarBackgroundImage:(WXSNavigationBar *)navigationBar;
/** 背景色 */
- (UIColor *)wxsNavigationBackgroundColor:(WXSNavigationBar *)navigationBar;
/**是否显示底部黑线**/
- (BOOL)wxsNavigationIsHideBottomLine:(WXSNavigationBar *)navigationBar;
/**导航条的高度**/
- (CGFloat)wxsNavigationHeight:(WXSNavigationBar *)navigationBar;

/** 导航条的左边的 view */
- (UIView *)wxsNavigationBarLeftView:(WXSNavigationBar *)navigationBar;
/** 导航条右边的 view */
- (UIView *)wxsNavigationBarRightView:(WXSNavigationBar *)navigationBar;
/** 导航条中间的 View */
- (UIView *)wxsNavigationBarTitleView:(WXSNavigationBar *)navigationBar;
/** 导航条左边的按钮 */
- (UIImage *)wxsNavigationBarLeftButtonImage:(UIButton *)leftButton navigationBar:(WXSNavigationBar *)navigationBar;
/** 导航条右边的按钮 */
- (UIImage *)wxsNavigationBarRightButtonImage:(UIButton *)rightButton navigationBar:(WXSNavigationBar *)navigationBar;

@end

@protocol WXSNavigationBarDelegate <NSObject>

@optional
/** 左边的按钮的点击 */
-(void)leftButtonEvent:(UIButton *)sender navigationBar:(WXSNavigationBar *)navigationBar;
/** 右边的按钮的点击 */
-(void)rightButtonEvent:(UIButton *)sender navigationBar:(WXSNavigationBar *)navigationBar;
/** 中间如果是 label 就会有点击 */
-(void)titleClickEvent:(UILabel *)sender navigationBar:(WXSNavigationBar *)navigationBar;

@end

@interface WXSNavigationBar : UIView

/** 底部的黑线 */
@property (nonatomic ,weak) UIView *bottomBlackLineView;

/** 标题视图 */
@property (nonatomic ,weak) UIView *titleView;

/** 左边视图 */
@property (nonatomic ,weak) UIView *leftView;

/** 右边视图 */
@property (nonatomic ,weak) UIView *rightView;

/** 标题 */
@property (nonatomic ,weak) NSMutableAttributedString *title;

/** 数据源代理 */
@property (nonatomic ,weak) id<WXSNavigationBarDataSource> dataSource;

/** 点击事件代理 */
@property (nonatomic ,weak) id<WXSNavigationBarDelegate> delegate;

/** 背景图片 */
@property (nonatomic ,weak) UIImage *backgroundImage;

@end

NS_ASSUME_NONNULL_END
