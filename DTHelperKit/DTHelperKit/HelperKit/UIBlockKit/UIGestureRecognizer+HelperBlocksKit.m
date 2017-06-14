//
//  UIGestureRecognizer+HelperBlocksKit.m
//  DTHelperKit
//
//  Created by dengtao on 2017/6/13.
//  Copyright © 2017年 JingXian. All rights reserved.
//

#import "UIGestureRecognizer+HelperBlocksKit.h"
#import <objc/runtime.h>

static const void *s_gestureKey = "s_gestureKey";
static const void *s_tap_gestureKey = "s_tap_gestureKey";
static const void *s_long_gestureKey = "s_long_gestureKey";

@implementation UIGestureRecognizer (HelperBlocksKit)

- (GestureBlock)_onGesture {
    return objc_getAssociatedObject(self, s_gestureKey);
}

- (void)setOnGesture:(GestureBlock)onGesture {
    objc_setAssociatedObject(self,
                             s_gestureKey,
                             onGesture,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [self removeTarget:self action:@selector(private_onGesture:)];
    
    if (onGesture) {
        [self addTarget:self action:@selector(private_onGesture:)];
    }
}

- (TapGestureBlock)onTaped {
    return objc_getAssociatedObject(self, s_tap_gestureKey);
}

- (void)setOnTaped:(TapGestureBlock)onTaped {
    objc_setAssociatedObject(self,
                             s_tap_gestureKey,
                             onTaped,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [self removeTarget:self action:@selector(private_onTaped:)];
    
    if (onTaped) {
        [self addTarget:self action:@selector(private_onTaped:)];
    }
}

- (LongGestureBlock)onLongPressed {
    return objc_getAssociatedObject(self, s_long_gestureKey);
}

- (void)setOnLongPressed:(LongGestureBlock)onLongPressed {
    objc_setAssociatedObject(self,
                             s_long_gestureKey,
                             onLongPressed,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [self removeTarget:self action:@selector(private_onLongPressed:)];
    
    if (onLongPressed) {
        [self addTarget:self action:@selector(private_onLongPressed:)];
    }
}

#pragma mark - Private
- (void)private_onGesture:(UIGestureRecognizer *)sender {
    GestureBlock block = [self onGesture];
    
    if (block) {
        block(sender);
    }
}

- (void)private_onTaped:(UITapGestureRecognizer *)sender {
    TapGestureBlock block = [self onTaped];
    
    if (block) {
        block(sender);
    }
}

- (void)private_onLongPressed:(UILongPressGestureRecognizer *)sender {
    LongGestureBlock block = [self onLongPressed];
    
    if (block) {
        block(sender);
    }
}


@end
