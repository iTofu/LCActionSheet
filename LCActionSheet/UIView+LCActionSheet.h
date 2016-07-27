//
//  UIView+LCActionSheet.h
//  LCActionSheetDemo
//
//  Created by 苑金仓 on 16/7/27.
//  Copyright © 2016年 Leo（http://LeoDev.me）. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LCActionSheet)

/**
 *  Add blur effect.
 *
 *  @param blurEffectStyle UIBlurEffectStyle
 *  @param addConstraints  addConstraints
 */
- (void)blurWithBlurEffectStyle:(UIBlurEffectStyle)blurEffectStyle andConstraints:(BOOL)addConstraints;

/**
 *  Clear blur effect.
 */
- (void)unBlur;

@end
