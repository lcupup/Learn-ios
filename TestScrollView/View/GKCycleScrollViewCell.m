//
//  GKCycleScrollViewCell.m
//  GKCycleScrollViewDemo
//
//  Created by QuintGao on 2019/9/15.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "GKCycleScrollViewCell.h"
@implementation GKCycleScrollViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
    
//        self.clipsToBounds = YES;
        self.backgroundColor = [UIColor greenColor];
//        [self addSubview:self.imageView];
//        [self addSubview:self.coverView];
        [self addSubview:self.label];
//        [self addSubview:self.button];
//        self.userInteractionEnabled = YES;
//        self.label.userInteractionEnabled = YES;
//        self.layer.masksToBounds = self.label.layer.masksToBounds = YES;
        
        UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
        tapGesture.delegate = self;
        [self addGestureRecognizer:tapGesture];
        

        
    }
    return self;
}

//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
//    if ([touch.view isDescendantOfView:self]) {
//        return NO;
//    } else {
//        return YES;
//    }
//}
//

- (void)handleTapGestureLabel:(UITapGestureRecognizer *)tap {
    NSInteger labelTag = 0x11111111 + self.tag;
    if (_didCellLabelClick) {
        _didCellLabelClick(labelTag);
    }
}

- (void)handleTapGesture:(UITapGestureRecognizer *)tap {
    !self.didCellClick ? : self.didCellClick(self.tag);
}

- (void)setupCellFrame:(CGRect)frame {
//    if (CGRectEqualToRect(self.imageView.frame, frame)) return;
//    self.label.frame = CGRectMake(0, 50, frame.size.width, 100);
//    self.imageView.frame = frame;
//    self.coverView.frame = frame;
}

#pragma mark - 懒加载
//- (UIImageView *)imageView {
//    if (!_imageView) {
//        _imageView = [UIImageView new];
//    }
//    return _imageView;
//}

- (UILabel *)label{
    if (!_label) {
        _label = [UILabel new];
        _label.frame = CGRectMake(0, 50, 200 ,100);
        _label.textColor = [UIColor blackColor];
        _label.backgroundColor = [UIColor blueColor];
        _label.userInteractionEnabled = YES;
        UITapGestureRecognizer * tapGestureLabel = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGestureLabel:)];
        tapGestureLabel.delegate = self;
        [_label addGestureRecognizer:tapGestureLabel];
    }
    return _label;
}

- (UIButton *)button {
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.frame = CGRectMake(0, 50, 200 ,100);
        _button.backgroundColor = [UIColor blueColor];
        _button.userInteractionEnabled = YES;
        [_button setTitle:@"我是标题" forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

- (void)buttonClick {
    NSLog(@"btn");
}


//- (UIView *)coverView {
//    if (!_coverView) {
//        _coverView = [UIView new];
//        _coverView.backgroundColor = [UIColor blackColor];
//        _coverView.userInteractionEnabled = YES;
//    }
//    return _coverView;
//}

@end
