
//
//  ZonedLabel.m
//  UIFontTesting
//
//  Created by 颜为晨 on 16/6/28.
//  Copyright © 2016年 s2mh. All rights reserved.
//

#import "ZonedLabel.h"

@implementation ZonedLabel

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [UIColor grayColor].CGColor);
    CGContextFillRect(context, CGRectMake(0.0f, 0.0f, self.frame.size.width, self.font.ascender - self.font.xHeight));
    CGContextFillPath(context);
    
    CGContextSetFillColorWithColor(context, [UIColor cyanColor].CGColor);
    CGContextFillRect(context, CGRectMake(0.0f, self.font.ascender - self.font.capHeight, self.frame.size.width, self.font.capHeight - self.font.xHeight));
    CGContextFillPath(context);
    
    CGContextSetFillColorWithColor(context, [UIColor yellowColor].CGColor);
    CGContextFillRect(context, CGRectMake(0.0f, self.font.ascender, self.frame.size.width, -self.font.descender));
    CGContextFillPath(context);
    
    [super drawRect:rect];
}

@end
