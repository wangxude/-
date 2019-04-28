//
//  WXSRequestManger.m
//  WXSparkApp
//
//  Created by 王旭 on 2019/4/23.
//  Copyright © 2019 王旭. All rights reserved.
//

#import "WXSRequestManger.h"

@implementation WXSRequestManger

//+ (void)POST:(NSString *)UrlString parameters:(id)paramters success:(SuccessBlock)success failure:(FailureBlock)failure {
//    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
//    session.requestSerializer.timeoutInterval = 60.0;//请求超时时间是60秒
//    [session POST:UrlString parameters:paramters progress:^(NSProgress * _Nonnull uploadProgress) {
//
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        if (success) {
//            success(responseObject);
//        }
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        if (error) {
//            failure(error);
//        }
//    }];
//}
#pragma mark - POST_GET
//- (void)POST:(NSString *)urlString paramters:(id)parmaters completion:(id)completion {
//    [self request:@"POST" url:urlString parameters:parmaters completion:completion];
//}
//
//- (void)GET:(NSString *)urlString parameters:(id)parameters completion:(id)completion {
//    [self request:@"GET" url:urlString parameters:parameters completion:completion];
//}

//- (void)request:(NSString *)method url:(NSString *)urlString parameters:(id)parameters completion:(BaseResopnse)completion {
//    if (self.isLocal) {
//        [self requsetLocal:urlString completion:completion];
//    }
//}

#pragma mark - 加载本地数据
//static NSString *jsonFileDirectory = @"LMJLocalJsons";
//- (void)requsetLocal:(NSString *)urlString completion:(BaseResopnse)completion {
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        NSError *fileError = nil;
//        NSError *jsonError = nil;
//        
//        NSString *jsonFile = [NSString stringWithFormat:@"%@/%@",jsonFileDirectory,[urlString lastPathComponent]];
//        NSData *jsonData = [NSData dataWithContentsOfFile:jsonFile options:0 error:&fileError];
//        if (fileError) {
//            [self];
//        }
//        else {
//            
//        }
//    });
//}

@end
