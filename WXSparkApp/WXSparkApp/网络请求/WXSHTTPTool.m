//
//  WXSHTTPTool.m
//  WXSparkApp
//
//  Created by 王旭 on 2019/4/26.
//  Copyright © 2019 王旭. All rights reserved.
//

#import "WXSHTTPTool.h"

@implementation WXSHTTPTool

+ (void)POST:(NSString *)UrlString parameters:(id)paramters success:(SuccessBlock)success failure:(FailureBlock)failure {
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    session.requestSerializer.timeoutInterval = 60.0;//请求超时时间是60秒
    [session POST:UrlString parameters:paramters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
            failure(error);
        }
    }];
}

@end
