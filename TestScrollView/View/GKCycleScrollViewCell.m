//
//  GKCycleScrollViewCell.m
//  GKCycleScrollViewDemo
//
//  Created by QuintGao on 2019/9/15.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "GKCycleScrollViewCell.h"
#import <NSLogger/NSLogger.h>
@implementation GKCycleScrollViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.clipsToBounds = YES;
        self.backgroundColor=[UIColor greenColor];
        [self addSubview:self.imageView];
        [self addSubview:self.coverView];
        [self addSubview:self.label];
        
        UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
        [self addGestureRecognizer:tapGesture];
        
        UITapGestureRecognizer * tapGestureLabel = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGestureLabel:)];
        [self addGestureRecognizer:tapGestureLabel];
       
    }
    return self;
}

- (void)handleTapGestureLabel:(UITapGestureRecognizer *)tap {
    
    if (_didCellLabelClick) {
        _didCellLabelClick(self.label.tag);
    }
}

- (void)handleTapGesture:(UITapGestureRecognizer *)tap {
    LoggerApp(1,@"点击le");
    !self.didCellClick ? : self.didCellClick(self.tag);
}

- (void)setupCellFrame:(CGRect)frame {
    if (CGRectEqualToRect(self.imageView.frame, frame)) return;
    self.label.frame=frame;
    self.imageView.frame = frame;
    self.coverView.frame = frame;
}

#pragma mark - 懒加载
- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [UIImageView new];
    }
    return _imageView;
}

-(UILabel *) label{
    if (!_label) {
        _label=[UILabel new];
        _label.textColor=[UIColor blackColor];
       
    }
    return _label;
}


- (UIView *)coverView {
    if (!_coverView) {
        _coverView = [UIView new];
        _coverView.backgroundColor = [UIColor blackColor];
        _coverView.userInteractionEnabled = NO;
    }
    return _coverView;
}

@end
