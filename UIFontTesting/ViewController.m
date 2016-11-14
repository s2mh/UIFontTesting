//
//  ViewController.m
//  UIFontTesting
//
//  Created by Tom on 16/6/13.
//  Copyright © 2016年 s2mh. All rights reserved.
//

#include <CoreText/CTFontManager.h>

#import "ViewController.h"
#import "FontFamilyViewController.h"

#import "AscenderLabel.h"
#import "XHeightLabel.h"
#import "ZonedLabel.h"
#import "CapHeightLabel.h"

@interface ViewController ()

@property (nonatomic, strong) UIScrollView *scrollview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"SystemFont";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"FontFamilies" style:UIBarButtonItemStylePlain target:self action:@selector(buttonItemAction)];
    
    [self.view addSubview:self.scrollview];
    [self addSubviews];
}

#pragma mark - action

- (void)buttonItemAction {
    FontFamilyViewController *vc = [[FontFamilyViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - private

- (void)addSubviews {
    NSMutableString *string = [NSMutableString string];
    UIFont *f  = [UIFont systemFontOfSize:10.0];
    UIFont *f2 = [UIFont systemFontOfSize:20.0f];
    
    [string appendString:[NSString stringWithFormat:@"pointSize  = %10f      %10f\n", f.pointSize,  f2.pointSize]];
    [string appendString:[NSString stringWithFormat:@"ascender   = %10f      %10f\n", f.ascender,   f2.ascender]];
    [string appendString:[NSString stringWithFormat:@"descender  = %10f      %10f\n", f.descender,  f2.descender]];
    [string appendString:[NSString stringWithFormat:@"capHeight  = %10f      %10f\n", f.capHeight,  f2.capHeight]];
    [string appendString:[NSString stringWithFormat:@"xHeight    = %10f      %10f\n", f.xHeight,    f2.xHeight]];
    [string appendString:[NSString stringWithFormat:@"lineHeight = %10f      %10f\n", f.lineHeight, f2.lineHeight]];
    [string appendString:[NSString stringWithFormat:@"***************************************\n"]];
    [string appendString:[NSString stringWithFormat:@"ascender - descender == lineHeight\n"]];
    [string appendString:[NSString stringWithFormat:@"             %10f      %10f\n", (f.ascender - f.descender),  (f2.ascender - f2.descender)]];
    [string appendString:[NSString stringWithFormat:@"***************************************\n"]];
    [string appendString:[NSString stringWithFormat:@"leading    = %10f      %10f\n", f.leading,    f2.leading]];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = string;
    label.font = [UIFont fontWithName:@"Menlo-Regular" size:12.0f];
    label.numberOfLines = 0;
    CGSize size = [string sizeWithAttributes:@{NSFontAttributeName:label.font}];
    label.frame = CGRectMake(10.0f, 10.0f, size.width, size.height);
    
    CGFloat interval = 50.0f;
    CGFloat h = CGRectGetMaxY(label.frame) - interval;
    CGFloat w = 300.0f;
    
    NSString *testString = @"ABFGIabfgi 字 ∑å∆˚∫";
    
    ZonedLabel *zonedLabel = [[ZonedLabel alloc] init];
    zonedLabel.font = f2;
    zonedLabel.text = testString;
    zonedLabel.frame = CGRectMake(10.0f, (h += interval), w, f2.lineHeight);
    
    CapHeightLabel *capHeightLabel = [[CapHeightLabel alloc] init];
    capHeightLabel.font = f2;
    capHeightLabel.text = [NSString stringWithFormat:@"capHeight: %@", @"大写字母的高度"];
    capHeightLabel.frame = CGRectMake(10.0f, (h += interval), w, f2.lineHeight);
    
    XHeightLabel *xHeightLabel = [[XHeightLabel alloc] init];
    xHeightLabel.backgroundColor = [UIColor grayColor];
    xHeightLabel.font = f2;
    xHeightLabel.text = [NSString stringWithFormat:@"xHeight: %@", @"'x'即小写字母的高度"];
    xHeightLabel.frame = CGRectMake(10.0f, (h += interval), w, f2.lineHeight);
    
    AscenderLabel *ascenderLabel = [[AscenderLabel alloc] init];
    ascenderLabel.font = f2;
    ascenderLabel.text = [NSString stringWithFormat:@"ascender: %@", testString];
    ascenderLabel.frame = CGRectMake(10.0f, (h += interval), w, f2.lineHeight);
    
    UILabel *chineseLabel = [[UILabel alloc] init];
    chineseLabel.backgroundColor = [UIColor cyanColor];
    chineseLabel.font = f2;
    chineseLabel.text = @"默认字体的汉字高度==ascender";
    chineseLabel.frame = CGRectMake(10.0f, (h += interval), w, f2.ascender);
    
    self.scrollview.contentSize = CGSizeMake(self.scrollview.contentSize.width, CGRectGetMaxY(zonedLabel.frame));
    
    [self.scrollview addSubview:label];
    [self.scrollview addSubview:xHeightLabel];
    [self.scrollview addSubview:capHeightLabel];
    [self.scrollview addSubview:ascenderLabel];
    [self.scrollview addSubview:chineseLabel];
    [self.scrollview addSubview:zonedLabel];
}

#pragma mark - accessor

- (UIScrollView *)scrollview {
    if (!_scrollview) {
        _scrollview = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    }
    return _scrollview;
}

@end
