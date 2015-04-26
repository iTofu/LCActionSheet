//
//  Created by 刘超 on 15/4/26.
//  Copyright (c) 2015年 Leo. All rights reserved.
//
//  Email:  leoios@sina.com
//  GitHub: http://github.com/LeoiOS
//  如有问题或建议请给我发Email, 或在该项目的GitHub主页lssues我, 谢谢:)
//

#import "LCActionSheet.h"

#define BUTTON_H 49.0f
#define SCREEN_SIZE [UIScreen mainScreen].bounds.size
#define LCColor(r, g, b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1.0f]

@interface LCActionSheet () {
    NSArray *_buttonTitles;
    UIView *_darkView;
    UIView *_bottomView;
}

@end

@implementation LCActionSheet

- (instancetype)initWithTitle:(NSString *)title buttonTitles:(NSArray *)titles redButtonIndex:(int)buttonIndex delegate:(id<LCActionSheetDelegate>)delegate {
    
    if (self = [super init]) {
        
        _delegate = delegate;
        
        // 暗黑色的view
        UIView *darkView = [[UIView alloc] init];
        darkView.userInteractionEnabled = YES;
        darkView.backgroundColor = LCColor(46, 49, 50);
        darkView.alpha = 0;
        darkView.frame = (CGRect){0, 0, SCREEN_SIZE};
        [self addSubview:darkView];
        _darkView = darkView;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss:)];
        [darkView addGestureRecognizer:tap];
        
        // 所有按钮的底部view
        UIView *bottomView = [[UIView alloc] init];
        bottomView.backgroundColor = LCColor(214, 214, 222);
        [self addSubview:bottomView];
        _bottomView = bottomView;
        
        if (title) {
            
            // 标题
            UILabel *label = [[UILabel alloc] init];
            label.text = title;
            label.font = [UIFont systemFontOfSize:13.0f];
            label.textColor = LCColor(111, 111, 111);
            label.backgroundColor = [UIColor whiteColor];
            label.textAlignment = NSTextAlignmentCenter;
            label.frame = CGRectMake(0, 0, SCREEN_SIZE.width, BUTTON_H);
            [bottomView addSubview:label];
        }
        
        if (titles.count) {
            
            _buttonTitles = titles;
            
            for (int i = 0; i < titles.count; i++) {
                
                // 所有按钮
                UIButton *btn = [[UIButton alloc] init];
                btn.tag = i;
                btn.backgroundColor = [UIColor whiteColor];
                btn.titleLabel.font = [UIFont systemFontOfSize:16.0f];
                [btn setTitle:titles[i] forState:UIControlStateNormal];
                UIColor *titleColor = nil;
                if (i == buttonIndex) {
                    titleColor = LCColor(255, 10, 10);
                } else {
                    titleColor = [UIColor blackColor] ;
                }
                [btn setTitleColor:titleColor forState:UIControlStateNormal];
                [btn setBackgroundImage:[UIImage imageNamed:@"bgImage_HL"] forState:UIControlStateHighlighted];
                [btn addTarget:self action:@selector(didClickBtn:) forControlEvents:UIControlEventTouchUpInside];
                CGFloat btnY = BUTTON_H * (i + (title ? 1 : 0));
                btn.frame = CGRectMake(0, btnY, SCREEN_SIZE.width, BUTTON_H);
                [bottomView addSubview:btn];
            }
            
            for (int i = 0; i < titles.count; i++) {
                
                // 所有线条
                UIImageView *line = [[UIImageView alloc] init];
                line.image = [UIImage imageNamed:@"cellLine"];
                line.contentMode = UIViewContentModeCenter;
                CGFloat lineY = (i + (title ? 1 : 0)) * BUTTON_H;
                line.frame = CGRectMake(0, lineY, SCREEN_SIZE.width, 1.0f);
                [bottomView addSubview:line];
            }
        }
        
        // 取消按钮
        UIButton *cancelBtn = [[UIButton alloc] init];
        cancelBtn.tag = titles.count;
        cancelBtn.backgroundColor = [UIColor whiteColor];
        cancelBtn.titleLabel.font = [UIFont systemFontOfSize:16.0f];
        [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [cancelBtn setBackgroundImage:[UIImage imageNamed:@"bgImage_HL"] forState:UIControlStateHighlighted];
        [cancelBtn addTarget:self action:@selector(didClickCancelBtn) forControlEvents:UIControlEventTouchUpInside];
        CGFloat btnY = BUTTON_H * (titles.count + (title ? 1 : 0)) + 5.0f;
        cancelBtn.frame = CGRectMake(0, btnY, SCREEN_SIZE.width, BUTTON_H);
        [bottomView addSubview:cancelBtn];
        
        CGFloat bottomH = (title ? BUTTON_H : 0) + BUTTON_H * titles.count + BUTTON_H + 5.0f;
        bottomView.frame = CGRectMake(0, SCREEN_SIZE.height, SCREEN_SIZE.width, bottomH);
        
        self.frame = (CGRect){0, 0, SCREEN_SIZE};
        [[UIApplication sharedApplication].keyWindow addSubview:self];
    }
    return self;
}

- (void)didClickBtn:(UIButton *)btn {
    
    [self dismiss:nil];
    
    if ([self.delegate respondsToSelector:@selector(actionSheet:didClickedButtonAtIndex:)]) {
        [self.delegate actionSheet:self didClickedButtonAtIndex:btn.tag];
    }
}

- (void)dismiss:(UITapGestureRecognizer *)tap {
    
    [UIView animateWithDuration:0.3f
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         
                         _darkView.alpha = 0;
                         _darkView.userInteractionEnabled = NO;
                         
                         CGRect frame = _bottomView.frame;
                         frame.origin.y += frame.size.height;
                         _bottomView.frame = frame;
                         
                     } completion:^(BOOL finished) {
                         
                         [self removeFromSuperview];
                     }];
}

- (void)didClickCancelBtn {
    
    [UIView animateWithDuration:0.3f
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         
                         _darkView.alpha = 0;
                         _darkView.userInteractionEnabled = NO;
                         
                         CGRect frame = _bottomView.frame;
                         frame.origin.y += frame.size.height;
                         _bottomView.frame = frame;
                         
                     } completion:^(BOOL finished) {
                         
                         [self removeFromSuperview];
                         if ([self.delegate respondsToSelector:@selector(actionSheet:didClickedButtonAtIndex:)]) {
                             [self.delegate actionSheet:self didClickedButtonAtIndex:_buttonTitles.count];
                         }
                     }];
}

- (void)show {
    
    [UIView animateWithDuration:0.3f
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         
                         _darkView.alpha = 0.4f;
                         _darkView.userInteractionEnabled = YES;
                         
                         CGRect frame = _bottomView.frame;
                         frame.origin.y -= frame.size.height;
                         _bottomView.frame = frame;
                         
                     } completion:nil];
}

@end
