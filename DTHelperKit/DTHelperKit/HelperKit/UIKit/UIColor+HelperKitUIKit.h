//
//  UIColor+HelperKitUIKit.h
//  DTHelperKit
//
//  Created by dengtao on 2017/6/13.
//  Copyright © 2017年 JingXian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HelperKitUIKit)

/**
 *
 *	Generate an image with current color, and the image size will be set to {1, 1}
 *
 *	@return UIImage instance.
 */
- (UIImage *)toImage;

/**
 *
 *	Generate an image with the color and size will be {1, 1}
 *
 *	@param color	The color to generate image.
 *
 *	@return UIImage instance.
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

/**
 *
 *	Generate an image to the specified size with current color.
 *
 *	@param size	The returning image size.
 *
 *	@return The image instance.
 */
- (UIImage *)toImageWithSize:(CGSize)size;

/**
 *
 *	Generate an image to the specified size with specified color.
 *
 *	@param color	The color to be used to generate an image.
 *	@param size	The result image size.
 *
 *	@return The image instance.
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;


+ (UIColor *)fromHexValue:(NSUInteger)hex;
+ (UIColor *)fromHexValue:(NSUInteger)hex alpha:(CGFloat)alpha;

+ (UIColor *)fromShortHexValue:(NSUInteger)hex;
+ (UIColor *)fromShortHexValue:(NSUInteger)hex alpha:(CGFloat)alpha;

+ (UIColor *)colorHexString:(NSString *)hex;

@end
