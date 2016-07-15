//
//  CapHeightLabel.m
//  UIFontTesting
//
//  Created by 颜为晨 on 16/6/28.
//  Copyright © 2016年 s2mh. All rights reserved.
//

#import "CapHeightLabel.h"

@implementation CapHeightLabel

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [UIColor grayColor].CGColor);
    CGContextFillRect(context, CGRectMake(0.0f, 0.0f, self.frame.size.width, self.frame.size.height));
    CGContextFillPath(context);
    
    CGContextSetFillColorWithColor(context, [UIColor cyanColor].CGColor);
    CGContextFillRect(context, CGRectMake(0.0f, self.font.ascender - self.font.capHeight, self.frame.size.width, self.font.capHeight));
    CGContextFillPath(context);
    
    [super drawRect:rect];
}

@end
