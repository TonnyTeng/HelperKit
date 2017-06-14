//
//  UIControl+HelperBlocksKit.m
//  DTHelperKit
//
//  Created by dengtao on 2017/6/13.
//  Copyright © 2017年 JingXian. All rights reserved.
//

#import "UIControl+HelperBlocksKit.h"
#import <objc/runtime.h>

static const void *s_ButtonTouchUpKey = "s_ButtonTouchUpKey";
static const void *s_ButtonTouchDownKey = "s_ButtonTouchDownKey";
static const void *s_OnValueChangedKey = "s_OnValueChangedKey";
static const void *s_OnEditChangedKey = "s_OnEditChangedKey";

@implementation UIControl (HelperBlocksKit)

- (ButtonBlock)hyb_onTouchUp {
    return objc_getAssociatedObject(self, s_ButtonTouchUpKey);
}

- (void)setOnTouchUp:(ButtonBlock)hyb_onTouchUp {
    objc_setAssociatedObject(self, s_ButtonTouchUpKey, hyb_onTouchUp, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [self removeTarget:self
                action:@selector(hyb_private_onTouchUp:)
      forControlEvents:UIControlEventTouchUpInside];
    
    if (hyb_onTouchUp) {
        [self addTarget:self
                 action:@selector(hyb_private_onTouchUp:)
       forControlEvents:UIControlEventTouchUpInside];
    }
}

- (ButtonBlock)hyb_onTouchDown {
    return objc_getAssociatedObject(self, s_ButtonTouchDownKey);
}

- (void)setOnTouchDown:(ButtonBlock)onTouchDown {
    [self removeTarget:self
                action:@selector(private_onTouchDown:)
      forControlEvents:UIControlEventTouchDown];
    
    if (onTouchDown) {
        [self addTarget:self
                 action:@selector(private_onTouchDown:)
       forControlEvents:UIControlEventTouchDown];
    }
    
    objc_setAssociatedObject(self,
                             s_ButtonTouchDownKey,
                             onTouchDown,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (ValueChangedBlock)hyb_onValueChanged {
    return objc_getAssociatedObject(self, s_OnValueChangedKey);
}

- (void)setOnValueChanged:(ValueChangedBlock)onValueChanged {
    objc_setAssociatedObject(self,
                             s_OnValueChangedKey,
                             onValueChanged,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [self removeTarget:self
                action:@selector(private_onValueChanged:)
      forControlEvents:UIControlEventValueChanged];
    
    if (onValueChanged) {
        [self addTarget:self
                 action:@selector(private_onValueChanged:)
       forControlEvents:UIControlEventValueChanged];
    }
}

- (EditChangedBlock)onEditChanged {
    return objc_getAssociatedObject(self, s_OnEditChangedKey);
}

- (void)setOnEditChanged:(EditChangedBlock)onEditChanged {
    objc_setAssociatedObject(self,
                             s_OnEditChangedKey,
                             onEditChanged,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [self removeTarget:self
                action:@selector(private_onEditChanged:)
      forControlEvents:UIControlEventEditingChanged];
    
    if (onEditChanged) {
        [self addTarget:self
                 action:@selector(private_onEditChanged:)
       forControlEvents:UIControlEventEditingChanged];
    }
}

#pragma mark - Private
- (void)hyb_private_onTouchUp:(id)sender {
    ButtonBlock block = [self onTouchUp];
    
    if (block) {
        block(sender);
    }
}

- (void)private_onTouchDown:(id)sender {
    ButtonBlock block = [self onTouchDown];
    
    if (block) {
        block(sender);
    }
}

- (void)private_onValueChanged:(id)sender {
    ValueChangedBlock block = [self onValueChanged];
    
    if (block) {
        block(sender);
    }
}

- (void)private_onEditChanged:(id)sender {
    EditChangedBlock block = [self onEditChanged];
    
    if (block) {
        block(sender);
    }
}

@end
