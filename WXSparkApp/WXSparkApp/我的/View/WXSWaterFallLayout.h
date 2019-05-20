//
//  WXSWaterFallLayout.h
//  WXSparkApp
//
//  Created by 王旭 on 2019/5/20.
//  Copyright © 2019 王旭. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WXSWaterFallLayout;

typedef CGFloat(^itemHeightBlock)(CGFloat itemWidth, NSIndexPath * _Nonnull indexPath);

@protocol WXSWaterFallLayoutDelegate <NSObject>

- (CGFloat)waterFallLayoutDelegate:(WXSWaterFallLayout *_Nonnull)waterFallLayout
           itemHeightWithItemWidth:(CGFloat)item
                       atIndexPath:(NSIndexPath *_Nonnull)indexPath;

@end

NS_ASSUME_NONNULL_BEGIN

@interface WXSWaterFallLayout : UICollectionViewLayout
/**
 列数
 */
@property (nonatomic ,assign) NSInteger columnNumber;
/**
 列间距
 */
@property (nonatomic, assign) CGFloat columnSpacing;
/**
 行间距
 */
@property (nonatomic ,assign) CGFloat rowSpacing;

@property (nonatomic ,assign) UIEdgeInsets sectionEdgeInsets;

@property (nonatomic ,weak) id<WXSWaterFallLayoutDelegate> delegate;

@property (nonatomic ,strong) itemHeightBlock block;

+ (instancetype)waterFallLayoutWithColumnCount:(NSInteger)columnCount;
- (instancetype)initWithColumnCount:(NSInteger)columnCount;
- (void)setColumnSpacing:(NSInteger)columnSpacing rowSpacing:(NSInteger)rowSpacing
            sectionInset:(UIEdgeInsets)section;


@end

NS_ASSUME_NONNULL_END
