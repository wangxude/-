//
//  WXSTopicTableViewCell.m
//  WXSparkApp
//
//  Created by 王旭 on 2019/4/30.
//  Copyright © 2019 王旭. All rights reserved.
//

#import "WXSTopicTableViewCell.h"
//视频
#import "WXSTopicVideoView.h"
//声音
#import "WXSTopicVoiceView.h"
//图片
#import "WXSTopicPictureView.h"

#define controlSpacing 10

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
@property (nonatomic ,strong) UILabel *contentTextLabel;
@property (nonatomic ,strong) UIButton *rightButton;

@property (nonatomic ,strong) UIButton *dingBtn;
@property (nonatomic ,strong) UIButton *caiBtn;
@property (nonatomic ,strong) UIButton *repostBtn;
@property (nonatomic ,strong) UIButton *commentBtn;

/**
 热门评论的父控件
 */
@property (nonatomic ,strong) UIView *cmtContainerView;

/**
 视频视图
 */
@property (nonatomic ,strong) WXSTopicVideoView *videoView;

/**
 声音视图
 */
@property (nonatomic ,strong) WXSTopicVoiceView *voiceView;

/**
 图片视图
 */
@property (nonatomic ,strong) WXSTopicPictureView *pictureView;


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
+ (instancetype)topicCellWithTableView:(UITableView *)tableView {
    //NSStringFromClass([self class])
    //static NSString *identifier = ;
    WXSTopicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        //cell = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].lastObject
        cell = [[WXSTopicTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:NSStringFromClass([self class])];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUpTopicCellUI];
    }
    return self;
}

- (void)setUpTopicCellUI {
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.headerImageView = [[UIImageView alloc] init];
    self.headerImageView.layer.cornerRadius = 25;
    self.headerImageView.layer.masksToBounds = YES;
    [self.contentView addSubview:self.headerImageView];
    
    self.screenNameLabel = [[UILabel alloc] init];
    [self.contentView addSubview: self.screenNameLabel];
    
    self.creatTimeLabel = [[UILabel alloc] init];
    [self.contentView addSubview: self.creatTimeLabel];
    
    self.rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.rightButton setImage:[UIImage imageNamed:@"cellmorebtnnormal"] forState: UIControlStateNormal];
    [self.contentView addSubview:self.rightButton];
    
    self.contentTextLabel = [[UILabel alloc] init];
    self.contentTextLabel.font = AdaptedFontSize(16);
    self.contentTextLabel.numberOfLines = 0;
    [self.contentView addSubview:self.contentTextLabel];
    //底部按钮
    self.dingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.dingBtn setImage:[UIImage imageNamed:@"mainCellDing"] forState: UIControlStateNormal];
    [self.dingBtn setImage:[UIImage imageNamed:@"mainCellDingClick"] forState: UIControlStateHighlighted];
    self.dingBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.dingBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
//    self.dingBtn.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 60);
//    //button标题的偏移量，这个偏移量是相对于图片的
//    self.dingBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    [self.contentView addSubview:self.dingBtn];
    
    self.caiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.caiBtn setImage:[UIImage imageNamed:@"mainCellCai"] forState: UIControlStateNormal];
    [self.caiBtn setImage:[UIImage imageNamed:@"mainCellCaiClick"] forState: UIControlStateHighlighted];
    self.caiBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.caiBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
//    self.caiBtn.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 60);
//    //button标题的偏移量，这个偏移量是相对于图片的
//    self.caiBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    [self.contentView addSubview:self.caiBtn];
    
    self.repostBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.repostBtn setImage:[UIImage imageNamed:@"mainCellShare"] forState: UIControlStateNormal];
    [self.repostBtn setImage:[UIImage imageNamed:@"mainCellShareClick"] forState: UIControlStateHighlighted];
    self.repostBtn.titleLabel.font = [UIFont systemFontOfSize:15];
     [self.repostBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
//    self.repostBtn.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 60);
//    //button标题的偏移量，这个偏移量是相对于图片的
//    self.repostBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    [self.contentView addSubview:self.repostBtn];
    
    self.commentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.commentBtn setImage:[UIImage imageNamed:@"mainCellComment"] forState: UIControlStateNormal];
    [self.commentBtn setImage:[UIImage imageNamed:@"mainCellCommentClick"] forState: UIControlStateHighlighted];
    self.commentBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.commentBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
//    self.commentBtn.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 60);
//    //button标题的偏移量，这个偏移量是相对于图片的
//    self.commentBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    [self.contentView addSubview:self.commentBtn];
    
    //设置控件的约束
    //[self setUpViewConstraints];
}

- (void)setUpViewConstraints {
    [self.headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(controlSpacing);
        make.top.equalTo(self).offset(controlSpacing);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(50);
    }];
    
    [self.screenNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headerImageView.mas_right).offset(controlSpacing);
        make.top.equalTo(self).offset(controlSpacing);
        make.right.equalTo(self.rightButton.mas_left).offset(-10);
        make.height.mas_equalTo(30);
    }];
    [self.creatTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headerImageView.mas_right).offset(controlSpacing);
        make.top.equalTo(self.screenNameLabel.mas_bottom).offset(controlSpacing);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(17);
    }];
    [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.screenNameLabel.mas_right).offset(10);
        make.right.equalTo(self).offset(-10);
        make.top.equalTo(self).offset(15);
        make.height.mas_equalTo(30);
    }];
