//
//  UIButton+HelperBlocksKit.h
//  DTHelperKit
//
//  Created by dengtao on 2017/6/13.
//  Copyright © 2017年 JingXian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HelperBlocksKit.h"
#import "CommonKit.h"

@interface UIButton (HelperBlocksKit)


+ (instancetype)buttonWithTouchUp:(ButtonBlock)onTouchUp;

+ (instancetype)buttonWithSuperView:(UIView *)superView
                        constraints:(ConstraintMaker)constraints
                            touchUp:(ButtonBlock)touchUp;

+ (instancetype)buttonWithTitle:(NSString *)title
                      superView:(UIView *)superView
                    constraints:(ConstraintMaker)constraints
                        touchUp:(ButtonBlock)touchUp;

+ (instancetype)buttonWithImage:(id)image
                      superView:(UIView *)superView
                    constraints:(ConstraintMaker)constraints
                        touchUp:(ButtonBlock)touchUp;

+ (instancetype)buttonWithImage:(id)image
                  selectedImage:(id)selectedImage
                      superView:(UIView *)superView
                    constraints:(ConstraintMaker)constraints
                        touchUp:(ButtonBlock)touchUp;


@end
