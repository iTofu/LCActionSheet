//
//  LCActionSheet.h
//  LCActionSheetDemo
//
//  Created by Leo on 16/7/15.
//  Copyright © 2016年 Leo（http://LeoDev.me）. All rights reserved.
//
//  GitHub: http://github.com/iTofu
//  Mail:   mailto:devtip@163.com
//
//  V 2.3.1

#import <UIKit/UIKit.h>


@class LCActionSheet;


#pragma mark - LCActionSheet Block

typedef void(^LCActionSheetClickedBlock)(LCActionSheet *actionSheet, NSInteger buttonIndex);

typedef void(^LCActionSheetWillPresentBlock)(LCActionSheet *actionSheet);
typedef void(^LCActionSheetDidPresentBlock)(LCActionSheet *actionSheet);

typedef void(^LCActionSheetWillDismissBlock)(LCActionSheet *actionSheet, NSInteger buttonIndex);
typedef void(^LCActionSheetDidDismissBlock)(LCActionSheet *actionSheet, NSInteger buttonIndex);


#pragma mark - LCActionSheet Delegate

@protocol LCActionSheetDelegate <NSObject>

@optional

- (void)actionSheet:(LCActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex;

- (void)willPresentActionSheet:(LCActionSheet *)actionSheet;
- (void)didPresentActionSheet:(LCActionSheet *)actionSheet;

- (void)actionSheet:(LCActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex;
- (void)actionSheet:(LCActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex;

@end


#pragma mark - LCActionSheet

@interface LCActionSheet : UIView


#pragma mark - Propreties

/**
 *  Title.
 */
@property (nonatomic, copy) NSString *title;

/**
 *  Cancel button's title.
 */
@property (nonatomic, copy) NSString *cancelButtonTitle;

/**
 *  LCActionSheet's delegate.
 */
@property (nonatomic, weak) id<LCActionSheetDelegate> delegate;

/**
 *  Deprecated, use `destructiveButtonIndexSet` instead.
 */
@property (nonatomic, strong) NSSet *redButtonIndexSet NS_DEPRECATED_IOS(2_0, 2_0, "Use destructiveButtonIndexSet");

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
 *  If you can tap darkView to dissmiss. Defalut is NO.
 */
@property (nonatomic, assign) BOOL darkViewNoTaped;

/**
 *  Clear blur effect. Default is NO, don't clear blur effect.
 */
@property (nonatomic, assign) BOOL unBlur;


@property (nonatomic, copy) LCActionSheetClickedBlock clickedBlock;
@property (nonatomic, copy) LCActionSheetWillPresentBlock willPresentBlock;
@property (nonatomic, copy) LCActionSheetDidPresentBlock didPresentBlock;
@property (nonatomic, copy) LCActionSheetWillDismissBlock willDismissBlock;
@property (nonatomic, copy) LCActionSheetDidDismissBlock didDismissBlock;


#pragma mark - Methods

#pragma mark Delegate

/**
 *  Initialize an instance of LCActionSheet.
 *
 *  @param title             title
 *  @param delegate          delegate
 *  @param cancelButtonTitle cancelButtonTitle
 *  @param otherButtonTitles otherButtonTitles
 *
 *  @return An instance of LCActionSheet.
 */
+ (instancetype)sheetWithTitle:(NSString *)title
                      delegate:(id<LCActionSheetDelegate>)delegate
             cancelButtonTitle:(NSString *)cancelButtonTitle
             otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;

/**
 *  Initialize an instance of LCActionSheet.
 *
 *  @param title                 title
 *  @param delegate              delegate
 *  @param cancelButtonTitle     cancelButtonTitle
 *  @param otherButtonTitleArray otherButtonTitleArray
 *
 *  @return An instance of LCActionSheet.
 */
+ (instancetype)sheetWithTitle:(NSString *)title
                      delegate:(id<LCActionSheetDelegate>)delegate
             cancelButtonTitle:(NSString *)cancelButtonTitle
         otherButtonTitleArray:(NSArray *)otherButtonTitleArray;

/**
 *  Initialize an instance of LCActionSheet.
 *
 *  @param title             title
 *  @param delegate          delegate
 *  @param cancelButtonTitle cancelButtonTitle
 *  @param otherButtonTitles otherButtonTitles
 *
 *  @return An instance of LCActionSheet.
 */
- (instancetype)initWithTitle:(NSString *)title
                     delegate:(id<LCActionSheetDelegate>)delegate
            cancelButtonTitle:(NSString *)cancelButtonTitle
            otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;

/**
 *  Initialize an instance of LCActionSheet.
 *
 *  @param title                 title
 *  @param delegate              delegate
 *  @param cancelButtonTitle     cancelButtonTitle
 *  @param otherButtonTitleArray otherButtonTitleArray
 *
 *  @return An instance of LCActionSheet.
 */
- (instancetype)initWithTitle:(NSString *)title
                     delegate:(id<LCActionSheetDelegate>)delegate
            cancelButtonTitle:(NSString *)cancelButtonTitle
        otherButtonTitleArray:(NSArray *)otherButtonTitleArray;


#pragma mark Block

/**
 *  Initialize an instance of LCActionSheet.
 *
 *  @param title             title
 *  @param cancelButtonTitle cancelButtonTitle
 *  @param clickedBlock      clickedBlock
 *  @param otherButtonTitles otherButtonTitles
 *
 *  @return An instance of LCActionSheet.
 */
+ (instancetype)sheetWithTitle:(NSString *)title
             cancelButtonTitle:(NSString *)cancelButtonTitle
                       clicked:(LCActionSheetClickedBlock)clickedBlock
             otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;

/**
 *  Initialize an instance of LCActionSheet.
 *
 *  @param title                 title
 *  @param delegate              delegate
 *  @param clickedBlock          clickedBlock
 *  @param otherButtonTitleArray otherButtonTitleArray
 *
 *  @return An instance of LCActionSheet.
 */
+ (instancetype)sheetWithTitle:(NSString *)title
             cancelButtonTitle:(NSString *)cancelButtonTitle
                       clicked:(LCActionSheetClickedBlock)clickedBlock
         otherButtonTitleArray:(NSArray *)otherButtonTitleArray;

/**
 *  Initialize an instance of LCActionSheet.
 *
 *  @param title             title
 *  @param cancelButtonTitle cancelButtonTitle
 *  @param clickedBlock      clickedBlock
 *  @param otherButtonTitles otherButtonTitles
 *
 *  @return An instance of LCActionSheet.
 */
- (instancetype)initWithTitle:(NSString *)title
            cancelButtonTitle:(NSString *)cancelButtonTitle
                      clicked:(LCActionSheetClickedBlock)clickedBlock
            otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;

/**
 *  Initialize an instance of LCActionSheet.
 *
 *  @param title                 title
 *  @param delegate              delegate
 *  @param clickedBlock          clickedBlock
 *  @param otherButtonTitleArray otherButtonTitleArray
 *
 *  @return An instance of LCActionSheet.
 */
- (instancetype)initWithTitle:(NSString *)title
            cancelButtonTitle:(NSString *)cancelButtonTitle
                      clicked:(LCActionSheetClickedBlock)clickedBlock
        otherButtonTitleArray:(NSArray *)otherButtonTitleArray;

/**
 *  Append buttons with titles.
 *
 *  @param buttonTitles buttonTitles
 */
- (void)appendButtonTitles:(NSString *)buttonTitles, ... NS_REQUIRES_NIL_TERMINATION;

/**
 *  Show the instance of LCActionSheet.
 */
- (void)show;

@end

