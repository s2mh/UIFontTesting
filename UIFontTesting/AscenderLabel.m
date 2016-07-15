//
//  AscenderLabel.m
//  Bottombutton
//
//  Created by Tom on 16/6/13.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "AscenderLabel.h"

@implementation AscenderLabel

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [UIColor grayColor].CGColor);
    CGContextFillRect(context, CGRectMake(0.0f, 0.0f, self.frame.size.width, self.frame.size.height));
    CGContextFillPath(context);
    
    CGContextSetFillColorWithColor(context, [UIColor cyanColor].CGColor);
    CGContextFillRect(context, CGRectMake(0.0f, 0.0f, self.frame.size.width, self.font.ascender));
    CGContextFillPath(context);
    [super drawRect:rect];
}

@end
