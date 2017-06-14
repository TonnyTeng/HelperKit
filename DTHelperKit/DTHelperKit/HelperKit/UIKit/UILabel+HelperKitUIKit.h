//
//  UILabel+HelperKitUIKit.h
//  DTHelperKit
//
//  Created by dengtao on 2017/6/14.
//  Copyright © 2017年 JingXian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (HelperKitUIKit)

+ (instancetype)labelWithFont:(CGFloat)font;

+ (instancetype)labelWithText:(NSString *)text
                         font:(CGFloat)font;

+ (instancetype)labelWithFont:(CGFloat)font
                    superView:(UIView *)superView;

+ (instancetype)labelWithText:(NSString *)text
                         font:(CGFloat)font
                    superView:(UIView *)superView;


+ (instancetype)labelWithText:(NSString *)text
                         font:(CGFloat)font
                        lines:(NSInteger)lines
                    superView:(UIView *)superView;

@end
