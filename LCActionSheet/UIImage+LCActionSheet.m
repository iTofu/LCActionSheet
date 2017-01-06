//
//  UIImage+LCActionSheet.m
//  LCActionSheet
//
//  Created by Leo on 2016/11/29.
//  Copyright © 2016年 Leo（http://LeoDev.me）. All rights reserved.
//

#import "UIImage+LCActionSheet.h"

@implementation UIImage (LCActionSheet)

+ (instancetype)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 2.0f, 2.0f);
    
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
