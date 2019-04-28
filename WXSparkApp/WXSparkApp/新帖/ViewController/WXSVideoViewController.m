//
//  WXSVideoViewController.m
//  WXSparkApp
//
//  Created by 王旭 on 2019/4/24.
//  Copyright © 2019 王旭. All rights reserved.
//

#import "WXSVideoViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface WXSVideoViewController ()

@property (nonatomic ,strong) AVPlayer *player;//播放器对象
@property (nonatomic ,strong) UIView *containerView; //播放器容器
@property (nonatomic ,strong) UIButton *playOrPauseButton; //播放暂停按钮
@property (nonatomic ,strong) UIProgressView *progressView; //播放进度

@end

@implementation WXSVideoViewController


#pragma mark -

#pragma mark - life cycle 视图的生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpUI];
    [self.player play];
    // Do any additional setup after loading the view.
}



#pragma mark -

#pragma mark - private Methods 私有方法
- (void)setUpUI {
    //创建播放层视图
    self.containerView = [[UIView alloc] init];
    self.containerView.backgroundColor = [UIColor redColor];
    self.containerView.frame = CGRectMake(100, 100, 200, 200);
    self.containerView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:self.containerView];
//    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.view.mas_top).offset(20);
//        make.left.equalTo(self.view.mas_left).offset(20);
//        make.right.equalTo(self.view.mas_right).offset(-20);
//        make.height.equalTo(@100);
//    }];
    //创建播放层
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    playerLayer.frame = self.containerView.frame;
    playerLayer.videoGravity=AVLayerVideoGravityResizeAspect;//视频填充模式
    [self.view.layer addSublayer:playerLayer];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10, 300, 30, 100);
    [button setImage:[UIImage imageNamed:@"player_pause"] forState: UIControlStateNormal];
    [button addTarget:self action:@selector(playClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

- (void)addNotification {
    //给AVPlayerItem添加播放完成通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playBackFinish:) name:AVPlayerItemDidPlayToEndTimeNotification object:self.player];
}

-(void)removeNotification{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)playBackFinish:(NSNotification *)notification {
    NSLog(@"视频播放完成");
}

-(void)addProgressObserver {
    AVPlayerItem *playerItem=self.player.currentItem;
    UIProgressView *progress=self.progressView;
    //这里设置每秒执行一次
    [self.player addPeriodicTimeObserverForInterval:CMTimeMake(1.0, 1.0) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
        float current=CMTimeGetSeconds(time);
        float total=CMTimeGetSeconds([playerItem duration]);
        NSLog(@"当前已经播放%.2fs.",current);
        if (current) {
            [progress setProgress:(current/total) animated:YES];
        }
    }];
}
- (void)addObserverToPlayerItem:(AVPlayerItem *)playerItem {
    //监控状态属性，注意AVPlayer也有一个status属性，通过监控它的status也可以获得播放状态
    [playerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    //监听网络加载情况属性
    [playerItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];
}
-(void)removeObserverFromPlayerItem:(AVPlayerItem *)playerItem{
    [playerItem removeObserver:self forKeyPath:@"status"];
    [playerItem removeObserver:self forKeyPath:@"loadedTimeRanges"];
}

#pragma mark -

#pragma mark - Override 复写方法



#pragma mark -

#pragma mark - getters and setters 设置器和访问器

- (AVPlayerItem *)getPlayItem {
    NSString *urlString = [NSString stringWithFormat:@"%@",@"http://baobab.kaiyanapp.com/api/v1/playUrl?vid=158165&resourceType=video&editionType=default&source=aliyun&playUrlType=url_oss"];
//    NSCharacterSet *allowedCharacters = [[NSCharacterSet characterSetWithCharactersInString:urlString] invertedSet];
//    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacters];
    //使用utf-8进行编码
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:urlString];
    AVPlayerItem *playerItem = [AVPlayerItem playerItemWithURL:url];
    return playerItem;
}

- (AVPlayer *)player {
    if (!_player) {
        AVPlayerItem *playerItem = [self getPlayItem];
        _player = [AVPlayer playerWithPlayerItem:playerItem];
        [self addObserverToPlayerItem:playerItem];
        [self addProgressObserver];
    }
    return _player;
}


#pragma mark -

#pragma mark - UITableViewDelegate



#pragma mark -

#pragma mark - CustomDelegate 自定义的代理

/**
 *  通过KVO监控播放器状态
 *
 *  @param keyPath 监控属性
 *  @param object  监视器
 *  @param change  状态改变
 *  @param context 上下文
 */
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    AVPlayerItem *playerItem=object;
    if ([keyPath isEqualToString:@"status"]) {
        AVPlayerStatus status= [[change objectForKey:@"new"] intValue];
        if(status==AVPlayerStatusReadyToPlay){
            NSLog(@"正在播放...，视频总长度:%.2f",CMTimeGetSeconds(playerItem.duration));
        }
    }else if([keyPath isEqualToString:@"loadedTimeRanges"]){
        NSArray *array=playerItem.loadedTimeRanges;
        CMTimeRange timeRange = [array.firstObject CMTimeRangeValue];//本次缓冲时间范围
        float startSeconds = CMTimeGetSeconds(timeRange.start);
        float durationSeconds = CMTimeGetSeconds(timeRange.duration);
        NSTimeInterval totalBuffer = startSeconds + durationSeconds;//缓冲总长度
        NSLog(@"共缓冲：%.2f",totalBuffer);
        //
    }
}

#pragma mark -

#pragma mark - event response 所有触发的事件响应 按钮、通知、分段控件等

- (void)playClick:(UIButton *)sender {
    
    if (self.player.rate == 0) {
        //说明是暂停
        [sender setImage:[UIImage imageNamed:@"player_pause"] forState:UIControlStateNormal];
        [self.player play];
    }
    else if (self.player.rate == 1){
        [self.player pause];
        [sender setImage:[UIImage imageNamed:@"player_play"] forState:UIControlStateNormal];
    }
}

#pragma mark -

#pragma mark - StatisticsLog 各种页面统计Log

- (void)dealloc {
    [self removeObserverFromPlayerItem:self.player.currentItem];
    [self removeNotification];
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
