//
//  UIView+HelperKitUIKit.h
//  DTHelperKit
//
//  Created by dengtao on 2017/6/13.
//  Copyright © 2017年 JingXian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HelperKitUIKit)

@property (nonatomic, assign) CGFloat x;

@property (nonatomic, assign) CGFloat y;

@property (nonatomic, assign) CGFloat centerX;

@property (nonatomic, assign) CGFloat centerY;

@property (nonatomic, assign) CGFloat width;

@property (nonatomic, assign) CGFloat height;

@property (nonatomic, assign) CGSize  size;

@property (nonatomic, assign) CGFloat bottomY;

@property (nonatomic, assign) CGFloat rightX;

- (void)setCorner:(CGFloat)corner;

- (void)setBorder:(CGFloat)border color:(UIColor *)color;

- (void)setShadow:(CGSize)offset corner:(CGFloat)corner opacity:(CGFloat)opacity color:(UIColor *)color;



@end
