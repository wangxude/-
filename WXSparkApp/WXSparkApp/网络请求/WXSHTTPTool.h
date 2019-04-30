//
//  WXSHTTPTool.h
//  WXSparkApp
//
//  Created by 王旭 on 2019/4/26.
//  Copyright © 2019 王旭. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

typedef void(^SuccessBlock)(id _Nullable responseObject);
typedef void(^FailureBlock)(NSError * _Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface WXSHTTPTool : NSObject

/**
 请求

 @param UrlString 请求网址
 @param paramters 参数
 @param success 成功回调
 @param failure 失败回调
 */
- (void)POST:(NSString *)UrlString
        parameters:(id)paramters
        success:(SuccessBlock)success
        failure:(FailureBlock)failure;

@end

NS_ASSUME_NONNULL_END
