//
//  WXSNewsModel.m
//  WXSparkApp
//
//  Created by 王旭 on 2019/4/26.
//  Copyright © 2019 王旭. All rights reserved.
//

#import "WXSNewsModel.h"

@implementation WXSNewsModel

+ (instancetype)modelWithDictionary:(NSDictionary *)dic {
    WXSNewsModel *model = [[WXSNewsModel alloc] initWithDictionary:dic];
    return model;
}

- (instancetype)initWithDictionary:(NSDictionary *)dic {
    if (self = [super init]) {
        self.link = dic[@"link"];
        self.source = dic[@"source"];
        self.digest = dic[@"digest"];
       // [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

@end
