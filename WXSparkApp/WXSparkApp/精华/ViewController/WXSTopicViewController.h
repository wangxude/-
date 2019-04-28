//
//  WXSTopicViewController.h
//  WXSparkApp
//
//  Created by 王旭 on 2019/4/23.
//  Copyright © 2019 王旭. All rights reserved.
//

#import "LMJRefreshTableViewController.h"
#import "WXSHeader.h"

NS_ASSUME_NONNULL_BEGIN

@interface WXSTopicViewController : LMJRefreshTableViewController

@property (nonatomic ,assign) WXSTopicType topicType;

@property (nonatomic ,copy) NSString *areaType;

@end

NS_ASSUME_NONNULL_END
