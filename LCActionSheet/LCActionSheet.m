//
//  LCActionSheet.m
//  LCActionSheet
//
//  Created by Leo on 2015/4/27.
//  Copyright © 2016年 Leo（http://LeoDev.me）. All rights reserved.
//

#import "LCActionSheet.h"
#import "LCActionSheetCell.h"
#import "Masonry.h"
#import "NSSet+LCActionSheet.h"
#import "UIImage+LCActionSheet.h"


@interface LCActionSheet () <UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>

@property (nonatomic, strong) NSArray *otherButtonTitles;

@property (nonatomic, assign) CGSize titleTextSize;

@property (nonatomic, weak) UIView *bottomView;
@property (nonatomic, weak) UIVisualEffectView *blurEffectView;
@property (nonatomic, weak) UIView *darkView;
@property (nonatomic, weak) UILabel *titleLabel;
@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, weak) UIView *divisionView;
@property (nonatomic, weak) UIButton *cancelButton;

@property (nonatomic, weak) UIView *whiteBgView;

@property (nonatomic, weak) UIView *lineView;

@end

@implementation LCActionSheet

+ (instancetype)sheetWithTitle:(NSString *)title delegate:(id<LCActionSheetDelegate>)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ... {
    id eachObject;
    va_list argumentList;
    NSMutableArray *tempOtherButtonTitles = nil;
    if (otherButtonTitles) {
        tempOtherButtonTitles = [[NSMutableArray alloc] initWithObjects:otherButtonTitles, nil];
        va_start(argumentList, otherButtonTitles);
        while ((eachObject = va_arg(argumentList, id))) {
            [tempOtherButtonTitles addObject:eachObject];
        }
        va_end(argumentList);
    }
    return [[self alloc] initWithTitle:title
                              delegate:delegate
                     cancelButtonTitle:cancelButtonTitle
                 otherButtonTitleArray:tempOtherButtonTitles];
}

+ (instancetype)sheetWithTitle:(NSString *)title delegate:(id<LCActionSheetDelegate>)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitleArray:(NSArray *)otherButtonTitleArray {
    
    return [[self alloc] initWithTitle:title
                              delegate:delegate
                     cancelButtonTitle:cancelButtonTitle
                 otherButtonTitleArray:otherButtonTitleArray];
}

+ (instancetype)sheetWithTitle:(NSString *)title cancelButtonTitle:(NSString *)cancelButtonTitle clicked:(LCActionSheetClickedHandle)clickedHandle otherButtonTitles:(NSString *)otherButtonTitles, ... {
    id eachObject;
    va_list argumentList;
    NSMutableArray *tempOtherButtonTitles = nil;
    if (otherButtonTitles) {
        tempOtherButtonTitles = [[NSMutableArray alloc] initWithObjects:otherButtonTitles, nil];
        va_start(argumentList, otherButtonTitles);
        while ((eachObject = va_arg(argumentList, id))) {
            [tempOtherButtonTitles addObject:eachObject];
        }
        va_end(argumentList);
    }
    return [[self alloc] initWithTitle:title
                     cancelButtonTitle:cancelButtonTitle
                               clicked:clickedHandle
                 otherButtonTitleArray:tempOtherButtonTitles];
}

+ (instancetype)sheetWithTitle:(NSString *)title cancelButtonTitle:(NSString *)cancelButtonTitle clicked:(LCActionSheetClickedHandle)clickedHandle otherButtonTitleArray:(NSArray *)otherButtonTitleArray {
    
    return [[self alloc] initWithTitle:title
                     cancelButtonTitle:cancelButtonTitle
                               clicked:clickedHandle
                 otherButtonTitleArray:otherButtonTitleArray];
}

