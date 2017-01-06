//
//  LCActionSheetConfig.m
//  LCActionSheet
//
//  Created by Leo on 2016/11/29.
//  Copyright © 2016年 Leo（http://LeoDev.me）. All rights reserved.
//

#import "LCActionSheetConfig.h"


#define LC_ACTION_SHEET_BUTTON_HEIGHT       49.0f

#define LC_ACTION_SHEET_RED_COLOR           LC_ACTION_SHEET_COLOR(255, 10, 10)

#define LC_ACTION_SHEET_TITLE_FONT          [UIFont systemFontOfSize:14.0f]

#define LC_ACTION_SHEET_BUTTON_FONT         [UIFont systemFontOfSize:18.0f]

#define LC_ACTION_SHEET_ANIMATION_DURATION  0.3f

#define LC_ACTION_SHEET_DARK_OPACITY        0.3f


@implementation LCActionSheetConfig

+ (instancetype)shared {
    static id _shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shared = [[self alloc] init];
    });
    return _shared;
}

- (instancetype)init {
    if (self = [super init]) {
        self.titleFont              = LC_ACTION_SHEET_TITLE_FONT;
        self.buttonFont             = LC_ACTION_SHEET_BUTTON_FONT;
        self.destructiveButtonColor = LC_ACTION_SHEET_RED_COLOR;
        self.titleColor             = LC_ACTION_SHEET_COLOR(111, 111, 111);
        self.buttonColor            = [UIColor blackColor];

        self.buttonHeight           = LC_ACTION_SHEET_BUTTON_HEIGHT;
        self.animationDuration      = LC_ACTION_SHEET_ANIMATION_DURATION;
        self.darkOpacity            = LC_ACTION_SHEET_DARK_OPACITY;

        self.titleEdgeInsets        = UIEdgeInsetsMake(15.0f, 15.0f, 15.0f, 15.0f);

        self.separatorColor         = LC_ACTION_SHEET_COLOR_A(150, 150, 150, 0.3f);
    }
    return self;
}

- (NSInteger)cancelButtonIndex {
    return 0;
}

@end
