//
//  WXSHeader.h
//  WXSparkApp
//
//  Created by 王旭 on 2019/4/23.
//  Copyright © 2019 王旭. All rights reserved.
//

typedef NS_ENUM(NSInteger ,WXSTopicType) {
    WXSTopicTypeAll = 1,
    WXSTopicTypePicture = 10,
    WXSTopicTypeWords = 29,
    WXSTopicTypeVoice = 31,
    WXSTopicTypeVideo = 41,
};

typedef NS_ENUM(NSInteger, WXSUserSex) {
    WXSUserSexFemale = 1, //女
    WXSUserSexMale = 0, // 男
};

/**
 *  百思不得姐的api
 */
UIKIT_EXTERN NSString *const WXSBaiSiJieHTTPAPI;



/**
 *  用户的性别, 服务器返回字段
 */
UIKIT_EXTERN NSString *const WXSUserSexFemaleStr;

/**
 *  用户的性别, 服务器返回字段
 */
UIKIT_EXTERN NSString *const WXSUserSexMaleStr;