- (instancetype)initWithTitle:(NSString *)title delegate:(id<LCActionSheetDelegate>)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ... {
    if (self = [super init]) {
        [self config:[LCActionSheetConfig shared]];
        
        id eachObject;
        va_list argumentList;
        NSMutableArray *tempOtherButtonTitles = nil;
        if (otherButtonTitles) {
            tempOtherButtonTitles = [[NSMutableArray alloc] initWithObjects:otherButtonTitles, nil];
            va_start(argumentList, otherButtonTitles);
            while ((eachObject = va_arg(argumentList, id))) {
                [tempOtherButtonTitles addObject:eachObject];
            }
            va_end(argumentList);
        }
        
        self.title             = title;
        self.delegate          = delegate;
        self.cancelButtonTitle = cancelButtonTitle;
        self.otherButtonTitles = tempOtherButtonTitles;
        
        [self setupView];
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title cancelButtonTitle:(NSString *)cancelButtonTitle clicked:(LCActionSheetClickedHandle)clickedHandle otherButtonTitles:(NSString *)otherButtonTitles, ... {
    if (self = [super init]) {
        [self config:[LCActionSheetConfig shared]];
        
        id eachObject;
        va_list argumentList;
        NSMutableArray *tempOtherButtonTitles = nil;
        if (otherButtonTitles) {
            tempOtherButtonTitles = [[NSMutableArray alloc] initWithObjects:otherButtonTitles, nil];
            va_start(argumentList, otherButtonTitles);
            while ((eachObject = va_arg(argumentList, id))) {
                [tempOtherButtonTitles addObject:eachObject];
            }
            va_end(argumentList);
        }
        
        self.title             = title;
        self.cancelButtonTitle = cancelButtonTitle;
        self.clickedHandle     = clickedHandle;
        self.otherButtonTitles = tempOtherButtonTitles;
        
        [self setupView];
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title delegate:(id<LCActionSheetDelegate>)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitleArray:(NSArray *)otherButtonTitleArray {
    if (self = [super init]) {
        [self config:[LCActionSheetConfig shared]];
        
        self.title             = title;
        self.delegate          = delegate;
        self.cancelButtonTitle = cancelButtonTitle;
        self.otherButtonTitles = otherButtonTitleArray;
        
        [self setupView];
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title cancelButtonTitle:(NSString *)cancelButtonTitle clicked:(LCActionSheetClickedHandle)clickedHandle otherButtonTitleArray:(NSArray *)otherButtonTitleArray {
    if (self = [super init]) {
        [self config:[LCActionSheetConfig shared]];
        
        self.title             = title;
        self.cancelButtonTitle = cancelButtonTitle;
        self.clickedHandle     = clickedHandle;
        self.otherButtonTitles = otherButtonTitleArray;
        
        [self setupView];
    }
    return self;
}

- (instancetype)config:(LCActionSheetConfig *)config {
    _title                     = config.title;
    _cancelButtonTitle         = config.cancelButtonTitle;
    _destructiveButtonIndexSet = config.destructiveButtonIndexSet;
    _destructiveButtonColor    = config.destructiveButtonColor;
    _titleColor                = config.titleColor;
    _buttonColor               = config.buttonColor;
    _titleFont                 = config.titleFont;
    _buttonFont                = config.buttonFont;
    _buttonHeight              = config.buttonHeight;
    _scrolling                 = config.canScrolling;
    _visibleButtonCount        = config.visibleButtonCount;
    _animationDuration         = config.animationDuration;
    _darkOpacity               = config.darkOpacity;
    _darkViewNoTaped           = config.darkViewNoTaped;
    _unBlur                    = config.unBlur;
    _blurEffectStyle           = config.blurEffectStyle;
    _titleEdgeInsets           = config.titleEdgeInsets;
    _separatorColor            = config.separatorColor;
    
    return self;
}

- (void)setupView {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleDidChangeStatusBarOrientation)
                                                 name:UIApplicationDidChangeStatusBarOrientationNotification
                                               object:nil];
    
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:self];
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(keyWindow);
    }];
    
    UIView *bottomView = [[UIView alloc] init];
    [self addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        
        CGFloat height =
        (self.title.length > 0 ? self.titleTextSize.height + 2.0f + (self.titleEdgeInsets.top + self.titleEdgeInsets.bottom) : 0) +
        (self.otherButtonTitles.count > 0 ? (self.canScrolling ? MIN(self.visibleButtonCount, self.otherButtonTitles.count) : self.otherButtonTitles.count) * self.buttonHeight : 0) +
        (self.cancelButtonTitle.length > 0 ? 5.0f + self.buttonHeight : 0);
        
        make.height.equalTo(@(height));
        make.bottom.equalTo(self).offset(height);
    }];
    self.bottomView = bottomView;
    
    UIView *darkView                = [[UIView alloc] init];
    darkView.alpha                  = 0;
    darkView.userInteractionEnabled = NO;
    darkView.backgroundColor        = LC_ACTION_SHEET_COLOR(46, 49, 50);
    [self addSubview:darkView];
    [darkView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(self).priorityLow();
        make.bottom.equalTo(bottomView.mas_top);
    }];
    self.darkView = darkView;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(darkViewClicked)];
    [darkView addGestureRecognizer:tap];
    
    UIView *whiteBgView         = [[UIView alloc] init];
    whiteBgView.backgroundColor = [UIColor whiteColor];
    [bottomView addSubview:whiteBgView];
    [whiteBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(bottomView);
    }];
    self.whiteBgView = whiteBgView;
    
    if (!self.unBlur) {
        [self blurBottomBgView];
    } else {
        whiteBgView.hidden = NO;
    }
    
    UILabel *titleLabel      = [[UILabel alloc] init];
    titleLabel.text          = self.title;
    titleLabel.font          = self.titleFont;
    titleLabel.numberOfLines = 0;
    titleLabel.textColor     = self.titleColor;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [bottomView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bottomView).offset(self.title.length > 0 ? self.titleEdgeInsets.top : 0);
        make.left.equalTo(bottomView).offset(self.titleEdgeInsets.left);
        make.right.equalTo(bottomView).offset(-self.titleEdgeInsets.right);
        
        CGFloat height = self.title.length > 0 ? self.titleTextSize.height + 2.0f : 0;  // Prevent omit
        make.height.equalTo(@(height));
    }];
    self.titleLabel = titleLabel;
    
    UITableView *tableView    = [[UITableView alloc] init];
    tableView.backgroundColor = [UIColor clearColor];
    tableView.dataSource      = self;
    tableView.delegate        = self;
    [bottomView addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(bottomView);
        make.top.equalTo(titleLabel.mas_bottom).offset(self.title.length > 0 ? self.titleEdgeInsets.bottom : 0);
        
        CGFloat height = self.otherButtonTitles.count * self.buttonHeight;
        make.height.equalTo(@(height));
    }];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView = tableView;
    

    UIView *lineView  = [[UIView alloc] init];
    lineView.backgroundColor = self.separatorColor;
    lineView.contentMode   = UIViewContentModeBottom;
    lineView.clipsToBounds = YES;
    [bottomView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(bottomView);
        make.bottom.equalTo(tableView.mas_top);
        make.height.equalTo(@0.5f);
    }];
    self.lineView = lineView;
    
    self.lineView.hidden = !self.title || self.title.length == 0;
    
    
    UIView *divisionView         = [[UIView alloc] init];
    divisionView.alpha           = 0.3f;
    divisionView.backgroundColor = self.separatorColor;
    [bottomView addSubview:divisionView];
    [divisionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(bottomView);
        make.top.equalTo(tableView.mas_bottom);
        
        CGFloat height = self.cancelButtonTitle.length > 0 ? 5.0f : 0;
        make.height.equalTo(@(height));
    }];
    self.divisionView = divisionView;

    UIButton *cancelButton       = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelButton.backgroundColor = [UIColor clearColor];
    cancelButton.titleLabel.font = self.buttonFont;
    [cancelButton setTitle:self.cancelButtonTitle forState:UIControlStateNormal];
    [cancelButton setTitleColor:self.buttonColor forState:UIControlStateNormal];
    [cancelButton setBackgroundImage:[UIImage imageWithColor:self.separatorColor]
                            forState:UIControlStateHighlighted];
    [cancelButton addTarget:self
                     action:@selector(cancelButtonClicked)
           forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:cancelButton];
    [cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(bottomView);
        make.bottom.equalTo(bottomView);
        
        CGFloat height = self.cancelButtonTitle.length > 0 ? self.buttonHeight : 0;
        make.height.equalTo(@(height));
    }];
    self.cancelButton = cancelButton;
}

