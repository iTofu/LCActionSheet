//
//  NSSet+LCActionSheet.m
//  LCActionSheet
//
//  Created by Leo on 2016/11/28.
//  Copyright © 2016年 Leo（http://LeoDev.me）. All rights reserved.
//

#import "NSSet+LCActionSheet.h"

@implementation NSSet (LCActionSheet)

- (BOOL)lc_contains:(long)num {
    BOOL contains = NO;
    for (NSNumber *setNum in self) {
        if ([setNum longValue] == num) {
            contains = YES;
            break;
        }
    }
    return contains;
}

@end
