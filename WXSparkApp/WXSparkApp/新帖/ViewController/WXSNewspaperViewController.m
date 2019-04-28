//
//  WXSNewspaperViewController.m
//  WXSparkApp
//
//  Created by 王旭 on 2019/4/26.
//  Copyright © 2019 王旭. All rights reserved.
//

#import "WXSNewspaperViewController.h"
#import "WXSHTTPTool.h"
#import "WXSNewsTableViewCell.h"

@interface WXSNewspaperViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) UITableView *tableView;

@property (nonatomic ,strong) NSMutableArray *dataArray;

@end

@implementation WXSNewspaperViewController

- (NSMutableArray *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    NSString *string = @"https://www.apiopen.top/journalismApi";
    [WXSHTTPTool POST:string parameters:@"" success:^(id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
        NSDictionary *dic1 = [responseObject valueForKey:@"data"];
        NSArray *array = [dic1 valueForKey:@"auto"];
        for (int i = 0; i < array.count; i++) {
            WXSNewsModel *model = [WXSNewsModel modelWithDictionary:array[i]];
            [self.dataArray addObject:model];
            if (i == array.count - 1) {
                [self.tableView reloadData];
            }
        }
//        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//            
//          WXSNewsModel *model = [WXSNewsModel modelWithDictionary:obj];
//          [self.dataArray addObject:model];
//            if (stop) {
//                [self.tableView reloadData];
//            }
//            
//        }];
    } failure:^(NSError * _Nullable error) {
        NSLog(@"%@",error);
    }];
    
    // Do any additional setup after loading the view.
}

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    if (self.dataArray.count < 0) {
//        return nil;
//    }
   return self.dataArray.count;
   // return self.dataArray.count > 0 ? self.dataArray.count : 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    WXSNewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[WXSNewsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    //cell.nameLabel.text = @"ffff";
    cell.model = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"ffff");
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}
                                  
//设置边线
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
      [cell setSeparatorInset:UIEdgeInsetsZero];
      [cell setLayoutMargins:UIEdgeInsetsZero];
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
