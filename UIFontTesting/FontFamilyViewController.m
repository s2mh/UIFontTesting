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
    __block NSInteger familyCount = 0;
    __block NSInteger fontCount = 0;
    [[UIFont familyNames] enumerateObjectsUsingBlock:^(NSString * _Nonnull familyName, NSUInteger idx, BOOL * _Nonnull stop) {
        familyCount++;
        NSArray<NSString *> *fontNames = [UIFont fontNamesForFamilyName:familyName];
        [fontNames enumerateObjectsUsingBlock:^(NSString * _Nonnull fontName, NSUInteger idx, BOOL * _Nonnull stop) {
            fontCount++;
            UIFont *font = [UIFont fontWithName:fontName size:10.0f];
            CGFloat h = font.lineHeight + font.leading;
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(x, y, w, h)];
            label.font = font;
            label.backgroundColor = [UIColor grayColor];
            label.text = [NSString stringWithFormat:@"%@ %@ 汉字", font.familyName, font.fontName];
            [self.scrollview addSubview:label];
            y += h + 5.0f;
            self.scrollview.contentSize = CGSizeMake(self.scrollview.contentSize.width, y);
            if ([fontName hasPrefix:@"Ping"]) {
                NSLog(@"%@ %@", font.familyName, font.fontName);
            }
        }];
    }];
    self.navigationItem.title = [NSString stringWithFormat:@"%ld Families, %ld Kinds", (long)familyCount, (long)fontCount];
}

#pragma mark - accessor

- (UIScrollView *)scrollview {
    if (!_scrollview) {
        _scrollview = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    }
    return _scrollview;
}

@end
