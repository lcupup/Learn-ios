//
//  GKCycleScrollViewCell.h
//  GKCycleScrollViewDemo
//
//  Created by QuintGao on 2019/9/15.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GKCycleScrollViewCell;

typedef void(^cellClickBlock)(NSInteger index);
typedef void(^cellLabelClickBlock)(NSInteger index);

@interface GKCycleScrollViewCell : UIView <UIGestureRecognizerDelegate>

/**
 图片视图
 */
@property (nonatomic, strong) UIImageView   *imageView;

@property (nonatomic,strong) UILabel * label;
@property (nonatomic,strong) UIButton *button;

/**
 遮罩视图，用于处理透明度渐变
 */
@property (nonatomic, strong) UIView        *coverView;

/**
 cell点击回调
 */
@property (nonatomic, copy) cellClickBlock  didCellClick;
@property (nonatomic, copy) cellLabelClickBlock  didCellLabelClick;

- (void)setupCellFrame:(CGRect)frame;

@end
