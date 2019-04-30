//
//  WXSTopicTableViewCell.m
//  WXSparkApp
//
//  Created by 王旭 on 2019/4/30.
//  Copyright © 2019 王旭. All rights reserved.
//

#import "WXSTopicTableViewCell.h"

@interface WXSTopicTableViewCell ()

/**
 头像
 */
@property (nonatomic ,strong) UIImageView *headerImageView;
/**LMJUMengHelper.h
 是否是新浪会员
 */
@property (nonatomic ,strong) UIImageView *isSinaVipImageView;
/**
 昵称
 */
@property (nonatomic ,strong) UILabel *screenNameLabel;
/**
 发表时间
 */
@property (nonatomic ,strong) UILabel *creatTimeLabel;
/**
 内容text
 */
@property (nonatomic ,strong) UIButton *contentTextLabel;

@property (nonatomic ,strong) UIButton *dingBtn;
@property (nonatomic ,strong) UIButton *caiBtn;
@property (nonatomic ,strong) UIButton *repostBtn;
@property (nonatomic ,strong) UIButton *commentBtn;

//@property (nonatomic ,strong) 

@end

@implementation WXSTopicTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
