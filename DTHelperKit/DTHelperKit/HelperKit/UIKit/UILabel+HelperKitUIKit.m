//
//  UILabel+HelperKitUIKit.m
//  DTHelperKit
//
//  Created by dengtao on 2017/6/14.
//  Copyright © 2017年 JingXian. All rights reserved.
//

#import "UILabel+HelperKitUIKit.h"
#import "CommonKit.h"

@implementation UILabel (HelperKitUIKit)

+ (instancetype)labelWithFont:(CGFloat)font {
    return [self labelWithText:nil font:font];
}

+ (instancetype)labelWithText:(NSString *)text font:(CGFloat)font {
    return [self labelWithText:text font:font superView:nil];
}

+ (instancetype)labelWithText:(NSString *)text
                             font:(CGFloat)font
                        superView:(UIView *)superView {
    return [self labelWithText:text
                              font:font
                             lines:1
                         superView:superView];
}

+ (instancetype)labelWithFont:(CGFloat)font
                        superView:(UIView *)superView {
    return [self labelWithText:nil
                              font:font
                         superView:superView];
}

+ (instancetype)labelWithText:(NSString *)text
                             font:(CGFloat)font
                            lines:(NSInteger)lines
                        superView:(UIView *)superView {
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.font = kFontWithSize(font);
    label.textAlignment = NSTextAlignmentLeft;
    label.textColor = kBlackColor;
    label.backgroundColor = kClearColor;
    label.numberOfLines = lines;
    
    if (lines <= 0) {
        label.lineBreakMode = NSLineBreakByWordWrapping;
    } else {
        label.lineBreakMode = NSLineBreakByTruncatingTail;
    }
    
    [superView addSubview:label];
    
    return label;
}

@end