- (void)appendButtonTitles:(NSString *)buttonTitles, ... {
    id eachObject;
    va_list argumentList;
    NSMutableArray *tempButtonTitles = nil;
    if (buttonTitles) {
        tempButtonTitles = [[NSMutableArray alloc] initWithObjects:buttonTitles, nil];
        va_start(argumentList, buttonTitles);
        while ((eachObject = va_arg(argumentList, id))) {
            [tempButtonTitles addObject:eachObject];
        }
        va_end(argumentList);
    }
    
    self.otherButtonTitles = [self.otherButtonTitles arrayByAddingObjectsFromArray:tempButtonTitles];
    
    [self.tableView reloadData];
    [self updateBottomView];
    [self updateTableView];
}

- (void)handleDidChangeStatusBarOrientation {
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    if (orientation == UIInterfaceOrientationLandscapeRight || orientation ==UIInterfaceOrientationLandscapeLeft) {
        self.blurEffectView.contentMode = UIViewContentModeScaleAspectFill;
    } else {
        self.blurEffectView.contentMode = UIViewContentModeBottom;
    }
}

- (void)blurBottomBgView {
    self.whiteBgView.hidden = YES;
    
    if (!self.blurEffectView) {
        UIBlurEffect *blurEffect           = [UIBlurEffect effectWithStyle:self.blurEffectStyle];
        UIVisualEffectView *blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        [self.bottomView addSubview:blurEffectView];
        [blurEffectView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.bottomView);
        }];
        self.blurEffectView = blurEffectView;
        
        [self.bottomView sendSubviewToBack:blurEffectView];
    }
}

