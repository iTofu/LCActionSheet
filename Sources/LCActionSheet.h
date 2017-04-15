//
//  LCActionSheet.h
//  LCActionSheet
//
//  Created by Leo on 2015/4/27.
//
//  Copyright (c) 2015-2017 Leo <leodaxia@gmail.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.


#import <UIKit/UIKit.h>
#import "LCActionSheetConfig.h"


@class LCActionSheet;


NS_ASSUME_NONNULL_BEGIN

#pragma mark - LCActionSheet Block

/**
 Handle click button.
 */
typedef void(^LCActionSheetClickedHandle)(LCActionSheet *actionSheet, NSInteger buttonIndex);

/**
 Handle action sheet will present.
 */
typedef void(^LCActionSheetWillPresentHandle)(LCActionSheet *actionSheet);
/**
 Handle action sheet did present.
 */
typedef void(^LCActionSheetDidPresentHandle)(LCActionSheet *actionSheet);

/**
 Handle action sheet will dismiss.
 */
typedef void(^LCActionSheetWillDismissHandle)(LCActionSheet *actionSheet, NSInteger buttonIndex);
/**
 Handle action sheet did dismiss.
 */
typedef void(^LCActionSheetDidDismissHandle)(LCActionSheet *actionSheet, NSInteger buttonIndex);


#pragma mark - LCActionSheet Delegate

@protocol LCActionSheetDelegate <NSObject>

@optional

/**
 Handle click button.
 */
