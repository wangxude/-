//
//  WXSNewsModel.h
//  WXSparkApp
//
//  Created by 王旭 on 2019/4/26.
//  Copyright © 2019 王旭. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WXSNewsModel : NSObject
//名称
@property (nonatomic ,copy) NSString *source;
//摘要
@property (nonatomic ,copy) NSString *digest;
//链接
@property (nonatomic ,copy) NSString *link;

+ (instancetype)modelWithDictionary:(NSDictionary *)dic;

- (instancetype)initWithDictionary:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
