//
//  LCActionSheetConfig.m
//  LCActionSheet
//
//  Created by Leo on 2016/11/29.
//
//  Copyright (c) 2015-2019 Leo <leodaxia@gmail.com>
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


#import "LCActionSheetConfig.h"


#define kLCActionSheetButtonHeight              49.0f

#define kLCActionSheetRedColor                  kLCActionSheetColor(254, 67, 37)

#define kLCActionSheetTitleFont                 [UIFont systemFontOfSize:14.0f]

#define kLCActionSheetButtonFont                [UIFont systemFontOfSize:18.0f]

#define kLCActionSheetAnimationDuration         0.3f

#define kLCActionSheetDarkOpacity               0.3f

#define kLCActionSheetBlurBgColorNormal         [[UIColor whiteColor] colorWithAlphaComponent:0.5]
//#define kLCActionSheetBlurBgColorHighlighted    [[UIColor whiteColor] colorWithAlphaComponent:0.1]


@implementation LCActionSheetConfig

+ (LCActionSheetConfig *)config {
    static id _config = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _config = [[self alloc] initSharedInstance];
    });
    return _config;
}

+ (instancetype)shared {
    return self.config;
}

- (instancetype)initSharedInstance {
    if (self = [super init]) {
        self.titleFont                = kLCActionSheetTitleFont;
        self.buttonFont               = kLCActionSheetButtonFont;
        self.destructiveButtonColor   = kLCActionSheetRedColor;
        self.titleColor               = kLCActionSheetColor(111.0f, 111.0f, 111.0f);
        self.buttonColor              = [UIColor blackColor];
        
        self.buttonHeight             = kLCActionSheetButtonHeight;
        self.animationDuration        = kLCActionSheetAnimationDuration;
        self.darkOpacity              = kLCActionSheetDarkOpacity;
        
        self.titleEdgeInsets          = UIEdgeInsetsMake(15.0f, 15.0f, 15.0f, 15.0f);
        self.buttonEdgeInsets         = UIEdgeInsetsMake(8.0, 15.0, 8.0, 15.0);
//        self.actionSheetEdgeInsets    = UIEdgeInsetsMake(0.0f, 0.0f, 0.0f, 0.0f);
        
        self.separatorColor           = kLCActionSheetColorA(150.0f, 150.0f, 150.0f, 0.3f);
        self.blurBackgroundColor      = kLCActionSheetBlurBgColorNormal;
        
        self.cancelButtonColor        = self.buttonColor;
        self.cancelButtonBgColor      = [UIColor clearColor];
        self.buttonBgColor            = [UIColor clearColor];
        self.destructiveButtonBgColor = [UIColor clearColor];
        self.buttonCornerRadius       = 0.0f;
    }
    return self;
}

- (instancetype)init {
    return LCActionSheetConfig.config;
}

- (NSInteger)cancelButtonIndex {
    return 0;
}

@end