- (void)unBlurBottomBgView {
    self.whiteBgView.hidden = NO;
    
    if (self.blurEffectView) {
        [self.blurEffectView removeFromSuperview];
        self.blurEffectView = nil;
    }
}

#pragma mark - Setter & Getter

- (void)setTitle:(NSString *)title {
    _title = [title copy];
    
    self.titleLabel.text = title;
    
    [self updateTitleLabel];
    
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(self.title.length > 0 ? self.titleEdgeInsets.bottom : 0);
    }];
    
    self.lineView.hidden = !self.title || self.title.length == 0;
}

- (void)setCancelButtonTitle:(NSString *)cancelButtonTitle {
    _cancelButtonTitle = [cancelButtonTitle copy];
    
    [self.cancelButton setTitle:cancelButtonTitle forState:UIControlStateNormal];
    [self updateCancelButton];
}

- (void)setDestructiveButtonIndexSet:(NSSet *)destructiveButtonIndexSet {
    _destructiveButtonIndexSet = destructiveButtonIndexSet;
    
    if ([destructiveButtonIndexSet lc_contains:0]) {
        [self.cancelButton setTitleColor:self.destructiveButtonColor forState:UIControlStateNormal];
    } else {
        [self.cancelButton setTitleColor:self.buttonColor forState:UIControlStateNormal];
    }
    
    [self.tableView reloadData];
}

- (void)setRedButtonIndexSet:(NSSet *)redButtonIndexSet {
    self.destructiveButtonIndexSet = redButtonIndexSet;
}

- (NSSet *)redButtonIndexSet {
    return self.destructiveButtonIndexSet;
}

- (void)setUnBlur:(BOOL)unBlur {
    _unBlur = unBlur;
    
    if (unBlur) {
        [self unBlurBottomBgView];
    } else {
        [self blurBottomBgView];
    }
}

- (void)setBlurEffectStyle:(UIBlurEffectStyle)blurEffectStyle {
    _blurEffectStyle = blurEffectStyle;
    
    [self unBlurBottomBgView];
    [self blurBottomBgView];
}

- (void)setTitleFont:(UIFont *)aTitleFont {
    _titleFont = aTitleFont;
    
    self.titleLabel.font = aTitleFont;
    [self updateBottomView];
    [self updateTitleLabel];
}

- (void)setButtonFont:(UIFont *)aButtonFont {
    _buttonFont = aButtonFont;
    
    self.cancelButton.titleLabel.font = aButtonFont;
    [self.tableView reloadData];
}

- (void)setDestructiveButtonColor:(UIColor *)aDestructiveButtonColor {
    _destructiveButtonColor = aDestructiveButtonColor;
    
    if ([self.destructiveButtonIndexSet lc_contains:0]) {
        [self.cancelButton setTitleColor:self.destructiveButtonColor forState:UIControlStateNormal];
    } else {
        [self.cancelButton setTitleColor:self.buttonColor forState:UIControlStateNormal];
    }
    
    [self.tableView reloadData];
}

- (void)setTitleColor:(UIColor *)aTitleColor {
    _titleColor = aTitleColor;
    
    self.titleLabel.textColor = aTitleColor;
}

- (void)setButtonColor:(UIColor *)aButtonColor {
    _buttonColor = aButtonColor;
    
    [self.cancelButton setTitleColor:aButtonColor forState:UIControlStateNormal];
    [self.tableView reloadData];
}

- (void)setButtonHeight:(CGFloat)aButtonHeight {
    _buttonHeight = aButtonHeight;
    
    [self.tableView reloadData];
    [self updateBottomView];
    [self updateTableView];
    [self updateCancelButton];
}

- (NSInteger)cancelButtonIndex {
    return 0;
}

