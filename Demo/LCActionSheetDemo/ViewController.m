//
//  ViewController.m
//  LCActionSheetDemo
//
//  Created by Leo on 16/7/15.
//  Copyright © 2016年 Leo（https://LeoDev.me）. All rights reserved.
//

#import "ViewController.h"
#import <LCActionSheet/LCActionSheet.h>
#import <LCActionSheet/UIDevice+LCActionSheet.h>
#import <Masonry/Masonry.h>
//#import <JGProgressHUD/JGProgressHUD.h>

#define KEY_WINDOW  [UIApplication sharedApplication].keyWindow

@interface ViewController () <UIAlertViewDelegate, LCActionSheetDelegate>

@end

@implementation ViewController

//- (BOOL)prefersStatusBarHidden {
//    return YES;
//}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITextField *textField = [[UITextField alloc] init];
    textField.leftViewMode = UITextFieldViewModeAlways;
    textField.leftView = ({
        UIView *view = [[UIView alloc] init];
        view.frame = CGRectMake(0, 0, 8.0, 0);
        view;
    });
    textField.placeholder = @"Tap screen to hide keyboard..";
    textField.backgroundColor = [UIColor whiteColor];
    textField.layer.cornerRadius = 4.0;
    textField.layer.shadowColor = [UIColor blackColor].CGColor;
    textField.layer.shadowRadius = 2;
    textField.layer.shadowOpacity = 0.3;
    textField.layer.shadowOffset = CGSizeMake(0, 1.2);
    [self.view addSubview:textField];
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10.0);
        make.right.equalTo(self.view).offset(-10.0);
        make.top.equalTo(self.view).offset(30.0 + ([[UIDevice currentDevice] lc_isX] ? 14.0 : 0));
        make.height.offset(44.0);
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
//    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
//    [UIApplication sharedApplication].statusBarHidden = YES;
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    NSLog(@"App's keyWindow: %p", KEY_WINDOW);
}

- (IBAction)showDefaultActionSheet {
    LCActionSheet *actionSheet = [LCActionSheet sheetWithTitle:@""
                                                      delegate:self
                                             cancelButtonTitle:@"Cancel"
                                             otherButtonTitles:@"Button 1", nil];

//    NSMutableIndexSet *indexSet = [[NSMutableIndexSet alloc] init];
//    [indexSet addIndex:1];
//    [indexSet addIndex:2];
//    actionSheet.destructiveButtonIndexSet = indexSet;
//    actionSheet.destructiveButtonColor    = [UIColor blueColor];
//    actionSheet.destructiveButtonIndexSet = indexSet;
//    [actionSheet setButtonHeight:64];
//    [actionSheet setSeparatorColor:[UIColor clearColor]];
//    [actionSheet setTintColor:UIColor.blackColor];
//    [actionSheet setButtonColor:[UIColor whiteColor]];
//    [actionSheet setButtonBgColor:[UIColor blackColor]];
//    [actionSheet setDestructiveButtonColor:[UIColor blackColor]];
//    [actionSheet setCancelButtonColor:[UIColor blackColor]];
//
//    [actionSheet setButtonFont:font];
//    [actionSheet setButtonCornerRadius:3];

    [actionSheet show];
}

- (IBAction)showCustomActionSheet {
    LCActionSheet *actionSheet     = [[LCActionSheet alloc] initWithTitle:nil
                                                                 delegate:self
                                                        cancelButtonTitle:@"Cancel"
                                                        otherButtonTitles:@"Button 1", @"Button 2", @"Button 3", @"This is a very very very very very very long button title~", @"Button 5", nil];
    actionSheet.title              = @"This is a very very very very very very very very very very very very very very very very very very very very very very very very very very very long title~";
    actionSheet.cancelButtonTitle  = @"Close";
    [actionSheet appendButtonsWithTitles:@"Button 6", @"Button 7", nil];
    actionSheet.titleColor         = [UIColor orangeColor];
    actionSheet.buttonColor        = [UIColor greenColor];
    actionSheet.titleFont          = [UIFont boldSystemFontOfSize:15.0f];
    actionSheet.buttonFont         = [UIFont boldSystemFontOfSize:15.0f];
    actionSheet.buttonHeight       = 60.0f;
    actionSheet.scrolling          = YES;
    actionSheet.visibleButtonCount = 3.6f;
    actionSheet.darkViewNoTaped    = YES;
    actionSheet.unBlur             = YES;
    
    // V 2.1.0+ Use `destructiveButtonIndexSet` instead `redButtonIndexSet`.
    NSMutableIndexSet *indexSet = [[NSMutableIndexSet alloc] init];
    [indexSet addIndex:0];
    [indexSet addIndex:2];
    actionSheet.destructiveButtonIndexSet = indexSet;
    actionSheet.destructiveButtonColor    = [UIColor blueColor];
    
    // V 2.7.0+
    actionSheet.titleEdgeInsets = UIEdgeInsetsMake(10, 20, 30, 40);
    
    // V 2.7.1+
    actionSheet.separatorColor = [UIColor orangeColor];
    
    // V 3.1.0+
    actionSheet.autoHideWhenDeviceRotated = YES;
  
    // V 3.2.4+
    actionSheet.numberOfTitleLines = 2;
  
    [actionSheet show];
}

