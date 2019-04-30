//
//  WXSTopService.h
//  WXSparkApp
//
//  Created by 王旭 on 2019/4/28.
//  Copyright © 2019 王旭. All rights reserved.
//

#import "WXSHTTPTool.h"
#import "WXSHeader.h"
#import "WXSTopic.h"
#import "WXSTopicViewModel.h"

NS_ASSUME_NONNULL_BEGIN


@interface WXSTopService : WXSHTTPTool

@property (nonatomic ,strong) NSMutableArray<WXSTopicViewModel *> *topicViewModels;

/**
 加载帖子

 @param isMore 是上拉加载更多吗
 @param typeA 参数值为list，如果想要获取“新帖”板块的帖子，则传入"newlist"即可
 @param topicType 1为全部，10为图片，29为段子，31为音频，41为视频
 @param completion 完成回调
 */
- (void)getTopicIsMore:(BOOL)isMore typeA:(NSString *)typeA topicType:(NSInteger)topicType
            completion:(void(^)(NSError *errror,NSInteger totalCount, NSInteger currentCount))completion;

@end

NS_ASSUME_NONNULL_END