- (void)actionSheet:(LCActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex;

/**
 Handle action sheet will present.
 */
- (void)willPresentActionSheet:(LCActionSheet *)actionSheet;
/**
 Handle action sheet did present.
 */
- (void)didPresentActionSheet:(LCActionSheet *)actionSheet;

/**
 Handle action sheet will dismiss.
 */
- (void)actionSheet:(LCActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex;
/**
 Handle action sheet did dismiss.
 */
- (void)actionSheet:(LCActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex;

@end


#pragma mark - LCActionSheet

@interface LCActionSheet : UIView


#pragma mark - Properties

/**
 Title.
 */
@property (nullable, nonatomic, copy) NSString *title;

/**
 Cancel button's title.
 */
@property (nullable, nonatomic, copy) NSString *cancelButtonTitle;

/**
 Cancel button's index.
 */
@property (nonatomic, assign, readonly) NSInteger cancelButtonIndex;

/**
 LCActionSheet's delegate.
 */
@property (nullable, nonatomic, weak) id<LCActionSheetDelegate> delegate;

/**
 Deprecated, use `destructiveButtonIndexSet` instead.
 */
@property (nullable, nonatomic, strong) NSSet<NSNumber *> *redButtonIndexSet __deprecated_msg("Property deprecated. Use `destructiveButtonIndexSet`");

/**
 All destructive buttons' set. You should give it the `NSNumber` type items.
 */
@property (nullable, nonatomic, strong) NSSet<NSNumber *> *destructiveButtonIndexSet;

/**
 Destructive button's color. Default is RGB(255, 10, 10).
 */
@property (nonatomic, strong) UIColor *destructiveButtonColor;

/**
 Title's color. Default is `[UIColor blackColor]`.
 */
@property (nonatomic, strong) UIColor *titleColor;
/**
 Buttons' color, without destructive buttons. Default is `[UIColor blackColor]`.
 */
@property (nonatomic, strong) UIColor *buttonColor;
/**
 Title's font. Default is `[UIFont systemFontOfSize:14.0f]`.
 */
@property (nonatomic, strong) UIFont *titleFont;
/**
 All buttons' font. Default is `[UIFont systemFontOfSize:18.0f]`.
 */
@property (nonatomic, strong) UIFont *buttonFont;
/**
 All buttons' height. Default is 49.0f;
 */
@property (nonatomic, assign) CGFloat buttonHeight;

/**
 If buttons' bottom view can scrolling. Default is NO.
 */
@property (nonatomic, assign, getter=canScrolling) BOOL scrolling;

/**
 Visible buttons' count. You have to set `scrolling = YES` if you want to set it.
 */
@property (nonatomic, assign) CGFloat visibleButtonCount;

/**
 Animation duration. Default is 0.3 seconds.
 */
@property (nonatomic, assign) CGFloat animationDuration;

/**
 Opacity of dark background. Default is 0.3f.
 */
@property (nonatomic, assign) CGFloat darkOpacity;

/**
 If you can tap darkView to dismiss. Defalut is NO, you can tap dardView to dismiss.
 */
@property (nonatomic, assign) BOOL darkViewNoTaped;

/**
 Clear blur effect. Default is NO, don't clear blur effect.
 */
@property (nonatomic, assign) BOOL unBlur;

/**
 Style of blur effect. Default is `UIBlurEffectStyleExtraLight`. iOS 8.0 +
 */
@property (nonatomic, assign) UIBlurEffectStyle blurEffectStyle;

/**
 Title's edge insets. Default is `UIEdgeInsetsMake(15.0f, 15.0f, 15.0f, 15.0f)`.
 */
@property (nonatomic, assign) UIEdgeInsets titleEdgeInsets;

/**
 Cell's separator color. Default is `RGBA(170/255.0f, 170/255.0f, 170/255.0f, 0.5f)`.
 */
@property (nonatomic, strong) UIColor *separatorColor;


/**
 LCActionSheet clicked handle.
 */
@property (nullable, nonatomic, copy) LCActionSheetClickedHandle     clickedHandle;
/**
 LCActionSheet will present handle.
 */
@property (nullable, nonatomic, copy) LCActionSheetWillPresentHandle willPresentHandle;
/**
 LCActionSheet did present handle.
 */
@property (nullable, nonatomic, copy) LCActionSheetDidPresentHandle  didPresentHandle;
/**
 LCActionSheet will dismiss handle.
 */
@property (nullable, nonatomic, copy) LCActionSheetWillDismissHandle willDismissHandle;
/**
 LCActionSheet did dismiss handle.
 */
@property (nullable, nonatomic, copy) LCActionSheetDidDismissHandle  didDismissHandle;


#pragma mark - Methods

#pragma mark Delegate

/**
 Initialize an instance of LCActionSheet (Delegate).

 @param title             title
 @param delegate          delegate
 @param cancelButtonTitle cancelButtonTitle
 @param otherButtonTitles otherButtonTitles
 
 @return An instance of LCActionSheet.
 */
+ (instancetype)sheetWithTitle:(nullable NSString *)title
                      delegate:(nullable id<LCActionSheetDelegate>)delegate
             cancelButtonTitle:(nullable NSString *)cancelButtonTitle
             otherButtonTitles:(nullable NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;

/**
 Initialize an instance of LCActionSheet with title array (Delegate).

 @param title                 title
 @param delegate              delegate
 @param cancelButtonTitle     cancelButtonTitle
 @param otherButtonTitleArray otherButtonTitleArray
 
 @return An instance of LCActionSheet.
 */
+ (instancetype)sheetWithTitle:(nullable NSString *)title
                      delegate:(nullable id<LCActionSheetDelegate>)delegate
             cancelButtonTitle:(nullable NSString *)cancelButtonTitle
         otherButtonTitleArray:(nullable NSArray<NSString *> *)otherButtonTitleArray;

/**
 Initialize an instance of LCActionSheet (Delegate).

 @param title             title
 @param delegate          delegate
 @param cancelButtonTitle cancelButtonTitle
 @param otherButtonTitles otherButtonTitles
 
 @return An instance of LCActionSheet.
 */
- (instancetype)initWithTitle:(nullable NSString *)title
                     delegate:(nullable id<LCActionSheetDelegate>)delegate
            cancelButtonTitle:(nullable NSString *)cancelButtonTitle
            otherButtonTitles:(nullable NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;

/**
 Initialize an instance of LCActionSheet with title array (Delegate).

 @param title                 title
 @param delegate              delegate
 @param cancelButtonTitle     cancelButtonTitle
 @param otherButtonTitleArray otherButtonTitleArray
 
 @return An instance of LCActionSheet.
 */
- (instancetype)initWithTitle:(nullable NSString *)title
                     delegate:(nullable id<LCActionSheetDelegate>)delegate
            cancelButtonTitle:(nullable NSString *)cancelButtonTitle
        otherButtonTitleArray:(nullable NSArray<NSString *> *)otherButtonTitleArray;


#pragma mark Block

/**
 Initialize an instance of LCActionSheet (Block).

 @param title             title
 @param cancelButtonTitle cancelButtonTitle
 @param clickedHandle     clickedHandle
 @param otherButtonTitles otherButtonTitles
 
 @return An instance of LCActionSheet.
 */
+ (instancetype)sheetWithTitle:(nullable NSString *)title
             cancelButtonTitle:(nullable NSString *)cancelButtonTitle
                       clicked:(nullable LCActionSheetClickedHandle)clickedHandle
             otherButtonTitles:(nullable NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;

/**
 Initialize an instance of LCActionSheet with title array (Block).

 @param title                 title
 @param cancelButtonTitle     cancelButtonTitle
 @param clickedHandle         clickedHandle
 @param otherButtonTitleArray otherButtonTitleArray
 
 @return An instance of LCActionSheet.
 */
+ (instancetype)sheetWithTitle:(nullable NSString *)title
             cancelButtonTitle:(nullable NSString *)cancelButtonTitle
                       clicked:(nullable LCActionSheetClickedHandle)clickedHandle
         otherButtonTitleArray:(nullable NSArray<NSString *> *)otherButtonTitleArray;

/**
 Initialize an instance of LCActionSheet (Block).

 @param title             title
 @param cancelButtonTitle cancelButtonTitle
 @param clickedHandle     clickedHandle
 @param otherButtonTitles otherButtonTitles
 
 @return An instance of LCActionSheet.
 */
- (instancetype)initWithTitle:(nullable NSString *)title
            cancelButtonTitle:(nullable NSString *)cancelButtonTitle
                      clicked:(nullable LCActionSheetClickedHandle)clickedHandle
            otherButtonTitles:(nullable NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;

/**
 Initialize an instance of LCActionSheet with title array (Block).

 @param title                 title
 @param cancelButtonTitle     cancelButtonTitle
 @param clickedHandle         clickedHandle
 @param otherButtonTitleArray otherButtonTitleArray
 
 @return An instance of LCActionSheet.
 */
- (instancetype)initWithTitle:(nullable NSString *)title
            cancelButtonTitle:(nullable NSString *)cancelButtonTitle
                      clicked:(nullable LCActionSheetClickedHandle)clickedHandle
        otherButtonTitleArray:(nullable NSArray<NSString *> *)otherButtonTitleArray;


#pragma mark Append & Show

/**
 Append buttons with titles.

 @param buttonTitles buttonTitles
 */
- (void)appendButtonTitles:(nullable NSString *)buttonTitles, ... NS_REQUIRES_NIL_TERMINATION;

/**
 Show the instance of LCActionSheet.
 */
- (void)show;

@end

NS_ASSUME_NONNULL_END

