//
//  WXSRequestManger.h
//  WXSparkApp
//
//  Created by 王旭 on 2019/4/23.
//  Copyright © 2019 王旭. All rights reserved.
//

#import "AFHTTPSessionManager.h"
#import "WXSBaseResponse.h"
#import <AFNetworking.h>

typedef NSString WXSDataName;

typedef NS_ENUM(NSInteger ,WXSRequestMangerStatusCode) {
    //自定义错误码
    WXSRequestMangerStatusCodeCustomDemo = -10000,
};

typedef void(^BaseResopnse)(WXSBaseResponse *response);

NS_ASSUME_NONNULL_BEGIN

@interface WXSRequestManger : AFHTTPSessionManager

/**
 预处理返回的数据
 */
@property (nonatomic ,assign) BOOL isLocal;
/**
 https验证
 */
@property (nonatomic ,copy) NSString *cerFilePath;

/**
 本地数据模式

 @return 单例模式
 */
+ (instancetype)sharedManger;

//- (void)POST:(NSString *)urlString paramters:(id)parmaters completion:(BaseResponse)completion;
//
//- (void)GET:(NSString *)urlString parameters:(id)parameters completion:(BaseResponse)completion;


@end

NS_ASSUME_NONNULL_END
