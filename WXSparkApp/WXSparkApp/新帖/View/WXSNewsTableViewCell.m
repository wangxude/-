//
//  WXSNewsTableViewCell.m
//  WXSparkApp
//
//  Created by 王旭 on 2019/4/26.
//  Copyright © 2019 王旭. All rights reserved.
//

#import "WXSNewsTableViewCell.h"
#define StatusTableViewCellControlSpacing 5 //控件间距
#define StatusTableViewCellAvatarWidth 60 //头像宽度
#define StatusTableViewCellAvatarHeight 60 //头像高度

@implementation WXSNewsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(WXSNewsModel *)model {
    _model = model;
    self.nameLabel.text = [NSString stringWithFormat:@"%@",model.source];
    self.classNameLabel.text = [NSString stringWithFormat:@"%@",model.digest];
    self.pictureImageView.image = [UIImage imageNamed:@"player_play"];
    NSLog(@"%@---%@",model.source,model.digest);
//    self.nameLabel.text = [NSString stringWithFormat:@"%@",model.topic.name];
//    self.classNameLabel.text = [NSString stringWithFormat:@"%@",model.topic.ID];
//    [self.pictureImageView sd_setImageWithURL:model.topic.profile_image placeholderImage:nil];
    
    
    
}


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initWithSubView];
    }
    return self;
    
}
//初始化视图
-(void)initWithSubView{
    self.pictureImageView = [[UIImageView alloc]init];
    [self.contentView addSubview:self.pictureImageView];
    
    self.nameLabel = [[UILabel alloc]init];
    [self.contentView addSubview:self.nameLabel];
    
    self.classNameLabel = [[UILabel alloc]init];
    [self.contentView addSubview:self.classNameLabel];
    
    
    //头像
    CGFloat imageX = 5;
    CGFloat imageY = 5;
    CGRect imageIconRect = CGRectMake(imageX, imageY, StatusTableViewCellAvatarWidth, StatusTableViewCellAvatarHeight);
    self.pictureImageView.frame = imageIconRect;
    self.pictureImageView.image = [UIImage imageNamed:@"player_play"];
    
    //名字
    CGFloat nameX = CGRectGetMaxX(_pictureImageView.frame) + StatusTableViewCellControlSpacing;
    CGFloat nameY = 5;

    
    CGRect nameRect = CGRectMake(nameX, nameY, 100, 30);
    self.nameLabel.frame = nameRect;
    
    CGFloat classNameLabelX = CGRectGetMaxX(_pictureImageView.frame) + StatusTableViewCellControlSpacing;
    CGFloat classNameLabelY = CGRectGetMaxY(_nameLabel.frame) + StatusTableViewCellControlSpacing;
    CGRect classNameLabelRect = CGRectMake(classNameLabelX, classNameLabelY, 200, 25);
    self.classNameLabel.frame = classNameLabelRect;
    
}


@end
