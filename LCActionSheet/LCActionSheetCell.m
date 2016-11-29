//
//  LCActionSheetCell.m
//  LCActionSheet
//
//  Created by Leo on 2016/7/15.
//  Copyright © 2016年 Leo（http://LeoDev.me）. All rights reserved.
//

#import "LCActionSheetCell.h"
#import "Masonry.h"

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
        
        NSString *bundlePath =
        [[NSBundle bundleForClass:self.class] pathForResource:@"LCActionSheet"
                                                       ofType:@"bundle"];
        
        NSString *highlightedPath = [bundlePath stringByAppendingPathComponent:@"bgImage_HL@2x.png"];
        UIImage *highlightedImage = [UIImage imageWithContentsOfFile:highlightedPath];
        
        NSString *linePath = [bundlePath stringByAppendingPathComponent:@"cellLine@2x.png"];
        UIImage *lineImage = [UIImage imageWithContentsOfFile:linePath];
        
        UIImageView *highlightedView  = [[UIImageView alloc] init];
        highlightedView.image         = highlightedImage;
        highlightedView.clipsToBounds = YES;
        highlightedView.hidden        = YES;
        [self.contentView addSubview:highlightedView];
        self.highlightedView = highlightedView;
        [highlightedView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
        
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:titleLabel];
        self.titleLabel = titleLabel;
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
        
        UIImageView *lineView  = [[UIImageView alloc] init];
        lineView.image         = lineImage;
        lineView.contentMode   = UIViewContentModeTop;
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
//    if (self.tag != LC_ACTION_SHEET_CELL_TAG_INTERVAL) {
//        self.lineView.hidden = highlighted;
//    }
    
    self.highlightedView.hidden = !highlighted;
}

@end