- (void)setScrolling:(BOOL)scrolling {
    _scrolling = scrolling;
    
    [self updateBottomView];
    [self updateTableView];
}

- (void)setVisibleButtonCount:(CGFloat)visibleButtonCount {
    _visibleButtonCount = visibleButtonCount;
    
    [self updateBottomView];
    [self updateTableView];
}

- (void)setTitleEdgeInsets:(UIEdgeInsets)titleEdgeInsets {
    _titleEdgeInsets = titleEdgeInsets;
    
    [self updateBottomView];
    [self updateTitleLabel];
    [self updateTableView];
}

- (void)setSeparatorColor:(UIColor *)separatorColor {
    _separatorColor = separatorColor;
    
    self.lineView.backgroundColor = separatorColor;
    self.divisionView.backgroundColor = separatorColor;
    [self.cancelButton setBackgroundImage:[UIImage imageWithColor:separatorColor]
                                 forState:UIControlStateHighlighted];
    [self.tableView reloadData];
}

- (CGSize)titleTextSize {
    CGSize size = CGSizeMake([UIScreen mainScreen].bounds.size.width -
                             (self.titleEdgeInsets.left + self.titleEdgeInsets.right),
                             MAXFLOAT);
    
    NSStringDrawingOptions opts =
    NSStringDrawingUsesLineFragmentOrigin |
    NSStringDrawingUsesFontLeading;
    
    NSDictionary *attrs = @{NSFontAttributeName : self.titleFont};
    
    _titleTextSize =
    [self.title boundingRectWithSize:size
                             options:opts
                          attributes:attrs
                             context:nil].size;
    
    return _titleTextSize;
}

#pragma mark - Update Views

- (void)updateBottomView {
    [self.bottomView mas_updateConstraints:^(MASConstraintMaker *make) {
        CGFloat height = (self.title.length > 0 ? self.titleTextSize.height + 2.0f + (self.titleEdgeInsets.top + self.titleEdgeInsets.bottom) : 0) + (self.otherButtonTitles.count > 0 ? (self.canScrolling ? MIN(self.visibleButtonCount, self.otherButtonTitles.count) : self.otherButtonTitles.count) * self.buttonHeight : 0) + (self.cancelButtonTitle.length > 0 ? 5.0f + self.buttonHeight : 0);
        make.height.equalTo(@(height));
    }];
}

- (void)updateTitleLabel {
    [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bottomView).offset(self.title.length > 0 ? self.titleEdgeInsets.top : 0);
        make.left.equalTo(self.bottomView).offset(self.titleEdgeInsets.left);
        make.right.equalTo(self.bottomView).offset(-self.titleEdgeInsets.right);
        
        CGFloat height = self.title.length > 0 ? self.titleTextSize.height + 2.0f : 0;  // Prevent omit
        make.height.equalTo(@(height));
    }];
}

- (void)updateTableView {
    if (!self.canScrolling) {
        [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@(self.otherButtonTitles.count * self.buttonHeight));
            make.top.equalTo(self.titleLabel.mas_bottom).offset(self.title.length > 0 ? self.titleEdgeInsets.bottom : 0);
        }];
    } else {
        [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@(MIN(self.visibleButtonCount, self.otherButtonTitles.count) * self.buttonHeight));
            make.top.equalTo(self.titleLabel.mas_bottom).offset(self.title.length > 0 ? self.titleEdgeInsets.bottom : 0);
        }];
    }
}

- (void)updateCancelButton {
    [self.divisionView mas_updateConstraints:^(MASConstraintMaker *make) {
        CGFloat height = self.cancelButtonTitle.length > 0 ? 5.0f : 0;
        make.height.equalTo(@(height));
    }];
    
    [self.cancelButton mas_updateConstraints:^(MASConstraintMaker *make) {
        CGFloat height = self.cancelButtonTitle.length > 0 ? self.buttonHeight : 0;
        make.height.equalTo(@(height));
    }];
}

#pragma mark - Show & Hide

