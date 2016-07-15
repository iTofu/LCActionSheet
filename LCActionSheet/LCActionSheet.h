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
//  V 2.0.0

#import <UIKit/UIKit.h>


@class LCActionSheet;

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
 *  All red buttons' set. You should give it the `NSNumber` type items.
 */
@property (nonatomic, strong) NSSet *redButtonIndexSet;

/**
 *  Title's color.
 */
@property (nonatomic, strong) UIColor *titleColor;
/**
 *  Buttons' color, without red buttons.
 */
@property (nonatomic, strong) UIColor *buttonColor;
/**
 *  Title's font.
 */
@property (nonatomic, strong) UIFont *titleFont;
/**
 *  All buttons' font.
 */
@property (nonatomic, strong) UIFont *buttonFont;
/**
 *  All buttons' height.
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


@property (nonatomic, copy) LCActionSheetClickedBlock clickedBlock;
@property (nonatomic, copy) LCActionSheetWillPresentBlock willPresentBlock;
@property (nonatomic, copy) LCActionSheetDidPresentBlock didPresentBlock;
@property (nonatomic, copy) LCActionSheetWillDismissBlock willDismissBlock;
@property (nonatomic, copy) LCActionSheetDidDismissBlock didDismissBlock;


#pragma mark - Methods

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

