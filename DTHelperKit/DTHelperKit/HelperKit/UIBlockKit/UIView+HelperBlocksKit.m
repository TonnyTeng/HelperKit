//
//  UIView+HelperBlocksKit.m
//  DTHelperKit
//
//  Created by dengtao on 2017/6/13.
//  Copyright © 2017年 JingXian. All rights reserved.
//

#import "UIView+HelperBlocksKit.h"
#import <objc/runtime.h>

static const void *s_tapGestureKey = "s_tapGestureKey";
static const void *s_longGestureKey = "s_longGestureKey";

@implementation UIView (HelperBlocksKit)

- (UITapGestureRecognizer *)tapGesture {
    return objc_getAssociatedObject(self, s_tapGestureKey);
}

- (UILongPressGestureRecognizer *)hyb_longGesure {
    return objc_getAssociatedObject(self, s_longGestureKey);
}

- (void)addTapGestureWithCallback:(TapGestureBlock)onTaped {
    self.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    tap.onTaped = onTaped;
    [self addGestureRecognizer:tap];
    
    objc_setAssociatedObject(self,
                             s_tapGestureKey,
                             tap,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)addLongGestureWithCallback:(LongGestureBlock)onLongPressed {
    self.userInteractionEnabled = YES;
    
    UILongPressGestureRecognizer *gesture = [[UILongPressGestureRecognizer alloc] init];
    gesture.onLongPressed = onLongPressed;
    [self addGestureRecognizer:gesture];
    
    objc_setAssociatedObject(self,
                             s_longGestureKey,
                             gesture,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
