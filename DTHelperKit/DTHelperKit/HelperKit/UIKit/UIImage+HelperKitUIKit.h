//
//  UIImage+HelperKitUIKit.h
//  DTHelperKit
//
//  Created by dengtao on 2017/6/13.
//  Copyright © 2017年 JingXian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (HelperKitUIKit)

- (UIImage *)rounded;
- (UIImage *)rounded:(CGRect)rect;

- (UIImage *)scaleToSize:(CGSize)size;
+ (UIImage *)imageCompressForSize:(UIImage *)sourceImage targetSize:(CGSize)size;
+ (UIImage *)imageCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth;
+ (UIImage *)imageCompressForHeight:(UIImage *)sourceImage targetHeight:(CGFloat)defineHeight;

- (UIImage *)stretched;
- (UIImage *)grayscale;

- (UIColor *)patternColor;

+ (UIImage *)stretchableImageNamed:(NSString *)imageName;
+ (UIImage *)imageWithColor:(UIColor *)color;


@end
