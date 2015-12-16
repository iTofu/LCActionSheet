//
//  Created by 刘超 on 15/4/26.
//  Copyright (c) 2015年 Leo. All rights reserved.
//
//  Email:  leoios@sina.com
//  GitHub: http://github.com/LeoiOS
//  如有问题或建议请给我发 Email, 或在该项目的 GitHub 主页 Issues 我, 谢谢:)
//
//  V 1.1.1

#import <UIKit/UIKit.h>

@class LCActionSheet;

typedef void(^LCActionSheetBlock)(NSInteger buttonIndex);

@protocol LCActionSheetDelegate <NSObject>

@optional

/**
 *  点击了 buttonIndex处 的按钮
 */
- (void)actionSheet:(LCActionSheet *)actionSheet didClickedButtonAtIndex:(NSInteger)buttonIndex;

@end

@interface LCActionSheet : UIView

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger redButtonIndex;

@property (nonatomic, copy) LCActionSheetBlock clickedBlock;

/**
 *  localized cancel text. Default is "取消"
 */
@property (nonatomic, strong) NSString *cancelText;

/**
 *  Default is [UIFont systemFontOfSize:18];
 */
@property (nonatomic, strong) UIFont *textFont;

/**
 *  Default is Black
 */
@property (nonatomic, strong) UIColor *textColor;

#pragma mark - Delegate Way

/**
 *  返回一个 ActionSheet 对象, 类方法
 *
 *  @param title          提示标题
 *  @param buttonTitles   所有按钮的标题
 *  @param redButtonIndex 红色按钮的index
 *  @param delegate       代理
 *
 *  Tip: 如果没有红色按钮, redButtonIndex 给 `-1` 即可
 */
+ (instancetype)sheetWithTitle:(NSString *)title
                  buttonTitles:(NSArray *)buttonTitles
                redButtonIndex:(NSInteger)redButtonIndex
                      delegate:(id<LCActionSheetDelegate>)delegate;

/**
 *  返回一个 ActionSheet 对象, 实例方法
 *
 *  @param title          提示标题
 *  @param buttonTitles   所有按钮的标题
 *  @param redButtonIndex 红色按钮的index
 *  @param delegate       代理
 *
 *  Tip: 如果没有红色按钮, redButtonIndex 给 `-1` 即可
 */
- (instancetype)initWithTitle:(NSString *)title
                 buttonTitles:(NSArray *)buttonTitles
               redButtonIndex:(NSInteger)redButtonIndex
                     delegate:(id<LCActionSheetDelegate>)delegate;




#pragma mark - Block Way

/**
 *  返回一个 ActionSheet 对象, 类方法
 *
 *  @param title          提示标题
 *  @param buttonTitles   所有按钮的标题
 *  @param redButtonIndex 红色按钮的index
 *  @param clicked        点击按钮的 block 回调
 *
 *  Tip: 如果没有红色按钮, redButtonIndex 给 `-1` 即可
 */
+ (instancetype)sheetWithTitle:(NSString *)title
                  buttonTitles:(NSArray *)buttonTitles
                redButtonIndex:(NSInteger)redButtonIndex
                       clicked:(LCActionSheetBlock)clicked;

/**
 *  返回一个 ActionSheet 对象, 实例方法
 *
 *  @param title          提示标题
 *  @param buttonTitles   所有按钮的标题
 *  @param redButtonIndex 红色按钮的index
 *  @param clicked        点击按钮的 block 回调
 *
 *  Tip: 如果没有红色按钮, redButtonIndex 给 `-1` 即可
 */
- (instancetype)initWithTitle:(NSString *)title
                 buttonTitles:(NSArray *)buttonTitles
               redButtonIndex:(NSInteger)redButtonIndex
                      clicked:(LCActionSheetBlock)clicked;


#pragma mark - Custom Way

/**
 *  Add a button with callback block
 *
 *  @param button
 *  @param block
 */
- (void) addButtonTitle:(NSString*)button;


#pragma mark - Show

/**
 *  显示 ActionSheet
 */
- (void)show;

@end
