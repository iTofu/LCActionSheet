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
    LCActionSheet* sheet = [[LCActionSheet alloc] init];
    
    float version = [[[UIDevice currentDevice] systemVersion] floatValue];
    
    if (version < 8.0) {
        
        [sheet addButtonTitle:@"iOS 7.x"];
        
    } else {
        
        [sheet addButtonTitle:@"iOS 8+"];
    }
    
    sheet.clickedBlock = ^(NSInteger buttonIndex) {
        
        NSLog(@"Hello %ld!", (long)buttonIndex);
    };
    
    [sheet show];
    
    //    [[[UIActionSheet alloc] initWithTitle:@"A very very very very very very very very very very very very very very long title" delegate:nil cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"OK" otherButtonTitles:@"haha", @"2333", nil] showInView:self.view];
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