- (void)show {
    if ([self.delegate respondsToSelector:@selector(willPresentActionSheet:)]) {
        [self.delegate willPresentActionSheet:self];
    }
    
    if (self.willPresentHandle) {
        self.willPresentHandle(self);
    }
    
    [self layoutIfNeeded];
    
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:self.animationDuration delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        weakSelf.darkView.alpha = self.darkOpacity;
        weakSelf.darkView.userInteractionEnabled = !self.darkViewNoTaped;
        
        [weakSelf.bottomView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self);
        }];
        
        [weakSelf layoutIfNeeded];
        
    } completion:^(BOOL finished) {
        
        if ([weakSelf.delegate respondsToSelector:@selector(didPresentActionSheet:)]) {
            [weakSelf.delegate didPresentActionSheet:self];
        }
        
        if (weakSelf.didPresentHandle) {
            weakSelf.didPresentHandle(self);
        }
    }];
}

- (void)hideWithButtonIndex:(NSInteger)buttonIndex {
    if ([self.delegate respondsToSelector:@selector(actionSheet:willDismissWithButtonIndex:)]) {
        [self.delegate actionSheet:self willDismissWithButtonIndex:buttonIndex];
    }
    
    if (self.willDismissHandle) {
        self.willDismissHandle(self, buttonIndex);
    }
    
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:self.animationDuration delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        weakSelf.darkView.alpha = 0;
        weakSelf.darkView.userInteractionEnabled = NO;
        
        [weakSelf.bottomView mas_updateConstraints:^(MASConstraintMaker *make) {
            CGFloat height = (self.title.length > 0 ? self.titleTextSize.height + 2.0f + (self.titleEdgeInsets.top + self.titleEdgeInsets.bottom) : 0) + (self.otherButtonTitles.count > 0 ? (self.canScrolling ? MIN(self.visibleButtonCount, self.otherButtonTitles.count) : self.otherButtonTitles.count) * self.buttonHeight : 0) + (self.cancelButtonTitle.length > 0 ? 5.0f + self.buttonHeight : 0);
            make.bottom.equalTo(self).offset(height);
        }];
        
        [weakSelf layoutIfNeeded];
        
    } completion:^(BOOL finished) {
        
        [weakSelf removeFromSuperview];
        
        if ([weakSelf.delegate respondsToSelector:@selector(actionSheet:didDismissWithButtonIndex:)]) {
            [weakSelf.delegate actionSheet:self didDismissWithButtonIndex:buttonIndex];
        }
        
        if (weakSelf.didDismissHandle) {
            weakSelf.didDismissHandle(self, buttonIndex);
        }
    }];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (!self.canScrolling) {
        scrollView.contentOffset = CGPointMake(0, 0);
    }
}

#pragma mark - LCActionSheet & UITableView Delegate

- (void)darkViewClicked {
    [self cancelButtonClicked];
}

- (void)cancelButtonClicked {
    if ([self.delegate respondsToSelector:@selector(actionSheet:clickedButtonAtIndex:)]) {
        [self.delegate actionSheet:self clickedButtonAtIndex:0];
    }
    
    if (self.clickedHandle) {
        self.clickedHandle(self, 0);
    }
    
    [self hideWithButtonIndex:0];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if ([self.delegate respondsToSelector:@selector(actionSheet:clickedButtonAtIndex:)]) {
        [self.delegate actionSheet:self clickedButtonAtIndex:indexPath.row + 1];
    }
    
    if (self.clickedHandle) {
        self.clickedHandle(self, indexPath.row + 1);
    }
    
    [self hideWithButtonIndex:indexPath.row + 1];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.otherButtonTitles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"LCActionSheetCell";
    LCActionSheetCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[LCActionSheetCell alloc] initWithStyle:UITableViewCellStyleDefault
                                        reuseIdentifier:cellID];
    }
    
    cell.titleLabel.font      = self.buttonFont;
    cell.titleLabel.textColor = self.buttonColor;
    
    cell.titleLabel.text = self.otherButtonTitles[indexPath.row];
    
    cell.cellSeparatorColor = self.separatorColor;
    
//    cell.lineView.hidden = indexPath.row == MAX(self.otherButtonTitles.count - 1, 0);
    
    if (indexPath.row == MAX(self.otherButtonTitles.count - 1, 0)) {
        cell.tag = LC_ACTION_SHEET_CELL_HIDDE_LINE_TAG;
    } else {
        cell.tag = LC_ACTION_SHEET_CELL_NO_HIDDE_LINE_TAG;
    }
    
    if (self.destructiveButtonIndexSet) {
        if ([self.destructiveButtonIndexSet lc_contains:(int)indexPath.row + 1]) {
            cell.titleLabel.textColor = self.destructiveButtonColor;
        } else {
            cell.titleLabel.textColor = self.buttonColor;
        }
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.buttonHeight;
}

@end
