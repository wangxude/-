//
//  WXSAudioPlayerViewController.m
//  WXSparkApp
//
//  Created by 王旭 on 2019/5/7.
//  Copyright © 2019 王旭. All rights reserved.
//

#import "WXSAudioPlayerViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface WXSAudioPlayerViewController ()

/**noisy.mp3
 音频播放器
 */
@property (nonatomic ,strong) AVAudioPlayer *audioPlayer;


@end

@implementation WXSAudioPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.加载本地的音乐文件
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"noisy.mp3" withExtension:nil];
    //2.创建音乐播放器对象
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    //准备播放（音乐播放的内存空间的开辟等功能）
    [self.audioPlayer prepareToPlay];
    
    
    UIButton *playButton = [UIButton buttonWithType:UIButtonTypeCustom];
    playButton.frame = CGRectMake(100, 100, 100, 50);
    [playButton setTitle:@"播放" forState: UIControlStateNormal];
    [playButton setTitleColor:[UIColor redColor] forState: UIControlStateNormal];
    [playButton addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    playButton.tag = 1000;
    [self.view addSubview:playButton];
    
    UIButton *pauseButton = [UIButton buttonWithType:UIButtonTypeCustom];
    pauseButton.frame = CGRectMake(100, 200, 100, 50);
    [pauseButton setTitle:@"暂停" forState: UIControlStateNormal];
    [pauseButton setTitleColor:[UIColor redColor] forState: UIControlStateNormal];
    [pauseButton addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    pauseButton.tag = 1001;
    [self.view addSubview:pauseButton];
    
    UIButton *stopButton = [UIButton buttonWithType:UIButtonTypeCustom];
    stopButton.frame = CGRectMake(100, 300, 100, 50);
    [stopButton setTitle:@"停止" forState: UIControlStateNormal];
    [stopButton setTitleColor:[UIColor redColor] forState: UIControlStateNormal];
    [stopButton addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    stopButton.tag = 1002;
    [self.view addSubview:stopButton];
    
}

- (void)clickAction:(UIButton *)button {
    if (button.tag == 1000) {
        [self.audioPlayer play];
    }else if (button.tag == 1001){
        [self.audioPlayer pause];
    }else {
        [self.audioPlayer stop];
    }
}

@end