//    [self.contentTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self).offset(10);
//        make.right.equalTo(self).offset(-10);
//        make.top.equalTo(self.headerImageView.mas_bottom).offset(10);
//        make.bottom.equalTo(self.dingBtn.mas_top).offset(-5);
//    }];
    [self.dingBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.bottom.equalTo(self);
        make.width.mas_equalTo(kScreenWidth/4);
        make.height.mas_equalTo(35);
    }];
    [self.caiBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.dingBtn.mas_right);
        make.bottom.equalTo(self);
        make.width.mas_equalTo(kScreenWidth/4);
        make.height.mas_equalTo(35);
    }];
    [self.repostBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.caiBtn.mas_right);
        make.bottom.equalTo(self);
        make.width.mas_equalTo(kScreenWidth/4);
        make.height.mas_equalTo(35);
    }];
    [self.commentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.repostBtn.mas_right);
        make.bottom.equalTo(self);
        make.width.mas_equalTo(kScreenWidth/4);
        make.height.mas_equalTo(35);
    }];
}
- (void)setUpUpdateVideoUpdateViewConstraints {
    [self setUpViewConstraints];
    [self.contentTextLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.right.equalTo(self).offset(-10);
        make.top.equalTo(self.headerImageView.mas_bottom).offset(10);
        make.bottom.equalTo(self.videoView.mas_top).offset(-5);
    }];

}
- (void)setUpWordsUpdateViewConstraints {
    [self setUpViewConstraints];
    [self.contentTextLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.right.equalTo(self).offset(-10);
        make.top.equalTo(self.headerImageView.mas_bottom).offset(10);
        make.bottom.equalTo(self.dingBtn.mas_top).offset(-5);
    }];

}

- (void)setUpPictureUpdateViewConstraints {
    [self setUpViewConstraints];
    [self.contentTextLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.right.equalTo(self).offset(-10);
        make.top.equalTo(self.headerImageView.mas_bottom).offset(10);
        make.bottom.equalTo(self.pictureView.mas_top).offset(-5);
    }];
}
- (void)setUpVoiceUpdateViewConstraints {
    [self setUpViewConstraints];
    [self.contentTextLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.right.equalTo(self).offset(-10);
        make.top.equalTo(self.headerImageView.mas_bottom).offset(10);
        make.bottom.equalTo(self.voiceView.mas_top).offset(-5);
    }];
   
}

- (void)setTopicViewModel:(WXSTopicViewModel *)topicViewModel {
    _topicViewModel = topicViewModel;
    
    //Model
    [self.headerImageView sd_setImageWithURL:topicViewModel.topic.profile_image placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    
    self.screenNameLabel.text = topicViewModel.topic.name;
    self.creatTimeLabel.text = topicViewModel.creatTime;
    self.contentTextLabel.text = topicViewModel.topic.text;
    
    //self.isSinaVipImageView.hidden = !topicViewModel.topic.isSina_v;
    // ViewModel
    [self.dingBtn setTitle:topicViewModel.zanCount forState:UIControlStateNormal];
    [self.caiBtn setTitle:topicViewModel.caiCount forState:UIControlStateNormal];
    [self.repostBtn setTitle:topicViewModel.repostCount forState:UIControlStateNormal];
    [self.commentBtn setTitle:topicViewModel.commentCount forState:UIControlStateNormal];
  
    if (topicViewModel.topic.type == WXSTopicTypePicture) {

        self.pictureView.topicViewModel = topicViewModel;
        self.pictureView.frame = topicViewModel.pictureFrame;
        
        _pictureView.hidden = NO;
        _voiceView.hidden = YES;
        _videoView.hidden = YES;
        [self setUpPictureUpdateViewConstraints];
    }else if (topicViewModel.topic.type == WXSTopicTypeVoice)
    {
        self.voiceView.frame = topicViewModel.pictureFrame;
        self.voiceView.topicViewModel = topicViewModel;

        _pictureView.hidden = YES;
        _voiceView.hidden = NO;
        _videoView.hidden = YES;

        [self setUpVoiceUpdateViewConstraints];
    }else if (topicViewModel.topic.type == WXSTopicTypeWords)
    {
        _pictureView.hidden = YES;
        _voiceView.hidden = YES;
        _videoView.hidden = YES;
        [self setUpWordsUpdateViewConstraints];
    }else if (topicViewModel.topic.type == WXSTopicTypeVideo)
    {
        self.videoView.frame = topicViewModel.pictureFrame;
        self.videoView.topicViewModel = topicViewModel;

        _pictureView.hidden = YES;
        _voiceView.hidden = YES;
        _videoView.hidden = NO;
        [self setUpUpdateVideoUpdateViewConstraints];
    }

    
    // 热门评论
//    if (topicViewModel.topic.topCmts.count) {
//
//        self.cmtContainerView.hidden = NO;
//        self.topCmtContentView.textLayout = topicViewModel.topCmtLayout;
//        self.topCmtHeightConstraint.constant = topicViewModel.topCmtLayout.textBoundingSize.height;
//        self.topicViewModel.topCmtClick = ^(BSJUser *user, BSJTopicTopComent *topCmt) {
//            NSLog(@"%@,   %@", user.username, topCmt.content);
//        };
//
//    }else
//    {
//        self.cmtContainerView.hidden = YES;
//    }
}

- (WXSTopicPictureView *)pictureView {
    if (_pictureView == nil) {
       _pictureView = [[WXSTopicPictureView alloc] init];
       [self.contentView addSubview:_pictureView];
    }
    return _pictureView;
}
- (WXSTopicVoiceView *)voiceView {
    if (_voiceView == nil) {
        _voiceView = [[WXSTopicVoiceView alloc] init];
        [self.contentView addSubview:_voiceView];
    }
    return _voiceView;
}
- (WXSTopicVideoView *)videoView {
    if (_videoView == nil) {
        _videoView = [[WXSTopicVideoView alloc] init];
        [self.contentView addSubview:_videoView];
    }
    return _videoView;
}



@end
