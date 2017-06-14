//
//  UIView+HelperKitUIKit.m
//  DTHelperKit
//
//  Created by dengtao on 2017/6/13.
//  Copyright © 2017年 JingXian. All rights reserved.
//

#import "UIView+HelperKitUIKit.h"

@implementation UIView (HelperKitUIKit)

- (void)setCorner:(CGFloat)corner{
    [self.layer setCornerRadius:corner];
    [self.layer setMasksToBounds:YES];
}

- (void)setBorder:(CGFloat)border color:(UIColor *)color{
    [self.layer setBorderWidth:border];
    [self.layer setBorderColor:color.CGColor];
}

- (void)setShadow:(CGSize)offset corner:(CGFloat)corner opacity:(CGFloat)opacity color:(UIColor *)color{
    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:corner];
    [self.layer setShadowOffset:offset];
    [self.layer setShadowOpacity:opacity];
    [self.layer setShadowColor:color.CGColor];
    [self.layer setShadowPath:shadowPath.CGPath];
}

- (void)setX:(CGFloat)x{

    self.frame = CGRectMake(x, self.y, self.width, self.height);
}

- (CGFloat)x {
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y{

    self.frame = CGRectMake(self.x, y, self.width, self.height);
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (void)setCenterX:(CGFloat)centerX{

    self.center = CGPointMake(centerX, self.centerY);
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.centerX, centerY);
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}
- (void)setWidth:(CGFloat)width {
    self.size = CGSizeMake(width, self.height);
}

- (CGFloat)width {
    return self.size.width;
}
- (void)setHeight:(CGFloat)height {
    self.size = CGSizeMake(self.width, height);
}

- (CGFloat)height {
    return self.size.height;
}

- (CGFloat)bottomY {
    return self.y + self.height;
}
- (void)setBottomY:(CGFloat)bottomY {
    self.y = bottomY - self.height;
}

- (CGFloat)rightX {
    return self.x + self.width;
}
- (void)setRightX:(CGFloat)rightX {
    self.x = rightX - self.width;
}


@end
