//
//  ViewController.m
//  LCActionSheetDemo
//
//  Created by 刘超 on 15/4/26.
//  Copyright (c) 2015年 Leo. All rights reserved.
//

#import "ViewController.h"
#import "LCActionSheet.h"

@interface ViewController () <LCActionSheetDelegate, UITableViewDelegate>

@end

@implementation ViewController

/** 注销 */
- (IBAction)logout {
    
    // 实例方法
    LCActionSheet *sheet = [[LCActionSheet alloc] initWithTitle:@"你确定要注销吗？"
                                                   buttonTitles:nil
                                                 redButtonIndex:0
                                                       delegate:self];
    [sheet addButtonTitle:@"注销"];
    
//    sheet.animationDuration = 1.0f;
//    sheet.backgroundOpacity = 1.0f;
    
    [sheet show];
}

/** 修改头像 */
- (IBAction)changeHeader {
    
    // 类方法
    LCActionSheet *sheet = [LCActionSheet sheetWithTitle:@"一个超长超长超长超长超长超长超长超长超长超长超长超长超长超长超长的标题" buttonTitles:@[@"拍照", @"从相册选择"] redButtonIndex:-1 clicked:^(NSInteger buttonIndex) {
        
        NSLog(@"> Block way -> Clicked Index: %ld", (long)buttonIndex);
    }];
    
    [sheet show];
}

#pragma mark - LCActionSheet 代理方法

- (void)actionSheet:(LCActionSheet *)actionSheet didClickedButtonAtIndex:(NSInteger)buttonIndex {
    
    NSLog(@"> Delegate way -> Clicked Index: %ld", (long)buttonIndex);
}

@end
