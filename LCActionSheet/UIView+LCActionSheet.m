//
//  UIView+LCActionSheet.m
//  LCActionSheetDemo
//
//  Created by 苑金仓 on 16/7/27.
//  Copyright © 2016年 Leo（http://LeoDev.me）. All rights reserved.
//

static int LCActionSheetBlurViewTag = 666888;

#import "UIView+LCActionSheet.h"

@implementation UIView (LCActionSheet)

- (void)blurWithBlurEffectStyle:(UIBlurEffectStyle)blurEffectStyle andConstraints:(BOOL)addConstraints {
    if (!UIAccessibilityIsReduceTransparencyEnabled()) {
        UIBlurEffect *blurEffect           = [UIBlurEffect effectWithStyle:blurEffectStyle];
        UIVisualEffectView *blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        blurEffectView.tag                 = LCActionSheetBlurViewTag;
        blurEffectView.frame               = self.bounds;
        
        [self addSubview:blurEffectView];
        
        if (addConstraints) {
            [blurEffectView setTranslatesAutoresizingMaskIntoConstraints:NO];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:blurEffectView
                                                             attribute:NSLayoutAttributeTop
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self
                                                             attribute:NSLayoutAttributeTop
                                                            multiplier:1
                                                              constant:0]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:blurEffectView
                                                             attribute:NSLayoutAttributeBottom
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self
                                                             attribute:NSLayoutAttributeBottom
                                                            multiplier:1
                                                              constant:0]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:blurEffectView
                                                             attribute:NSLayoutAttributeLeading
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self
                                                             attribute:NSLayoutAttributeLeading
                                                            multiplier:1
                                                              constant:0]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:blurEffectView
                                                             attribute:NSLayoutAttributeTrailing
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self
                                                             attribute:NSLayoutAttributeTrailing
                                                            multiplier:1
                                                              constant:0]];
        }
    } else {
        self.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.7f];
    }
}

- (void)unBlur {
    for (UIView *childView in self.subviews) {
        if (childView.tag == LCActionSheetBlurViewTag && [childView isKindOfClass:[UIVisualEffectView class]]) {
            [childView removeFromSuperview];
        }
    }
}

@end
