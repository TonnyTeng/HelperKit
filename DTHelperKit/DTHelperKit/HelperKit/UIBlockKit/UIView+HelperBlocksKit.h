//
//  UIView+HelperBlocksKit.h
//  DTHelperKit
//
//  Created by dengtao on 2017/6/13.
//  Copyright © 2017年 JingXian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HelperKit.h"

@interface UIView (HelperBlocksKit)

@property (nonatomic, strong, readonly) UITapGestureRecognizer *tapGesture;
@property (nonatomic, strong, readonly) UILongPressGestureRecognizer *longGesure;

- (void)addTapGestureWithCallback:(TapGestureBlock)onTaped;

- (void)addLongGestureWithCallback:(LongGestureBlock)onLongPressed;

@end
