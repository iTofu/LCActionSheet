//
//  LCActionSheetCell.h
//  LCActionSheetDemo
//
//  Created by Leo on 16/7/15.
//  Copyright © 2016年 Leo（http://LeoDev.me）. All rights reserved.
//

#import <UIKit/UIKit.h>

#define LC_ACTION_SHEET_CELL_TAG_INTERVAL   100

@interface LCActionSheetCell : UITableViewCell

@property (nonatomic, weak) UILabel *titleLabel;
@property (nonatomic, weak) UIImageView *lineView;

@end
