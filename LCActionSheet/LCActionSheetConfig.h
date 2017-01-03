//
//  LCActionSheetConfig.h
//  LCActionSheet
//
//  Created by Leo on 2016/11/29.
//  Copyright © 2016年 Leo（http://LeoDev.me）. All rights reserved.
//

#import <UIKit/UIKit.h>


#define LC_ACTION_SHEET_COLOR(r, g, b)      LC_ACTION_SHEET_COLOR_A(r, g, b, 1.0f)
#define LC_ACTION_SHEET_COLOR_A(r, g, b, a) [UIColor colorWithRed:(r)/255.0f\
                                                            green:(g)/255.0f\
                                                             blue:(b)/255.0f\
                                                            alpha:a]


@interface LCActionSheetConfig : NSObject

/**
 *  Title.
 */
@property (nonatomic, copy) NSString *title;

/**
 *  Cancel button's title.
 */
@property (nonatomic, copy) NSString *cancelButtonTitle;

/**
 *  Cancel button's index.
 */
@property (nonatomic, assign, readonly) NSInteger cancelButtonIndex;

/**
 *  All destructive buttons' set. You should give it the `NSNumber` type items.
 */
@property (nonatomic, strong) NSSet *destructiveButtonIndexSet;

/**
 *  Destructive button's color. Default is RGB(255, 10, 10).
 */
@property (nonatomic, strong) UIColor *destructiveButtonColor;

/**
 *  Title's color. Default is `[UIColor blackColor]`.
 */
@property (nonatomic, strong) UIColor *titleColor;
/**
 *  Buttons' color, without destructive buttons. Default is `[UIColor blackColor]`.
 */
@property (nonatomic, strong) UIColor *buttonColor;
/**
 *  Title's font. Default is `[UIFont systemFontOfSize:14.0f]`.
 */
@property (nonatomic, strong) UIFont *titleFont;
/**
 *  All buttons' font. Default is `[UIFont systemFontOfSize:18.0f]`.
 */
@property (nonatomic, strong) UIFont *buttonFont;
/**
 *  All buttons' height. Default is 49.0f;
 */
@property (nonatomic, assign) CGFloat buttonHeight;

/**
 *  If buttons' bottom view can scrolling. Default is NO.
 */
@property (nonatomic, assign, getter=canScrolling) BOOL scrolling;

/**
 *  Visible buttons' count. You have to set `scrolling = YES` if you want to set it.
 */
@property (nonatomic, assign) CGFloat visibleButtonCount;

/**
 *  Animation duration. Default is 0.3 seconds.
 */
@property (nonatomic, assign) CGFloat animationDuration;

/**
 *  Opacity of dark background. Default is 0.3f.
 */
@property (nonatomic, assign) CGFloat darkOpacity;

/**
 *  If you can tap darkView to dismiss. Defalut is NO, you can tap dardView to dismiss.
 */
@property (nonatomic, assign) BOOL darkViewNoTaped;

/**
 *  Clear blur effect. Default is NO, don't clear blur effect.
 */
@property (nonatomic, assign) BOOL unBlur;

/**
 *  Style of blur effect. Default is `UIBlurEffectStyleExtraLight`. iOS 8.0 +
 */
@property (nonatomic, assign) UIBlurEffectStyle blurEffectStyle;

/**
 *  Title's edge insets. Default is `UIEdgeInsetsMake(15.0f, 15.0f, 15.0f, 15.0f)`.
 */
@property (nonatomic, assign) UIEdgeInsets titleEdgeInsets;

/**
 *  Cell's separator color. Default is `RGBA(170/255.0f, 170/255.0f, 170/255.0f, 0.5f)`.
 */
@property (nonatomic, strong) UIColor *separatorColor;


/**
 LCActionSheetConfig instance.
 */
+ (instancetype)shared;

@end
