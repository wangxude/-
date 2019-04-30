
//
//  WXSTopService.m
//  WXSparkApp
//
//  Created by 王旭 on 2019/4/28.
//  Copyright © 2019 王旭. All rights reserved.
//

#import "WXSTopService.h"
#import "WXSTopicListDAL.h"

@interface WXSTopService ()

@property (nonatomic ,copy) NSString *maxTime;
/**防止重复刷新**/
@property (nonatomic ,strong) id parameters;

@end

@implementation WXSTopService

- (void)getTopicIsMore:(BOOL)isMore typeA:(NSString *)typeA topicType:(NSInteger)topicType completion:(nonnull void (^)(NSError *, NSInteger, NSInteger))completion {
    NSMutableDictionary *paramters = [NSMutableDictionary dictionary];
    self.parameters = paramters;
    
    paramters[@"a"] = typeA;
    paramters[@"c"] = @"data";
    paramters[@"type"] = @(topicType);
    paramters[@"maxtime"] = isMore ? self.maxTime: nil;
    paramters[@"per"] = @10;
    
    [WXSTopicListDAL queryTopicListFromDiskWithAreaType:typeA topicType:[NSString stringWithFormat:@"%zd",topicType] maxTime:paramters[@"maxtime"] per:10 completion:^(NSMutableArray<NSMutableDictionary *> * _Nonnull dictArray) {
        if (self.parameters != paramters) {
            return ;
        }
        if (dictArray.count > 0) {
            if (!isMore) {
                [self.topicViewModels removeAllObjects];
            }
            NSMutableArray<WXSTopicViewModel *> *newTopicViewModels = [NSMutableArray array];
            [[WXSTopic mj_objectArrayWithKeyValuesArray:dictArray] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [newTopicViewModels addObject:[WXSTopicViewModel viewModelWithTopic:obj]];
            }];
            [self.topicViewModels addObjectsFromArray:newTopicViewModels];
            self.maxTime = self.topicViewModels.lastObject.topic.t;
            completion(nil, 999999999, self.topicViewModels.count);
        }
        else {
            [self POST:WXSBaiSiJieHTTPAPI parameters:paramters success:^(id  _Nullable responseObject) {
                if (self.parameters != paramters) {
                    return ;
                }
                if (!isMore) {
                    [self.topicViewModels removeAllObjects];
                }
                NSMutableArray<WXSTopicViewModel *> *newTopicViewModels = [NSMutableArray array];
                
                [[WXSTopic mj_objectArrayWithKeyValuesArray:responseObject[@"list"]] enumerateObjectsUsingBlock:^(WXSTopic  *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    [newTopicViewModels addObject:[WXSTopicViewModel viewModelWithTopic:obj]];
                }];

                [self.topicViewModels addObjectsFromArray:newTopicViewModels];
                self.maxTime = self.topicViewModels.lastObject.topic.t;
                completion(nil, [responseObject[@"info"][@"count"] integerValue], self.topicViewModels.count);
              
            } failure:^(NSError * _Nullable error) {
                
            }];
        }
    }];
    
}

- (NSMutableArray<WXSTopicViewModel *> *)topicViewModels {
    if (_topicViewModels == nil) {
        _topicViewModels = [NSMutableArray array];
    }
    return _topicViewModels;
}
@end
