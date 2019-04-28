//
//  WXSUser.h
//  WXSparkApp
//
//  Created by 王旭 on 2019/4/28.
//  Copyright © 2019 王旭. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WXSHeader.h"

NS_ASSUME_NONNULL_BEGIN

@interface WXSUser : NSObject
/**id**/
@property (nonatomic ,copy) NSString *ID;
/**用户名**/
@property (nonatomic ,copy) NSString *userName;
/**用户性别**/
@property (nonatomic ,copy) NSString *sex;
/**图片url**/
@property (nonatomic ,strong) NSURL *profile_image;
/**
 是否是vip
 */
@property (nonatomic ,assign) BOOL is_vip;
/**
 <#Description#>
 */
@property (nonatomic ,copy) NSString *person_page;
@property (nonatomic ,assign ,readonly) WXSUserSex sexSex;


@end

NS_ASSUME_NONNULL_END
