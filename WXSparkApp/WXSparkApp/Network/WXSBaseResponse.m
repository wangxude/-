//
//  WXSBaseResponse.m
//  WXSparkApp
//
//  Created by 王旭 on 2019/4/23.
//  Copyright © 2019 王旭. All rights reserved.
//

#import "WXSBaseResponse.h"

@implementation WXSBaseResponse

- (NSString *)description {
    return [NSString stringWithFormat:@"状态码:%ld---错误:%@---响应头:%@----响应体:%@",(long)self.statusCode,self.error,self.headers,self.responseObject];
}

- (void)setError:(NSError *)error {
    _error = error;
    self.statusCode = error.code;
    self.errorMsg = error.localizedDescription;
}
@end
