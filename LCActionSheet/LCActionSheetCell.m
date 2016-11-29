//
//  LCActionSheetCell.m
//  LCActionSheet
//
//  Created by Leo on 2016/7/15.
//  Copyright © 2016年 Leo（http://LeoDev.me）. All rights reserved.
//

#import "LCActionSheetCell.h"
#import "Masonry.h"
#import "LCActionSheetConfig.h"

@interface LCActionSheetCell ()

/**
 *  Highlighted View.
 */
@property (nonatomic, weak) UIView *highlightedView;

@end

@implementation LCActionSheetCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.clipsToBounds = YES;
        self.backgroundColor = [UIColor clearColor];
        
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:titleLabel];
        self.titleLabel = titleLabel;
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
        
        UIView *highlightedView  = [[UIView alloc] init];
        highlightedView.backgroundColor = LC_ACTION_SHEET_CELL_LINE_COLOR;
        highlightedView.clipsToBounds = YES;
        highlightedView.hidden        = YES;
        [self.contentView addSubview:highlightedView];
        self.highlightedView = highlightedView;
        [highlightedView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
        
        UIView *lineView  = [[UIView alloc] init];
        lineView.backgroundColor = LC_ACTION_SHEET_CELL_LINE_COLOR;
        lineView.contentMode   = UIViewContentModeBottom;
        lineView.clipsToBounds = YES;
        [self.contentView addSubview:lineView];
        self.lineView = lineView;
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self.contentView);
            make.height.equalTo(@0.5f);
        }];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    if (self.tag == LC_ACTION_SHEET_CELL_HIDDE_LINE_TAG) {
        self.lineView.hidden = YES;
    } else {
        self.lineView.hidden = highlighted;
    }
    
    self.highlightedView.hidden = !highlighted;
}

@end
