//
//  WXSBaseRequest.h
//  WXSparkApp
//
//  Created by 王旭 on 2019/4/23.
//  Copyright © 2019 王旭. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WXSBaseResponse;

typedef void(^BaseResponse)(WXSBaseResponse * _Nullable response);

NS_ASSUME_NONNULL_BEGIN

@interface WXSBaseRequest : NSObject

- (void)GET:(NSString *)URLString paramters:(id)paramters completion:(BaseResponse)complition;

- (void)POST:(NSString *)URLString paramters:(id)parmaters completion:(BaseResponse)completion;

@end

NS_ASSUME_NONNULL_END