- (IBAction)showBlockActionSheet {
//    LCActionSheetConfig *config = LCActionSheetConfig.config;
//    config.buttonColor = [UIColor orangeColor];
    
    LCActionSheet *actionSheet = [LCActionSheet sheetWithTitle:@"Block LCActionSheet" cancelButtonTitle:@"Cancel" clicked:^(LCActionSheet *actionSheet, NSInteger buttonIndex) {
        
        NSLog(@"clickedButtonAtIndex: %d, keyWindow: %p", (int)buttonIndex, KEY_WINDOW);
        
    } otherButtonTitles:@"Button 1", @"Button 2", @"Button 3", @"Button 4", @"Button 5", @"Button 6", nil];
    
    // actionSheet.blurEffectStyle = UIBlurEffectStyleLight;
    
    actionSheet.scrolling          = YES;
    actionSheet.visibleButtonCount = 3.6f;
    
    actionSheet.willPresentHandler = ^(LCActionSheet *actionSheet) {
        NSLog(@"willPresentActionSheet, keyWindow: %p", KEY_WINDOW);
    };
    
    actionSheet.didPresentHandler = ^(LCActionSheet *actionSheet) {
        NSLog(@"didPresentActionSheet, keyWindow: %p", KEY_WINDOW);
    };
    
    actionSheet.willDismissHandler = ^(LCActionSheet *actionSheet, NSInteger buttonIndex) {
        NSLog(@"willDismissWithButtonIndex: %d, keyWindow: %p", (int)buttonIndex, KEY_WINDOW);
    };
    
    actionSheet.didDismissHandler = ^(LCActionSheet *actionSheet, NSInteger buttonIndex) {
        NSLog(@"didDismissWithButtonIndex: %d, keyWindow: %p", (int)buttonIndex, KEY_WINDOW);
    };
    
    [actionSheet show];
    
    
    // Append buttons methods
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2.0f * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
//        [actionSheet appendButtonWithTitle:@"WoW" atIndex:7];
        
        NSMutableIndexSet *set = [[NSMutableIndexSet alloc] init];
        [set addIndex:1];
        [set addIndex:2];
        [actionSheet appendButtonsWithTitles:@[@"Hello", @"World"] atIndexes:set];
    });
}

- (IBAction)onChangeStyleAction {
    UIFont *font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:16.0f];
    
    [LCActionSheetConfig.config setButtonHeight:64];
    [LCActionSheetConfig.config setSeparatorColor:[UIColor clearColor]];
    [LCActionSheetConfig.config setButtonColor:[UIColor whiteColor]];
    [LCActionSheetConfig.config setButtonBgColor:[UIColor blackColor]];
    [LCActionSheetConfig.config setButtonCornerRadius:3];
    [LCActionSheetConfig.config setCancelButtonColor:[UIColor blackColor]];
//    [LCActionSheetConfig.config setButtonEdgeInsets:UIEdgeInsetsMake(10, 20, 0, 20)];
    [LCActionSheetConfig.config setButtonFont:font];
    
    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = [UIColor lightGrayColor];
    label.alpha = 0;
    label.text = @"🤜🏻🤛🏻";
    label.textAlignment = NSTextAlignmentCenter;
    label.layer.cornerRadius = 8.0;
    label.layer.masksToBounds = YES;
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(150.0, 50.0));
    }];
    
    [UIView animateWithDuration:0.2 animations:^{
        label.alpha = 1.0;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 delay:2.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            label.alpha = 0;
        } completion:^(BOOL finished) {
            [label removeFromSuperview];
        }];
    }];
}

#pragma mark - LCActionSheet Delegate

- (void)actionSheet:(LCActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"clickedButtonAtIndex: %d, keyWindow: %p", (int)buttonIndex, KEY_WINDOW);
}

- (void)willPresentActionSheet:(LCActionSheet *)actionSheet {
    NSLog(@"willPresentActionSheet, keyWindow: %p", KEY_WINDOW);
}

- (void)didPresentActionSheet:(LCActionSheet *)actionSheet {
    NSLog(@"didPresentActionSheet, keyWindow: %p", KEY_WINDOW);
}

- (void)actionSheet:(LCActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex {
    NSLog(@"willDismissWithButtonIndex: %d, keyWindow: %p", (int)buttonIndex, KEY_WINDOW);
}

- (void)actionSheet:(LCActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
    NSLog(@"didDismissWithButtonIndex: %d, keyWindow: %p", (int)buttonIndex, KEY_WINDOW);
}

@end
