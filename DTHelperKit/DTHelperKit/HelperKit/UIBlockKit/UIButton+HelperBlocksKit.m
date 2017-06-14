//
//  UIButton+HelperBlocksKit.m
//  DTHelperKit
//
//  Created by dengtao on 2017/6/13.
//  Copyright © 2017年 JingXian. All rights reserved.
//

#import "UIButton+HelperBlocksKit.h"

@implementation UIButton (HelperBlocksKit)


+ (instancetype)buttonWithTouchUp:(ButtonBlock)onTouchUp {
    return [self buttonWithSuperView:nil constraints:nil touchUp:onTouchUp];
}

+ (instancetype)buttonWithSuperView:(UIView *)superView
                            constraints:(ConstraintMaker)constraints
                                touchUp:(ButtonBlock)touchUp {
    return [self buttonWithTitle:nil
                           superView:superView
                         constraints:constraints
                             touchUp:touchUp];
}

+ (instancetype)buttonWithTitle:(NSString *)title
                          superView:(UIView *)superView
                        constraints:(ConstraintMaker)constraints
                            touchUp:(ButtonBlock)touchUp {
    return [self private_buttonWithTitle:title
                                       image:nil
                                    selImage:nil
                                   superView:superView
                                 constraints:constraints
                                     touchUp:touchUp];
}

+ (instancetype)buttonWithImage:(id)image
                          superView:(UIView *)superView
                        constraints:(ConstraintMaker)constraints
                            touchUp:(ButtonBlock)touchUp {
    return [self buttonWithImage:image
                       selectedImage:nil
                           superView:superView
                         constraints:constraints
                             touchUp:touchUp];
}

+ (instancetype)buttonWithImage:(id)image
                      selectedImage:(id)selectedImage
                          superView:(UIView *)superView
                        constraints:(ConstraintMaker)constraints
                            touchUp:(ButtonBlock)touchUp {
    return [self private_buttonWithTitle:nil
                                       image:image
                                    selImage:selectedImage
                                   superView:superView
                                 constraints:constraints
                                     touchUp:touchUp];
}

#pragma mark - Private
+ (instancetype)private_buttonWithTitle:(NSString *)title
                                      image:(id)image
                                   selImage:(id)selImage
                                  superView:(UIView *)superView
                                constraints:(ConstraintMaker)constaints
                                    touchUp:(ButtonBlock)touchUp {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.onTouchUp = touchUp;
    
    if (!kIsEmptyString(title)) {
        [button setTitle:title forState:UIControlStateNormal];
    }
    
    UIImage *normalImage = nil;
    if ([image isKindOfClass:[NSString class]]) {
        normalImage = kImage(image);
    } else if ([image isKindOfClass:[UIImage class]]) {
        normalImage = image;
    }
    
    UIImage *selectedImage = nil;
    if ([selImage isKindOfClass:[NSString class]]) {
        selectedImage = kImage(selImage);
    } else if ([selImage isKindOfClass:[UIImage class]]) {
        selectedImage = selImage;
    }
    
    if (normalImage) {
        [button setImage:normalImage forState:UIControlStateNormal];
    }
    
    if (selectedImage) {
        [button setImage:selectedImage forState:UIControlStateSelected];
    }
    
    [superView addSubview:button];
    
    if (superView && constaints) {
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            constaints(make);
        }];
    }
    
    return button;
}

@end
