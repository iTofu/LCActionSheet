//
//  LCActionSheetCell.h
//  LCActionSheet
//
//  Created by Leo on 2016/7/15.
//  Copyright © 2016年 Leo（http://LeoDev.me）. All rights reserved.
//

#import <UIKit/UIKit.h>


#define LC_ACTION_SHEET_CELL_NO_HIDDE_LINE_TAG  100
#define LC_ACTION_SHEET_CELL_HIDDE_LINE_TAG     101

#define LC_ACTION_SHEET_CELL_LINE_COLOR         LC_ACTION_SHEET_COLOR_A(170, 170, 170, 0.5f)


@interface LCActionSheetCell : UITableViewCell

/**
 *  Title label.
 */
@property (nonatomic, weak) UILabel *titleLabel;

/**
 *  Line.
 */
@property (nonatomic, weak) UIView *lineView;

@end
