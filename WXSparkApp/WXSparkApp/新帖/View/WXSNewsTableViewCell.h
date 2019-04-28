//
//  WXSNewsTableViewCell.h
//  WXSparkApp
//
//  Created by 王旭 on 2019/4/26.
//  Copyright © 2019 王旭. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WXSNewsModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WXSNewsTableViewCell : UITableViewCell

@property (nonatomic ,strong) WXSNewsModel *model;

@property (strong, nonatomic)  UIImageView *pictureImageView;
@property (strong, nonatomic)  UILabel *nameLabel;
@property (strong, nonatomic)  UILabel *classNameLabel;

@end

NS_ASSUME_NONNULL_END
