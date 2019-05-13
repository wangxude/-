//
//  WXSMineViewController.m
//  WXSparkApp
//
//  Created by 王旭 on 2019/4/22.
//  Copyright © 2019 王旭. All rights reserved.
//

#import "WXSMineViewController.h"

@interface WXSMineViewController ()<UITableViewDelegate, UITableViewDataSource>
//列表
@property (nonatomic ,strong) UITableView *dataTableView;
//数据数组
@property (nonatomic ,strong) NSMutableArray *dataArray;
//图片名称数组
@property (nonatomic ,strong) NSMutableArray *imageArray;


@end

@implementation WXSMineViewController
#pragma mark -

#pragma mark - life cycle 视图的生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的";
    NSLog(@"%lf",self.navigationController.navigationBar.frame.size.height);
    CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];
    NSLog(@"%f", rectStatus.size.height);   // 高度
    NSLog(@"%lf",self.tabBarController.tabBar.frame.size.height);
    
    self.dataArray = [NSMutableArray arrayWithObjects:@"音乐播放器", @"我的位置", @"我的群组", @"我的好友", @"欢迎评分", @"意见反馈" ,nil];
    self.imageArray = [NSMutableArray arrayWithObjects:@"发布动态", @"我的位置", @"我的群组", @"我的好友", @"欢迎评分", @"意见反馈" ,nil];
//    self.dataTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 88, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-88-49) style:UITableViewStylePlain];
    CGFloat statusNavigationBarHeight = self.navigationController.navigationBar.frame.size.height + [[UIApplication sharedApplication] statusBarFrame].size.height;
    CGFloat tabBarHeight = self.tabBarController.tabBar.frame.size.height;
    self.dataTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, statusNavigationBarHeight, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-statusNavigationBarHeight-tabBarHeight) style:UITableViewStyleGrouped];
    self.dataTableView.delegate = self;
    self.dataTableView.dataSource = self;
    [self.view addSubview:self.dataTableView];
    
    //ios 11设置 。IOS11以后，Self-Sizing默认开启，包括Headers, footers。如果项目中没使用estimatedRowHeight属性，在IOS11下会有奇奇怪怪的现象，因为IOS11之前，estimatedRowHeight默认为0，Self-Sizing自动打开后，contentSize和contentOffset都可能发生改变。可以通过以下方式禁用：
    if (@available(iOS 11.0, *)) {
        self.dataTableView.estimatedRowHeight = 0;
        self.dataTableView.estimatedSectionHeaderHeight = 0;
        self.dataTableView.estimatedSectionFooterHeight = 0;
    }
    
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"mineCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }else {
        //删除cell中的子对象，防止覆盖的问题
        while ([cell.contentView.subviews lastObject] != NULL) {
            [(UIView *)[cell.contentView.subviews lastObject] removeFromSuperview];
        }
    }
    for (UIView *subView in cell.contentView.subviews) {
        [subView removeFromSuperview];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@",self.dataArray[indexPath.row]];
    NSString *imageName = [NSString stringWithFormat:@"%@",self.imageArray[indexPath.row]];
    cell.imageView.image = [UIImage imageNamed:imageName];
    
//    if (indexPath.row == 0) {
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    }else {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
  //  }
   
    //设置边线
    [self.dataTableView setSeparatorInset:UIEdgeInsetsZero];
    [self.dataTableView setLayoutMargins:UIEdgeInsetsZero];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
         return 0.00000000001;
    }
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 0) {
        return 0.00000000001;
    }
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        
    }
}


#pragma mark -

#pragma mark - CustomDelegate 自定义的代理



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
