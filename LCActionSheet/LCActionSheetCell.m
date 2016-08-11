//
//  LCActionSheetCell.m
//  LCActionSheetDemo
//
//  Created by Leo on 16/7/15.
//  Copyright © 2016年 Leo（http://LeoDev.me）. All rights reserved.
//

#import "LCActionSheetCell.h"

@interface LCActionSheetCell ()

/**
 *  Highlighted View.
 */
@property (nonatomic, weak) UIImageView *highlightedView;

@end

@implementation LCActionSheetCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.clipsToBounds = YES;
        self.backgroundColor = [UIColor clearColor];
        
        NSString *bundlePath = [[NSBundle bundleForClass:self.class] pathForResource:@"LCActionSheet" ofType:@"bundle"];
        
        NSString *highlightedPath = [bundlePath stringByAppendingPathComponent:@"bgImage_HL@2x.png"];
        UIImage *highlightedImage = [UIImage imageWithContentsOfFile:highlightedPath];
        
        NSString *linePath = [bundlePath stringByAppendingPathComponent:@"cellLine@2x.png"];
        UIImage *lineImage = [UIImage imageWithContentsOfFile:linePath];
        
        UIImageView *highlightedView  = [[UIImageView alloc] init];
        highlightedView.image         = highlightedImage;
        highlightedView.clipsToBounds = YES;
        highlightedView.hidden        = YES;
        [self addSubview:highlightedView];
        self.highlightedView = highlightedView;
        
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:titleLabel];
        self.titleLabel = titleLabel;
        
        UIImageView *lineView  = [[UIImageView alloc] init];
        lineView.image         = lineImage;
        lineView.contentMode   = UIViewContentModeTop;
        lineView.clipsToBounds = YES;
        [self addSubview:lineView];
        self.lineView = lineView;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.highlightedView.frame = self.bounds;
    self.titleLabel.frame      = self.bounds;
    self.lineView.frame        = CGRectMake(0, 0, self.bounds.size.width, 1.0f);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
//    if (self.tag != LC_ACTION_SHEET_CELL_TAG_INTERVAL) {
//        self.lineView.hidden = highlighted;
//    }
    
    self.highlightedView.hidden = !highlighted;
}

@end
