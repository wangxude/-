//
//  WXSTopicTopComment.h
//  WXSparkApp
//
//  Created by 王旭 on 2019/4/28.
//  Copyright © 2019 王旭. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WXSUser.h"

NS_ASSUME_NONNULL_BEGIN

@interface WXSTopicTopComment : NSObject

/** <#digest#> */
@property (nonatomic, copy) NSString *data_id;

/** <#digest#> */
@property (nonatomic, copy) NSString *status;

/** <#digest#> */
@property (nonatomic, copy) NSString *ID;

/** <#digest#> */
@property (nonatomic, copy) NSString *content;

/** <#digest#> */
@property (nonatomic, copy) NSString *ctime;

/** <#digest#> */
@property (assign, nonatomic) NSInteger like_count;

/** <#digest#> */
@property (nonatomic, strong) NSURL *voiceUrl;

/** <#digest#> */
@property (assign, nonatomic) NSTimeInterval voicetime;

/** <#digest#> */
@property (nonatomic, copy) NSString *total_cmt_like_count;

/** <#digest#> */
@property (nonatomic, assign) WXSTopicType cmt_type;


/** <#digest#> */
@property (nonatomic, strong) WXSUser *user;

@end

NS_ASSUME_NONNULL_END
