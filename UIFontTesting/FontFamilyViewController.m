//
//  FontFamilyViewController.m
//  UIFontTesting
//
//  Created by 颜为晨 on 16/6/16.
//  Copyright © 2016年 s2mh. All rights reserved.
//

#import "FontFamilyViewController.h"

@interface FontFamilyViewController ()

@property (nonatomic, strong) UIScrollView *scrollview;

@end

@implementation FontFamilyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"FontFamilies";
    
    [self.view addSubview:self.scrollview];
    [self addSubviews];
}

#pragma mark - action

- (void)buttonItemAction {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - private

- (void)addSubviews {
    CGFloat x = 10.0f;
    __block CGFloat y = 10.0f;
    CGFloat w = 300.0f;
    
    [[UIFont familyNames] enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIFont *font = [UIFont fontWithName:obj size:10.0f];
        CGFloat h = font.lineHeight + font.leading;
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(x, y, w, h)];
        label.font = font;
        label.backgroundColor = [UIColor grayColor];
        label.text = [NSString stringWithFormat:@"汉字字体%@ %f %f", obj, font.lineHeight, font.leading];
        [self.scrollview addSubview:label];
        y += h + 5.0f;
        self.scrollview.contentSize = CGSizeMake(self.scrollview.contentSize.width, y);
    }];
}

#pragma mark - accessor

- (UIScrollView *)scrollview {
    if (!_scrollview) {
        _scrollview = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    }
    return _scrollview;
}

@end
